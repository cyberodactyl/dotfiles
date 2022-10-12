Set-Location ..
$wd = (Get-Location).ToString().Replace("C:\", "/mnt/c/").Replace('\', '/')
wsl ln -s $wd ~/dotfiles
wsl ~/dotfiles/scripts/setup.sh