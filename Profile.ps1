Set-PSReadLineOption -BellStyle None -EditMode Emacs
Set-Alias vim nvim
Set-Alias gvim nvim-qt

function New-Symlink {
    param (
        [string] $Source,
        [string] $Destination,
        [switch] $ExpandSourcePath
    )
    if ($ExpandSourcePath) {
        $wd = Get-Location
        $Source = "$wd\$Source"
    }

    New-Item -ItemType SymbolicLink -Value $Destination -Path $Source
}
Set-Alias ln New-Symlink