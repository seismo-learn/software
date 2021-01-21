#!/usr/bin/env bash

set -e -x

# install
version="2.4.5"
wget http://www.seis.sc.edu/downloads/TauP/TauP-${version}.tgz
tar -xvf TauP-${version}.tgz
mkdir -p ${HOME}/opt/
mv TauP-${version} ~/opt/
export PATH=${HOME}/opt/TauP-${version}/bin:${PATH}

# test
[ "$(taup_time --version)" == "edu.sc.seis:TauP:${version} Thu Nov 02 15:25:47 EDT 2017" ]

# cleanup
rm -r TauP-${version}.tgz

set +e +x
