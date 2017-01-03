#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/geerlingguy.java ] && git clone https://github.com/geerlingguy/ansible-role-java.git $rolesdir/geerlingguy.java
[ ! -d $rolesdir/ernestas-poskus.docker ] && git clone https://github.com/ernestas-poskus/ansible-role-docker.git $rolesdir/ernestas-poskus.docker
[ ! -d $rolesdir/juju4.gift ] && git clone https://github.com/juju4/ansible-gift.git $rolesdir/juju4.gift
## galaxy naming
[ ! -e $rolesdir/juju4.sift ] && ln -s ansible-sift $rolesdir/juju4.sift

