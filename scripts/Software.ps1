#Requires -RunAsAdministrator

<#
    .SYNOPSIS
        Installs software and packages, preparing the machine to be ready for work
#>

$chocoPackages = @(
    # Runtime
    'jdk8',
    # CLI
    'dos2unix',
    'grep',
    # Tools
    'vim',
    '7zip',
    'postman',
    'marktext'
)
$wingetPackages = @(
    # SDK
    'Microsoft.DotNet.SDK.6',
    'Microsoft.DotNet.SDK.3_1',
    'Microsoft.dotNetFramework',
    # Runtime
    'Python.Python.3.9',
    # Tools
    'Git.Git'
    'Microsoft.PowerToys',
    'Microsoft.VisualStudioCode',
    'Inkscape.Inkscape',
    # CLI
    'Microsoft.AzureCLI',
    'stedolan.jq'
)
$npmPackages = @(
    '@angular/cli',
    'typescript'
)
$manualPackages = @{
    'Visual Studio 2022' = 'https://visualstudio.microsoft.com/';
    'AHK v2' = 'https://www.autohotkey.com/download/ahk-v2.exe';
}
function Test-PackageManager {
    param ([string] $name)
    try {
        $version = &$name -v
        Write-Output "$name $version detected"
    }
    catch {
        $message = "$name is not installed"
        Write-Host $message
        throw $message
    }
}

function Install-Chocolatey {
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; `
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

function Update-EnvironmentPath {
    &$env:ProgramData\chocolatey\bin\RefreshEnv.cmd
}

Test-PackageManager "winget"
try { Test-PackageManager "choco" } catch {
    Install-Chocolatey
    Update-EnvironmentPath
}
try { Test-PackageManager "npm" } catch {
    Write-Output "Installing NVM and then Node LTS version"
    choco install nvm -y
    Update-EnvironmentPath
    nvm install lts
    nvm use lts
    Update-EnvironmentPath
}

$chocoPackages | ForEach-Object {
    choco install $_ -y
}
$wingetPackages | ForEach-Object {
    winget install -e --id $_ --accept-package-agreements --accept-source-agreements
}
$npmPackages | ForEach-Object {
    npm install -g $_
}

Write-Output "--- Install manually ---"
$manualPackages.GetEnumerator() `
    | Select-Object @{ N='Software'; E={$_.Name} }, @{ N='Link'; E={$_.Value} } `
    | Format-Table

Write-Output "Done"