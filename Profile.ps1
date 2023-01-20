# Functions
function New-Symlink {
    param (
        [string] $Reference,
        [string] $Origin,
        [switch] $ExpandSourcePath
    )
    if ($ExpandSourcePath) {
        $wd = Get-Location
        $Source = "$wd\$Source"
    }

    New-Item -ItemType SymbolicLink -Value $Origin -Path $Reference
} 

function Add-Path {
    param (
        [string] $Path
    )
    $env:Path += ";$Path"
}

function Start-Vifm {
    vifm --choose-dir - | Set-Location
}

# Config
Set-PSReadLineOption -BellStyle Visual -EditMode Emacs

# Aliases
Set-Alias ln New-Symlink
Set-Alias vim nvim
Set-Alias gvim nvim-qt
Set-Alias fm Start-Vifm
Set-Alias curl curl.exe

# Path modifications
Add-Path "~\.vifm\bin"