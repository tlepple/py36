#!/bin/bash

#########################################################
# utility functions
#########################################################
dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

log_dir=`pwd`

# logging function
log() {
    echo -e "[$(date)] [$BASH_SOURCE: $BASH_LINENO] : $*"
    echo -e "[$(date)] [$BASH_SOURCE: $BASH_LINENO] : $*" >> $log_dir/setup.log
}

#########################################################
# BEGIN
#########################################################
log "BEGIN setup.sh"

#########################################################
# Install yum tools
#########################################################
log "Install needed yum tools"

yum groupinstall -y 'development tools'
log "dev tools install ?"
yum install -y zlib-dev openssl-devel sqlite-devel bzip2-devel xz-libs wget libffi-devel cyrus-sasl-devel epel-release 
yum install -y python-pip

#########################################################
# Install isolated version of python v. 3.6.9
#########################################################
log "Install python3.6 from source"

# create directory
mkdir -p /usr/local/downloads

# change to dir
cd /usr/local/downloads

# download source
wget https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tar.xz

# unzip and untar this file:
xz -d Python-3.6.9.tar.xz
tar -xvf Python-3.6.9.tar

# change dir
cd Python-3.6.9

# build from source and install
./configure --prefix=/usr/local


# If you want a release build with all stable optimizations active (PGO, etc),
# please run ./configure --enable-optimizations

make
make altinstall


#########################################################
# Update pip
#########################################################
log "upgrade pip"
pip install --upgrade pip

#########################################################
# Update PATH and re-initialize
#########################################################
log "Update PATH"
sed -i '/^PATH=/ s/$/:\/usr\/local\/bin/' ~/.bash_profile

#log "source bash_profile"
source ~/.bash_profile

# make path visible
. ~/.bash_profile

#########################################################
#########################################################
# end
#########################################################
#########################################################
