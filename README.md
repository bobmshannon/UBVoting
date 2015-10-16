# UBVoting

[![Build Status](https://magnum.travis-ci.com/bobmshannon/UBVoting.svg?token=qEZPqxG9wUaU2LNL3KZU&branch=dev)](https://magnum.travis-ci.com/bobmshannon/UBVoting)
[![Dependency Status](https://www.versioneye.com/user/projects/55f747db3ed89400170004f2/badge.svg?style=flat)](https://www.versioneye.com/user/projects/55f747db3ed89400170004f2)

Commits pushed to the <b>master</b> branch are automatically deployed to [https://ubvoting.com](https://ubvoting.com).

Commits pushed to the <b>dev</b> branch are automatically deployed to [https://dev.ubvoting.com](https://dev.ubvoting.com).

Running locally
---------------
0. If you have not done so already, install both [Vagrant](http://www.vagrantup.com) and [VirtualBox](http://www.virtualbox.org).

1. Clone this repo:
	```sh
	git clone git@github.com:bobmshannon/UBVoting.git
	```

2. Start the virtual machine:
	```sh
	vagrant up
	```

3. SSH in to the virtual machine:
	```sh
	vagrant ssh
	```

4. Access the the server locally at [http://localhost:8080/](http://localhost:8080/) 
