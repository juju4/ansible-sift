[![Build Status](https://travis-ci.org/juju4/ansible-sift.svg?branch=master)](https://travis-ci.org/juju4/ansible-sift)
# SANS Investigative Forensic Toolkit (SIFT) Workstation ansible role

A simple ansible role to setup ISC SANS Investigative Forensic Toolkit (SIFT) Workstation.

It's basically a conversion of the shell scripts
https://raw.github.com/sans-dfir/sift-bootstrap/master/bootstrap.sh

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0

### Operating systems

Tested with vagrant and kitchen on Ubuntu 14.04. Note that there are some ppa dependencies.

## Example Playbook

Just include this role in your list.
For example

```
- host: dfir
  roles:
    - sift
```

## Variables

Nothing specific for now.

## Known issues

* Missing submodules for https://github.com/sans-dfir/sift-files
* A few times, got packages install failing and at next run working fine...
ex:
$ vagrant up sift
[fail]
$ vagrant provision sift
[OK]
* menu entries are not available be it for sift (unity-based?)
* travis fails because whole role take more than maximum time limit (50min)
* test/vagrant on 'ubuntu/xenial64' have unusual reactions. Please avoid (and not compatible currently, notably missing python2 and sift ppa)
"Vagrant assumes that this means the command failed!
hostname -f"
"UNREACHABLE! => {"changed": false, "msg": "Failed to connect to the host via ssh.", "unreachable": true}"
"A VirtualBox machine with the name 'ubuntu-xenial-16.04-cloudimg' already exists."


## License

BSD 2-clause

