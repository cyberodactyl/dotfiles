param(
    [Parameter(Mandatory=$false)]
    [string] $DestinationFolder,
    [switch] $ExcludeOtherConfigs
)

if ([string]::IsNullOrWhiteSpace($DestinationFolder)) {
    $DestinationFolder = "~\"
}

$homeFolderFiles = @('.vimrc', '.ideavimrc', '.vsvimrc')
$otherConfigs = @{
    'Profile.ps1' = '~\Documents\PowerShell\Profile.ps1';
    'vifmrc' = '~\.vifm\vifmrc';
}

function New-SymLink {
    param (
        [string] $source,
        [string] $destination
    )
    
    New-Item -ItemType SymbolicLink -Path $destination -Value $source
    Write-Host "Created symbolic link: $source ==> $destination";
}

Set-Location ..
$wd = Get-Location

foreach ($file in $homeFolderFiles) {
    New-SymLink "$wd\$file" "${DestinationFolder}${file}"
}

if (!$ExcludeOtherConfigs) {
    foreach ($pair in $otherConfigs.GetEnumerator()) {
        New-SymLink $pair.Key $pair.Value
    }
}

Write-Host "Done."