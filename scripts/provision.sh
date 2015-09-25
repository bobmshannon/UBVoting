#!/usr/bin/env bash

echo 'Provisioning UBVoting Development Machine...'

# Update
echo 'Updating packages...'
yum -y update
yum -y install epel-release

# Install Nginx Web Server
echo 'Installing Nginx...'
yum -y remove httpd
yum -y install nginx
if ! [ -L /usr/share/nginx/html ]; then
  rm -rf /usr/share/nginx/html
  ln -fs /vagrant/webroot /usr/share/nginx/html
fi
chmod 0777 /usr/share/nginx/html
cd /vagrant && find . -exec touch {} \; 
sed -i 's/sendfile        on;/sendfile        off;/' /etc/nginx/nginx.conf    # Disable sendfile to prevent weird caching issues with shared vagrant folder
service nginx restart && chkconfig nginx on

# Install Ruby
echo 'Installing Ruby...'
su vagrant
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
rvm install ruby --latest
sudo usermod -a -G rvm vagrant
echo "[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*" >> /home/vagrant/.bash_profile
sudo su root
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

# Install project dependencies
if [ `ls -1 /vagrant/{{package,composer,bower}.json,Gruntfile.js,Gemfile} 2> /dev/null | wc -l` -gt 0 ]; then
	echo 'Installing project dependencies:'
fi

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
chown -R vagrant /home/vagrant

# Provision Complete
echo -e '\nFinished provisioning:\n'
printf '\tNginx v%s' $(2>&1 nginx -v | cut -d'/' -f2)
printf '\tRuby v%s' $(ruby --version)
printf '\tNPM v%s' $(npm -v)
printf '\tBower v%s\n' $(bower -v)
printf '\tBundler v%s\n' $(bundler -v | cut -d' ' -f3)
printf '\tGrunt v%s\n' $(grunt --version | tail -n1 | cut -d'v' -f2)
echo 'You can now access the server at http://localhost:8080/'
