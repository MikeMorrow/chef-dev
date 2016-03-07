#!/bin/bash
installDir=/vagrant/scripts
source ${installDir}/functions.sh
# ---------------------------------------------------------------------------
# Local rpm cache setup
# ---------------------------------------------------------------------------
rpmCache=/vagrant/.vagrant/cache/rpm
if [ ! -e ${rpmCache} ]; then
  mkdir -p ${rpmCache}
fi
# ---------------------------------------------------------------------------
# Repositories
# ---------------------------------------------------------------------------
yum update -y
yum install --nogpgcheck -y -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
# ---------------------------------------------------------------------------
# Package Install
# ---------------------------------------------------------------------------
yum install -y wget git
yum install -y net-tools
# ---------------------------------------------------------------------------
# Chef Installs
# ---------------------------------------------------------------------------
source ${installDir}/subChefClientInstall.sh
source ${installDir}/subChefDevKitInstall.sh
# ---------------------------------------------------------------------------
# Berksfile
# ---------------------------------------------------------------------------
sed -e "s|PATH=\$PATH:\$HOME/bin|PATH=/opt/chef/embedded/bin:\$PATH:\$HOME/bin|" -i ~/.bash_profile
source ~/.bash_profile
gem install berkshelf
gem install chefspec
gem install foodcritic
gem install test-kitchen
#berks install
