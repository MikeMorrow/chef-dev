#!/bin/bash

cwd=$(pwd)
scriptDir=$(dirname $(readlink -f $0))
cookbookLocation=$(find /tmp/vagrant-chef -type d -name devops)

cd $cookbookLocation
berks vendor /tmp/cookbooks

echo "cookbook_path \"/tmp/cookbooks\"" > ${scriptDir}/chef-solo.rb
chef-solo -c ${scriptDir}/chef-solo.rb -j ${scriptDir}/node.json

cd $cwd
