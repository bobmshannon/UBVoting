#!/usr/bin/env bash

echo 'Provisioning UBVoting Development Machine...'

# Update
echo 'Updating packages...'
yum -y update
yum -y install epel-release

# Install Ruby
echo 'Installing Ruby...'
yum -y remove ruby
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -L get.rvm.io | bash -s stable
source /etc/profile.d/rvm.sh
rvm reload
rvm install 2.2.1
usermod -a -G rvm vagrant
rvm use 2.2.1 --default

# Install Rails
echo 'Installing Rails...'
gem install rails

# Install Passenger
echo 'Installing Passenger...'
gem install passenger

# Install Nginx
echo 'Installing Nginx...'
yum -y remove httpd
yum -y install libcurl-devel
passenger-install-nginx-module --auto --auto-download --prefix=/etc/nginx
cd /vagrant && find . -exec touch {} \; 
rm -rf /etc/nginx/conf/nginx.conf
cp /vagrant/scripts/nginx.conf /etc/nginx/conf/nginx.conf

# Setup nginx initialization script
cp /vagrant/scripts/nginx.init /etc/rc.d/init.d/nginx
chmod +x /etc/init.d/nginx
echo "service nginx start" >> /etc/rc.local
service nginx restart

# Install SQLite3
echo 'Installing SQLite3...'
yum -y install sqlite-devel

# Install NodeJS
echo 'Installing NodeJS...'
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.26.1/install.sh | NVM_DIR=/usr/local/nvm bash
source /usr/local/nvm/nvm.sh
nvm install stable
nvm use stable
npm -g install npm@latest
echo ". /usr/local/nvm/nvm.sh" >> /home/vagrant/.bash_profile
echo "nvm use stable > /dev/null" >> /home/vagrant/.bash_profile
echo ". /usr/local/nvm/nvm.sh" >> /root/.bash_profile
echo "nvm use stable > /dev/null" >> /root/.bash_profile

# Install Grunt
echo 'Installing Grunt...'
npm install -g grunt-cli

# Install Bower
echo 'Installing Bower...'
npm install -g bower

# Install Java
yum -y install java

# Firewall rules
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -p tcp --dport 22 -j ACCEPT
service iptables save

# Update MOTD
awk ' BEGIN { print "Welcome to your UBVoting Development VM.\nAccess locally at http://localhost:8080/" } ' > /etc/motd 

# Switch to vagrant user
su vagrant

# Update ruby default ruby version
/bin/bash --login
rvm install 2.2.1
rvm --default use 2.2.1

# Install project dependencies
echo 'Installing project dependencies...'
if [ -f /vagrant/package.json ]; then
	echo -e "\tRunning 'npm install'..."
	rm -rf /vagrant/node_modules
	cd /vagrant && npm --no-bin-links -dd install --silent
fi

if [ -f /vagrant/Gemfile ]; then
	echo -e "\tRunning 'bundle install'..."
	cd /vagrant && bundle install --clean --quiet
fi

if [ -f /vagrant/bower.json ]; then
	echo -e "\tRunning 'bower install'..."
	cd /vagrant && bower install --quiet --config.interactive=false > /dev/null 2>&1
fi

if [ -f /vagrant/Gruntfile.js ]; then
	echo -e "\tRunning 'grunt'..."
	cd /vagrant && grunt clean default > /dev/null
fi

# Update default git editor
git config --global core.editor "nano"

# Update vagrant directory permissions
sudo chown -R vagrant /home/vagrant

# Provision Complete
echo -e '\nFinished provisioning:\n'
printf '\tNginx v%s' $(2>&1 nginx -v | cut -d'/' -f2)
printf '\tRuby v%s' $(ruby --version)
printf '\tNPM v%s' $(npm -v)
printf '\tBower v%s\n' $(bower -v)
printf '\tBundler v%s\n' $(bundler -v | cut -d' ' -f3)
printf '\tGrunt v%s\n' $(grunt --version | tail -n1 | cut -d'v' -f2)
echo 'You can now access the server at http://localhost:8080/'
