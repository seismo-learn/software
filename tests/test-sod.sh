#!/usr/bin/env bash

set -e -x

# install
version="3.2.10"
wget http://www.seis.sc.edu/downloads/sod/${version}/sod-${version}.tgz
tar -xf sod-${version}.tgz
mkdir -p ${HOME}/opt/
mv sod-${version} ${HOME}/opt/
export PATH="${HOME}/opt/sod-${version}/bin":$PATH

# test
[ "$(sod -v)" == "SOD ${version}" ]

# cleanup
rm -r sod-${version}.tgz

set +e +x
