symlink() {
    ln -s $1 $2
}

cd ..
wd=$(pwd)
symlink "$wd/.vimrc-term" ~/.vimrc
symlink "$wd/.profile" ~/.profile