# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "base"

  # Make red text from key imports during provisioner yum install go away!
  keypaths = [
    '/etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7',
  ]

  keypaths.each do |keypath|
    config.vm.provision 'shell', inline: "rpm --import #{keypath}"
  end
end
