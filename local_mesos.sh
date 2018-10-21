
# Original Instructions
# https://dzone.com/articles/getting-started-with-mesos-1

# SOURCE
# http://archive.apache.org/dist/mesos/1.4.0/

# https://github.com/agracio/electron-edge-js/issues/16
# Needed if not using Ubuntu 14.04:
ln -s /usr/include/locale.h /usr/include/xlocale.h

sudo apt -y update
sudo apt install -y tar wget git openjdk-8-jdk python-virtualenv libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev

tar -zxf mesos-1.4.0.tar.gz
cd mesos
mkdir build
cd build
../configure
make
make check
make install
