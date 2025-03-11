#Requires -RunAsAdministrator

<#
    .SYNOPSIS
        Installs software and packages, preparing the machine to be ready for work
#>

$chocoPackages = @(
    # CLI
    'dos2unix',
    'grep',
    # Tools
    '7zip',
    'marktext'
)
$wingetPackages = @(
    # SDK
    'Microsoft.DotNet.SDK.8',
    'Microsoft.DotNet.SDK.3_1',
    'Microsoft.dotNetFramework',
    # Runtime
    'Python.Python.3.9',
    # Tools
    'Git.Git',
    'vim.vim',
    'Microsoft.VisualStudioCode',
    # CLI
    'stedolan.jq'
)
$npmPackages = @(
    '@angular/cli',
    'typescript'
)

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
    try {
        Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process -Force
    }
    catch [System.Security.SecurityException] { }
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
    if ((winget list $_) -match 'No installed package found') {
        winget install -e --id $_ --accept-package-agreements --accept-source-agreements
    }
    else {
        Write-Output "$_ is already installed"
    }
}
$npmPackages | ForEach-Object {
    npm install -g $_
}

Write-Output "Done"