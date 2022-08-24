$homeFolderFiles = @('.vimrc', '.ideavimrc')
$otherConfigs = @{
    'Profile.ps1' = '~\Documents\PowerShell\Profile.ps1';
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
    New-SymLink "$wd\$file" "~\$file"
}

foreach ($pair in $otherConfigs.GetEnumerator()) {
    New-SymLink $pair.Key $pair.Value
}

Write-Host "Done."