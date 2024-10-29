if ((Test-Path "~\.vifm\vifm*binary") -or (Test-Path "~\.vifm\bin")) {
    Write-Host "Installed binary found" -ForegroundColor Red
    exit
}
$binaryArchive = Get-ChildItem -Path "~\Downloads" -Filter "vifm*binary.zip" | Select-Object -First 1
if (!$binaryArchive) {
    Write-Host "Binary archive not found, download at https://vifm.info/downloads.shtml"
}
if (Test-Path "~\.vifm") {
    Write-Host "Binary will be installed into existing .vifm directory"
} else {
    Write-Host "Creating .vifm directory"
    New-Item -ItemType Directory "~\.vifm"
}
Write-Host "Installing binary"
$expandedArchive = Expand-Archive $binaryArchive -DestinationPath "~\.vifm" -PassThru | Select-Object -First 1
Rename-Item $expandedArchive -NewName "bin"
Write-Host "Installing color scheme"
New-Item -ItemType Directory "~\.vifm\colors"
New-Symlink "..\assets\nazariia-colorscheme.vifm" "~\.vifm\colors\nazariia-colorscheme.vifm"
Write-Host "Done" -ForegroundColor Green