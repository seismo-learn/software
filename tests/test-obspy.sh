#!/usr/bin/env bash

# install
conda config --prepend channels conda-forge
conda create --name seismo-learn
conda activate seismo-learn
conda install obspy
conda install cartopy

# import obspy and check obspy version
[ $(python -c "import obspy; print(obspy.__version__)") == "1.2.2" ]

# clean up
