# ---------------------------------------------------------------------------
# Intended as include in installChefServer
# depends on external definition of:
#   rpmCache
# ---------------------------------------------------------------------------
echo "Installing chef development kit..."
rpmChefDK=chefdk-0.10.0-1.el7.x86_64.rpm
rpmChefDKLoc=https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/${rpmChefDK}
cacheFile ${rpmCache} ${rpmChefDK} ${rpmChefDKLoc}
#rpm -i --quiet ${rpmCache}/${rpmChefDK}
# Same install as above -- hopefully no warning
yum install --nogpgcheck -y -q ${rpmCache}/${rpmChefDK}
#chef verify #makes more sense to have user run this
