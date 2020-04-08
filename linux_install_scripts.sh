# Install script for new linux machine. Usage: sudo bash install.sh
# update
sudo apt-get update
sudo sleep 1

# install packages
echo '***************************'
echo 'Install packages processing'
echo '***************************'
sudo apt-get install -y git curl docker.io docker-compose openvpn snap

sudo sleep 1

# Re-update
echo '***************************'
echo 'Update processing'
echo '***************************'
sudo apt autoremove
sudo apt-get update

sudo sleep 1

# install nodejs & npm
echo '***************************'
echo 'Install node.js'
echo '***************************'
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

echo '***************************'
echo 'Use npm without sudo'
echo '***************************'
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.profile

sudo sleep 1

# install snapshot
echo '***************************'
echo 'Install snapshots'
echo '***************************'

echo '***************************'
echo '1. figma'
echo '***************************'
sudo snap install figma-linux

sudo sleep 1

echo '***************************'
echo '2. postman'
echo '***************************'
sudo snap install postman

sudo sleep 1

# install unikey
echo '***************************'
echo 'Install unikey'
echo '***************************'
sudo add-apt-repository ppa:teni-ime/ibus-teni
sudo apt-get update
sudo apt-get install -y ibus-teni
ibus restart

sudo sleep 1

echo '***************************'
echo 'Install successfully!'
echo '***************************'

# Restart
echo '***************************'
echo 'Auto restart after 3s'
echo '***************************'
sudo sleep 3
sudo init 6
