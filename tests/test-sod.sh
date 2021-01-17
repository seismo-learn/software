#!/usr/bin/env bash

set -e -x

# install
wget http://www.seis.sc.edu/downloads/sod/3.2.10/sod-3.2.10.tgz
tar -xf sod-3.2.10.tgz
mkdir -p ${HOME}/opt/
mv sod-3.2.10 ${HOME}/opt/
export PATH="${HOME}/opt/sod-3.2.10/bin":$PATH

# test
[ "$(sod -v)" == "SOD 3.2.10" ]

# cleanup
rm -r sod-3.2.10.tgz

set +e +x
