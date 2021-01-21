#!/usr/bin/env bash

set -e -x

# install
wget http://www.seis.sc.edu/software/distaz/distaz.c
cc distaz.c -o distaz -lm
mkdir -p ${HOME}/bin
mv distaz ${HOME}/bin
export PATH=${HOME}/bin:$PATH

# test
[ "$(distaz -10 14 40 -50)" == "77.218 314.930 114.795" ]

# cleanup
rm distaz.c

set +e +x
