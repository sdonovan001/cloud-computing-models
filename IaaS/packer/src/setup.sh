#!/bin/bash

# Install OS packages 

apt-get update
apt-get upgrade -y
apt-get install -y vim
apt-get install -y wget

# Install miniconda python env

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
chmod a+x /tmp/miniconda.sh
/tmp/miniconda.sh -b -p /miniconda
rm -rf /tmp/miniconda.sh

# Install chart application non-standard python dependencies

export PATH=/miniconda/bin:$PATH
pip install flask --root-user-action=ignore
pip install matplotlib --root-user-action=ignore
pip install yfinance --root-user-action=ignore
pip install mplchart --root-user-action=ignore

# Install chart application

mkdir -p /applications/chart-app
cp /tmp/src/chart-app.py /applications/chart-app
cp /tmp/src/start.sh /applications/chart-app

# Create / enable systemd service for application

cp /tmp/src/chart-app.service /lib/systemd/system/
systemctl enable chart-app.service
