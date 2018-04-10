# update the system
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt install -y curl
sudo apt install -y libssl-dev libffi-dev
sudo apt install -y jq
sudo apt install -y python-pip
sudo apt install -y python3-pip
sudo apt install -y r-base-core
sudo apt install -y cryptsetup
sudo apt install -y compizconfig-settings-manager
sudo apt install -y gconf-editor
sudo apt install -y default-jdk

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

# git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# gnome settings (always show the path)
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

# mod pip to allow installing without sudo
sudo -H chmod 777 -R /home/{user}/.cache/pip

# set sublime text as the default editor
ls /usr/share/applications/sublime_text.desktop # make sure this exists
ls /usr/share/applications/sublime-text.desktop # might be this instead on some systems
sudo nano /usr/share/applications/defaults.list # find/replace 'gedit' with 'sublime_text' or 'sublime-text'

## /etc/apt/sources.list

## ~/.bashrc
alias sudo='sudo '
alias gittoil='git clone https://github.com/BD2KGenomics/toil.git'
alias mktoil='git clone https://github.com/BD2KGenomics/toil.git && cd toil && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]'
