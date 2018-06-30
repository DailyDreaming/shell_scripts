# update the system
sudo apt update
sudo apt -y upgrade
sudo apt -y dist-upgrade
sudo apt install -y curl
sudo apt install -y libssl-dev libffi-dev
sudo apt install -y jq
sudo apt install -y python-pip
sudo apt install -y python3-pip
# include bioconductor+
sudo apt install -y r-base-core
sudo apt install -y cryptsetup
sudo apt install -y compizconfig-settings-manager
sudo apt install -y gconf-editor
sudo apt install -y default-jdk
sudo apt install -y mysql-server libmysqlclient-dev
sudo apt install -y ncbi-blast+
sudo apt install -y p7zip-full
sudo apt install -y zip unzip
# requires an updated sources.list
sudo apt install -y libssl1.1

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
sudo apt install -y sublime-text

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
sudo pip install flask
# project specific
sudo pip install hca
sudo pip install wes-service

# make dir for git
mkdir ~/git
# delete examples
sudo rm -rf ~/examples.desktop
# purge avahi deamon
sudo apt-get purge avahi-daemon

# install video player codecs
sudo apt-get install ubuntu-restricted-extras
sudo apt install libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg
sudo dpkg-reconfigure libdvd-pkg # necessary to install libdvdcss2

## https://cloud.google.com/sdk/docs/quickstart-debian-ubuntu
# Create environment variable for correct distribution
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
# Add the Cloud SDK distribution URI as a package source
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
# Import the Google Cloud Platform public key
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# Update the package list and install the Cloud SDK
sudo apt-get update && sudo apt-get install google-cloud-sdk

# git
git config --global user.email "you@example.com"
git config --global user.name "Your Name"

# gnome settings (always show the path)
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

# mod pip to allow installing without sudo
sudo -H chmod 777 -R /home/{user}/.cache/pip

# update kernel here: http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.2/

# set sublime text as the default editor
ls /usr/share/applications/sublime_text.desktop # make sure this exists
ls /usr/share/applications/sublime-text.desktop # might be this instead on some systems
sudo nano /usr/share/applications/defaults.list # find/replace 'gedit' with 'sublime_text' or 'sublime-text'

## /etc/apt/sources.list
deb http://security.ubuntu.com/ubuntu bionic-security main

## ~/.bashrc
alias sudo='sudo '
alias gittoil='git clone https://github.com/BD2KGenomics/toil.git'
alias mktoil='git clone https://github.com/BD2KGenomics/toil.git && cd toil && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]'
mktoilb() { git clone https://github.com/BD2KGenomics/toil.git && cd toil && git checkout "$1" && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]; }
gittoilb() { git clone https://github.com/BD2KGenomics/toil.git && cd toil && git checkout "$1"; }
ppjson() { cat "$1" | jq ''; }
