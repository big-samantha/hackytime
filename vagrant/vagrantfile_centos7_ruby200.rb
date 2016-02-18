# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.0-64-nocm"
  config.vm.network "private_network", type: "dhcp"
  config.vm.provision 'shell', inline: 'rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7'
  config.vm.provision 'shell', inline: 'yum makecache'
  config.vm.provision "shell", inline: 'yum install -y deltarpm'
  config.vm.provision "shell", inline: 'yum groupinstall -y "Development Tools"'
  config.vm.provision "shell", inline: "yum install -y centos-release-scl scl-utils"
  config.vm.provision "shell", inline: "yum install -y ruby200 ruby200-build ruby200-ruby-devel"
  config.vm.provision 'shell', inline: 'yum install -y gcc bzip2 openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel'
  config.vm.provision 'shell', inline: 'echo PATH=/opt/rh/ruby200/root/usr/local/bin:$PATH > /etc/profile.d/ruby200.sh'
  config.vm.provision 'shell', inline: 'echo source /opt/rh/ruby200/enable >> /etc/profile.d/ruby200.sh'
  config.vm.provision 'shell', inline: 'scl enable ruby200 -- gem install bundler'
  config.vm.provision 'shell', inline: 'cd /vagrant && bundle install'
end
