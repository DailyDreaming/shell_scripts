# update the system
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt install -y curl
sudo apt install -y libssl-dev libffi-dev
sudo apt install -y jq
sudo apt install -y python-pip


# install docker
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-16-04
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}

# install sublime-text
# http://tipsonubuntu.com/2017/05/30/install-sublime-text-3-ubuntu-16-04-official-way/
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install sublime-text

# install pycharm
# https://www.jetbrains.com/pycharm/download/download-thanks.html?platform=linux
sudo tar xf pycharm-professional-2017.3.4.tar.gz -C /opt/
cd /opt/pycharm-2017.3.4/bin
sh /opt/pycharm-2017.3.4/bin/pycharm.sh
# click top left "tool" menu -> "create desktop entry" (necessary to lock to launcher)

# install kicad
# install tensorflow
# install cuda+
# install keras

# python
sudo pip install matplotlib
sudo pip install bs4
sudo pip install virtualenv
sudo pip install biopython

# make dir for git
mkdir ~/git
# delete examples
sudo rm -rf ~/examples.desktop
# purge avahi deamon
sudo apt-get purge avahi-daemon

# install video player codecs
sudo apt-get install ubuntu-restricted-extras

# edit these
## /etc/apt/sources.list
## ~/.bashrc
