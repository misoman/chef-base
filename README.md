PHP High Availability Multi Tier App Chef Base
==========================================================
[![Build Status](https://travis-ci.org/haapp/chef-base.svg?branch=master)](https://travis-ci.org/haapp/chef-base)

(This guide is for PHP developers and system administrators without DevOps experience, yet assuming you know how to use Git)

These Cookbooks aims to keep and maintain consistent configuration between development server, stagnig server, and production server with ease and safety of operation and development in mind by installing and configuring following tiers of services:

- Loadbalancer: [HAProxy 1.5](http://www.haproxy.org/) in 2 VMs with [Keepalived](http://keepalived.org/)
- Web Cache Server: [Varnish 4.0](https://www.varnish-cache.org/) * X with optional [GeoIP vmod](https://github.com/simonvik/libvmod_maxminddb) for loading maxminddb (geoip2) and [Header vmod](https://github.com/varnish/libvmod-header) for multiple set-cookie headers
- Web Server: [Apache HTTP 2.4](httpd.apache.org/) in N number of VMs with PHP 5.5, [PHP FPM](http://php-fpm.org/), in-VM-HAProxy for DB loadbalancing, optional [Blackfire Profiler](https://blackfire.io/), [Newrelic PHP Application Monitoring](http://newrelic.com/php), [Xdebug](http://xdebug.org/), [phpMyAdmin](http://www.phpmyadmin.net/home_page/index.php) for PHP Developer's ease of development
- DB Cache Server: [Memcached](http://memcached.org/) in N number of VMs
- DB Server: [Percona XtraDB Cluster](https://www.percona.com/software/percona-xtradb-cluster)(PXC) in N number of VMs

**PXC is a MySQL Database enhanced with [Galera multi-master replication library](https://github.com/codership/galera) which enables PHP developer to utilize multiple database without differenciating DB-read code and DB-write code

A common cookbook for all servers enables following operations/features for all Servers easing day to day system administration work:
- Linux users with ssh key access can be added, modified or removed at once in all VMs
- Time zone and ntp can be configured at once
- [Monit](https://mmonit.com/monit/) with automatic restarting when service process dead, send email notification in such event via SMTP (optionally)
- [Newrelic Server Monitoring](http://newrelic.com/server-monitoring) with custom configuration (optionally)

## Pre Reqirements
Enable VT-x [in Windows 10 or Windows 8](http://www.howtogeek.com/213795/how-to-enable-intel-vt-x-in-your-computers-bios-or-uefi-firmware/), [in Windows 7](http://www.sysprobs.com/disable-enable-virtualization-technology-bios)
After enabling VT-X, if you get "VT-x is not available. (VERR_VMX_NO_VMX)" error on virtual box, run ```bcdedit /set hypervisorlaunchtype off``` as Administrator in cmd and restart your computer.

Install following DevOps tools:
- [VirtualBox](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [ChefDK](https://downloads.chef.io/chef-dk/)

### Windows 
cmd (Administrator) or [ConEmu](https://chocolatey.org/packages/ConEmu) with [Chocolatey](https://chocolatey.org/):
```cmd
C:\Users\John>choco install virtualbox -y
C:\Users\John>choco install vagrant -y
C:\Users\John>choco install chefdk -y
```
Use [Windows Environment Variables Editor](http://eveditor.com/) for your convenience (Optional).
Your PATH environmental variable must end like this:
```
... other software
C:\Program Files\Git\cmd;
C:\Program Files\Git\mingw64\bin;
C:\Program Files\Git\usr\bin;
C:\ProgramData\chocolatey\bin;
C:\Program Files\Oracle\VirtualBox;
C:\HashiCorp\Vagrant\bin;
C:\opscode\chefdk\embedded\bin;
C:\opscode\chefdk\bin\
```

Set ```GEM_PATH``` user variable as ```C:\opscode\chefdk\embedded\lib\ruby\gems\2.1.0```

### Mac 
Terminal with [Homebrew](http://brew.sh/) and [Cask](http://caskroom.io/):
```shell
$ brew cask install virtualbox
$ brew cask install vagrant
$ brew cask install chefdk
$ echo 'eval "$(chef shell-init bash)"' >> ~/.bash_profile
```

### Ubuntu 
Terminal with apt-get:
```shell
$ sudo apt-get install virtualbox
$ sudo apt-get install vagrant
$ sudo apt-get install chefdk
$ echo 'eval "$(chef shell-init bash)"' >> ~/.bashrc
```

## Installing reqired Gems
Run following command to install nessesary Gems
```shell
bundle install
```

## PHP Development Workflow
**fllowing sections, ```subl``` command is used to launch Sublime Text as editor from command line to edit files

```shell
git clone --recursive https://github.com/haapp/chef-base.git
cd chef-base
vagrant up
```

This will trigger [Vagrant Chef Zero Provisioner](http://docs.vagrantup.com/v2/provisioning/chef_zero.html) to install HAProxy, Varnish, Apache HTTP, Memcached, PXC in one VM managed by Vagrant. Following [Vagrant commands](http://docs.vagrantup.com/v2/cli/) are available to shutdown(poweroff), delete, create/poweron, reconfigure (with chef) the development server:
```shell
vagrant halt
vagrant destroy
vagrant up
vagrant provision
```

make some page in automatically created VM's document root directory [syncronized with host machine via Vagrant](http://docs.vagrantup.com/v2/synced-folders/):
```shell
subl websites/examplewebsite.com/index.php
```
use [HostAdmin for Chrome](https://chrome.google.com/webstore/detail/hostadmin-app/mfoaclfeiefiehgaojbmncmefhdnikeg?hl=en-US) or [for FireFox ](https://addons.mozilla.org/en-us/firefox/addon/hostadmin/) to point examplewebsite.com 192.168.33.10 which is [Vagrant's private ip address](http://docs.vagrantup.com/v2/networking/private_network.html)

Open http://examplewebsite.com in browser to see the index.php is displayed. Change index.php, and refresh browser, developers do not need to use FTP to see changes, but changes are applied immediately in dev server when it's changed in host machine due to sync.

## Cookbook Development Workflow

### Create specific cookbook
```shell
cd cookbooks
chef generate cookbook uk_web -C 'Joel Handwell' -m 'joelhandwell@gmail.com'
```

### Clone all serverspec tests as git submodules
```shell
git submodule init
git submodule update
```

### Create feature branch
```shell
git checkout -b feature
```

### Write serverspec test, modify cookbook, and run test, repeat till pass
```shell
subl test/integration/test_w_common/serverspec/localhost/default_spec.rb
```

### Create and execute initial apply Chef cookbook onto VM
```shell
chef exec kitchen list
chef exec kitchen create common
chef exec kitchen setup common
```

### If you get error, modify cookbook and apply Chef again

```shell
subl cookbook/w_common/recipes/default.rb
chef exec kitchen converge common
```

### Run serverspec
if it's executed without error, run serverspec test, and if test fail, edit cookbook until pass, and delete VM after pass, and run end to end test for make sure, and commit change.

```shell
subl cookbook/w_common/recipes/default.rb
chef exec kitchen converge common

subl cookbook/w_common/recipes/default.rb
chef exec kitchen converge common

chef exec kitchen destroy common
chef exec kitchen test common

git add cookbook/w_common/recipes/default.rb
git commit
```
