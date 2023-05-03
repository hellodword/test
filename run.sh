#! /bin/bash

set -e
set -x

curl -sSL $CURL_IPV6 -o ./wgcf \
            $(curl -sSL $CURL_IPV6 https://api.github.com/repos/ViRb3/wgcf/releases/latest \
              | grep "_linux_amd64\"" \
              | cut -d : -f 2,3 \
              | tr -d '"' \
              | grep 'releases/download' \
              | sed 's/^ \+//')

sudo chmod +x ./wgcf


echo | ./wgcf register
./wgcf generate

cat wgcf-profile.conf
