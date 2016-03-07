#!/bin/bash

cookbookLocation=$(find /tmp/vagrant-chef -type d -name cookbooks)
echo "cookbook_path \"${cookbookLocation}\"" > chef-solo.rb

chef-solo -c chef-solo.rb -j node.json
