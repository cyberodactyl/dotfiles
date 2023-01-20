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

function Start-TerminalHere {
    wt -d .
}

# Config
Set-PSReadLineOption -BellStyle Visual -EditMode Emacs

# Aliases
Set-Alias ln New-Symlink
Set-Alias vim nvim
Set-Alias gvim nvim-qt
Set-Alias fm Start-Vifm
Set-Alias curl curl.exe
Set-Alias wthere Start-TerminalHere

# Variables
$global:x:dev = "C:\dev"
$global:dc = "C:\"
$global:ad = $env:APPDATA
$global:pf = $env:ProgramFiles

# Path modifications
Add-Path "~\.vifm\bin"