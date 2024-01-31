symlink() {
    ln -s $1 $2
}

cd ..
wd=$(pwd)

symlink "$wd/.vimrc" ~/.vimrc
symlink "$wd/.ideavimrc" ~/.ideavimrc
symlink "$wd/.vsvimrc" ~/vsvimrc
symlink "$wd/.profile" ~/.profile
symlink "$wd/.zshrc" ~/.zshrc