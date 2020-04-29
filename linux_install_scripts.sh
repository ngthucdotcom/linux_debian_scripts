# Install script for new linux machine. Usage: sudo bash install.sh
# update
sudo apt-get update
sudo sleep 1

# install packages
echo ''
echo '***************************'
echo 'Install packages processing'
echo '***************************'
echo ''
sudo apt-get install -y git curl docker.io docker-compose openvpn snap wget

sudo sleep 1

# Re-update
echo ''
echo '***************************'
echo 'Update processing'
echo '***************************'
echo ''
sudo apt autoremove
sudo apt-get update

sudo sleep 1

# install nodejs & npm
echo ''
echo '***************************'
echo 'Install node.js'
echo '***************************'
echo ''
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

echo ''
echo '***************************'
echo 'Use npm without sudo'
echo '***************************'
echo ''
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'
export PATH=~/.npm-global/bin:$PATH
source ~/.profile
sudo chown -R $USER:$(id -gn $USER) /home/$USER/.config

sudo sleep 1

# install snapshot
echo ''
echo '***************************'
echo 'Install snapshots'
echo '***************************'
echo ''

echo ''
echo '***************************'
echo '1. visual studio code'
echo '***************************'
echo ''
sudo snap install code --classic

sudo sleep 1

echo ''
echo '***************************'
echo '2. gitkraken'
echo '***************************'
echo ''
sudo snap install gitkraken

sudo sleep 1

echo ''
echo '***************************'
echo '3. figma'
echo '***************************'
echo ''
sudo snap install figma-linux

sudo sleep 1

echo ''
echo '***************************'
echo '4. postman'
echo '***************************'
echo ''
sudo snap install postman

sudo sleep 1

# install unikey
echo ''
echo '***************************'
echo 'Install unikey'
echo '***************************'
echo ''
sudo add-apt-repository ppa:teni-ime/ibus-teni
sudo apt-get update
sudo apt-get install -y ibus-teni
ibus restart

sudo sleep 1

echo ''
echo '***************************'
echo 'Install successfully!'
echo '***************************'
echo ''

# Restart
echo ''
echo '***************************'
echo 'Auto restart after 5s'
echo '***************************'
echo ''
sudo sleep 5
sudo init 6
