aptPackages=(
    'vim'
    'jq'
    'ranger'
    'dos2unix'
)

apt update

for package in $aptPackages; do
    apt install $package -y;
done