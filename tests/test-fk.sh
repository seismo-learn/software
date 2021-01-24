#!/usr/bin/env bash

set -e -x

# install
wget http://www.eas.slu.edu/People/LZhu/downloads/fk3.3.tar
tar -xvf fk3.3.tar
mkdir -p ~/src/
mv fk ~/src/

cd ~/src/fk
# apply the patch
patch < ${GITHUB_WORKSPACE}/source/fk/fk3.3-v20190618.patch
# SAC is not available
# so have to comment out SACLIBs (lines 6-7)
sed -i.bak '6,7 s/^/#/' Makefile
# compile
make
make clean
export PATH=${HOME}/src/fk:${PATH}

# test
command -v fk
command -v fk.pl
command -v syn

set +e +x
