[![Actions Status - Master](https://github.com/juju4/ansible-sift/workflows/AnsibleCI/badge.svg)](https://github.com/juju4/ansible-sift/actions?query=branch%3Amaster)
[![Actions Status - Devel](https://github.com/juju4/ansible-sift/workflows/AnsibleCI/badge.svg?branch=devel)](https://github.com/juju4/ansible-sift/actions?query=branch%3Adevel)

# SANS Investigative Forensic Toolkit (SIFT) Workstation ansible role

A simple ansible role to setup ISC SANS Investigative Forensic Toolkit (SIFT) Workstation.

It's basically a conversion of the shell scripts
https://raw.github.com/sans-dfir/sift-bootstrap/master/bootstrap.sh

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.2
 * 2.5
 * 2.9

### Operating systems

Tested with vagrant and kitchen on Ubuntu 18.04. Note that there are some ppa dependencies.
Support of Bionic is preliminary depending on sift and gift ppa repository.

## Example Playbook

Just include this role in your list.
For example

```
- host: dfir
  roles:
    - juju4.sift
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).
Default kitchen config (.kitchen.yml) is lxd-based, while (.kitchen.vagrant.yml) is vagrant/virtualbox based.

Once you ensured all necessary roles are present, You can test with:
```
$ gem install kitchen-ansible kitchen-lxd_cli kitchen-sync kitchen-vagrant
$ cd /path/to/roles/juju4.sift
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.sift/test/vagrant
$ vagrant up
$ vagrant ssh
```

Role has also a packer config which allows to create image for virtualbox, vmware, eventually digitalocean, lxc and others.
When building it, it's advise to do it outside of roles directory as all the directory is upload to the box during building
and it's currently not possible to exclude packer directory from it (https://github.com/mitchellh/packer/issues/1811)
```
$ cd /path/to/packer-build
$ cp -Rd /path/to/juju4.sift/packer .
## update packer-*.json with your current absolute ansible role path for the main role
## you can add additional role dependencies inside setup-roles.sh
$ cd packer
$ packer build packer-*.json
$ packer build -only=virtualbox-iso packer-*.json
## if you want to enable extra log
$ PACKER_LOG_PATH="packerlog.txt" PACKER_LOG=1 packer build packer-*.json
## for digitalocean build, you need to export TOKEN in environment.
##  update json config on your setup and region.
$ export DO_TOKEN=xxx
$ packer build -only=digitalocean packer-*.json
```

## Troubleshooting & Known issues

* Missing submodules for https://github.com/sans-dfir/sift-files
* A few times, got packages install failing and at next run working fine...
ex:
```
$ vagrant up sift
[fail]
$ vagrant provision sift
[OK]
```
* menu entries are not available be it for sift (unity-based?)
* travis may fail because role play takes more than maximum time limit (50min)
* test/vagrant on 'ubuntu/xenial64' have unusual reactions. Please avoid (and not compatible currently, notably missing python2 and sift ppa)
"Vagrant assumes that this means the command failed!
hostname -f"
"UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh.", "unreachable": true}"
"A VirtualBox machine with the name 'ubuntu-xenial-16.04-cloudimg' already exists."


## License

BSD 2-clause
