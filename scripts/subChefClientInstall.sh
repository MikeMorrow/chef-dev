# ---------------------------------------------------------------------------
# Intended as include in installChefServer
# depends on external definition of:
#   rpmCache
# ---------------------------------------------------------------------------
echo "Installing chef client..."
# Script Install
chefScriptCache=/vagrant/.vagrant/cache/scripts/environment
chefScript=install.sh
chefScriptSource=https://www.opscode.com/chef/${chefScript}
cacheFile ${chefScriptCache} ${chefScript} ${chefScriptSource}
chmod 755 ${chefScriptCache}/${chefScript}
#${chefScriptCache}/${chefScript}
# RPM Install
rpmChefClient=chef-12.6.0-1.el7.x86_64.rpm
rpmChefClientLoc=https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/${rpmChefClient}
cacheFile ${rpmCache} ${rpmChefClient} ${rpmChefClientLoc}
#rpm -i --quiet ${rpmCache}/${rpmChefClient}
# Same install as above -- hopefully no warning
yum install --nogpgcheck -y -q ${rpmCache}/${rpmChefClient}
