#!/bin/bash
echo "Update System"

apt-get -y update
apt-get -y upgrade

echo "Setup Ruby Environment"

cd /opt/project/backend
bundle install

rake db:migrate
