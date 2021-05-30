#!/usr/bin/env bash

set -e -x

# install
version="2.5.0"
wget http://www.seis.sc.edu/downloads/TauP/TauP-${version}.tgz
tar -xvf TauP-${version}.tgz
mkdir -p ${HOME}/opt/
mv TauP-${version} ~/opt/
export PATH=${HOME}/opt/TauP-${version}/bin:${PATH}

# test
[ "$(taup --version)" == "edu.sc.seis:TauP:${version} 2021-03-17T19:52:47Z (665 6b41bfa)"

# cleanup
rm -r TauP-${version}.tgz

set +e +x
