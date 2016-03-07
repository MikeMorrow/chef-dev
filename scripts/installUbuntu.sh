apt-get install -y wget git
apt-get install -y net-tools
#apt-get install -y chef

curl -L -O https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.11.2-1_amd64.deb
dpkg -i chefdk_*

echo "PATH=/opt/chefdk/embedded/bin:\$PATH:\$HOME/bin" > /root/.bash_profile
source /root/.bash_profile
#gem install berkshelf
#gem install chefspec
#gem install foodcritic
#gem install test-kitchen


apt-get install -y vagrant
apt-get install -y virtualbox
