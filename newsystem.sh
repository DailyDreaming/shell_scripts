# update the system
sudo apt update && sudo apt -y upgrade && sudo apt -y dist-upgrade
sudo apt install -y curl
sudo apt install -y libssl-dev libffi-dev
# for pretty printing json
sudo apt install -y jq
sudo apt install -y python3-pip python-pip python3-dev python-dev
sudo apt install -y virtualenv
sudo apt install -y locate
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
sudo apt install -y flake8
sudo apt install -y golang-go
sudo apt install -y postgresql
# linear algebra libraries needed for opensim
# https://simtk-confluence.stanford.edu/display/OpenSim/Linux+Support
sudo apt install -y libblas-dev liblapack-dev
sudo apt install -y mesa-common-dev
# project gutenberg
sudo apt install -y yaz
# record videos of your screen
sudo apt install -y simplescreenrecorder
# pipe any text to this for wicked colors
sudo apt install -y lolcat
# network/penetration tool
sudo apt install -y nmap
# requires an updated sources.list
sudo apt install -y libssl1.1
# mesos reqs
sudo apt-get -y install build-essential python-six python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev
# perl modules (JSON) >.<
sudo apt install -y perl-docs
sudo cpan JSON

# https://stackoverflow.com/questions/22571848/debugging-the-error-gcc-error-x86-64-linux-gnu-gcc-no-such-file-or-directory
sudo apt-get install build-essential autoconf libtool pkg-config python-opengl python-pil python-pyrex python-pyside.qtopengl idle-python2.7 qt4-dev-tools qt4-designer libqtgui4 libqtcore4 libqt4-xml libqt4-test libqt4-script libqt4-network libqt4-dbus python-qt4 python-qt4-gl libgle3 python-dev

# install cloudwatch cli: https://github.com/lucagrulla/cw
go get github.com/lucagrulla/cw
export PATH="$PATH:/home/$USER/go/bin"

# rust https://www.rust-lang.org/en-US/install.html
curl https://sh.rustup.rs -sSf | sh

# calibre
sudo -v && wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sudo sh /dev/stdin

# project gutenberg API
# https://github.com/internetarchive/openlibrary-client
git clone https://github.com/internetarchive/openlibrary-client.git
cd openlibrary-client
pip install .

# install gimp
sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update
sudo apt install -y gimp

# eog replacement
sudo apt install -y viewnior

# Reset default limiting thumbnails to 10Mb files + 64 pixels
sudo apt install -y dconf-editor
dconf-editor
# org -> gnome -> nautilus -> preferences -> thumbnail-limit -> only files under (set a higher MB value and then try reloading)
# org -> gnome -> nautilus -> icon-view -> reset thumbnail size

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
# install mendeley: https://www.mendeley.com/download-desktop/

# python
sudo pip install -U matplotlib
sudo pip install -U bs4
sudo pip install -U virtualenv
sudo pip install -U biopython
sudo pip install -U flask
sudo pip install -U jupyter jupyter_client ipython
sudo pip install -U pandas
sudo pip install -U numpy
sudo pip install -U scipy
sudo pip install -U scikit-learn
sudo pip install -U boto
sudo pip install -U khmer
# project specific
sudo pip install hca
sudo pip install wes-service

# make dir for git
mkdir ~/git
# delete examples
sudo rm -rf ~/examples.desktop
# purge useless programs
sudo apt purge avahi-daemon
sudo apt purge rhythmbox
# https://help.ubuntu.com/community/AptGet/Howto
# remove all configuration data from every removed package
dpkg -l | grep '^rc' | awk '{print $2}' | xargs dpkg --purge

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
# https://git-scm.com/book/en/v2/Git-Tools-Credential-Storage#_credential_caching
git config --global credential.helper store

# gnome settings (always show the path)
gsettings set org.gnome.nautilus.preferences always-use-location-entry true

# cinnamon desktop
sudo add-apt-repository universe
sudo apt install cinnamon-desktop-environment lightdm
sudo dpkg-reconfigure lightdm

# mod pip to allow installing without sudo
sudo -H chmod 777 -R /home/$USER/.cache/pip

# insults when a password is incorrect
sudo visudo
# add "Defaults    insults"

# update kernel here: http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.16.2/

# set sublime text as the default editor
ls /usr/share/applications/sublime_text.desktop # make sure this exists
ls /usr/share/applications/sublime-text.desktop # might be this instead on some systems
sudo nano /usr/share/applications/defaults.list # find/replace 'gedit' with 'sublime_text' or 'sublime-text'

## /etc/apt/sources.list

## ~/.bashrc
alias sudo='sudo '
alias gittoil='git clone https://github.com/DataBiosphere/toil.git'
alias mktoil='git clone https://github.com/DataBiosphere/toil.git && cd toil && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]'
# https://wikileaks.org/ciav7p1/cms/page_1179773.html
alias gitfix='git commit --amend -C HEAD'
mktoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1" && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all]; }
testtoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1" && virtualenv venv && . venv/bin/activate && make prepare && make develop extras=[all] && make test; }
gittoilb() { git clone https://github.com/DataBiosphere/toil.git && cd toil && git checkout "$1"; }
ppjson() { cat "$1" | jq ''; }
# https://github.com/DailyDreaming/fetch_gs_frm_json/blob/master/dl_gsfiles_frm_json.py
gs_json() { python /usr/local/bin/dl_gsfiles_frm_json.py "$1"; }
