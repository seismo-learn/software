#!/usr/bin/env bash

set -e -x

# install
wget http://www.seis.sc.edu/downloads/TauP/TauP-2.4.5.tgz
tar -xvf TauP-2.4.5.tgz
mkdir -p ${HOME}/opt/
mv TauP-2.4.5 ~/opt/
export PATH=${HOME}/opt/TauP-2.4.5/bin:${PATH}

# test
[ "$(taup_time --version)" == "edu.sc.seis:TauP:2.4.5 Thu Nov 02 15:25:47 EDT 2017" ]

# cleanup
rm -r TauP-2.4.5.tgz

set +e +x
