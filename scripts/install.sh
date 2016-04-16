#! /bin/bash
set -e

buid_version="1.10"

# install curl (needed to install rust)
apt-get update && apt-get install -y build-essential curl

# download
curl -sL https://github.com/kr/beanstalkd/archive/v$buid_version.tar.gz | tar xvzf -C /tmp

# build and install
cd /tmp/beanstalkd-$buid_version
make
# make it globally available
cp beanstalkd /usr/bin

# clear out the installed packages
apt-get remove --purge -y curl build-essential 
apt-get autoclean
apt-get clean

# remove the redundant folders
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
