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
[ ! -d $rolesdir/juju4.volatility ] && git clone https://github.com/juju4/ansible-volatility.git $rolesdir/juju4.volatility
[ ! -d $rolesdir/juju4.rekall ] && git clone https://github.com/juju4/ansible-rekall.git $rolesdir/juju4.rekall
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.sift ] && ln -s ansible-sift $rolesdir/juju4.sift
[ ! -e $rolesdir/juju4.sift ] && cp -R $rolesdir/ansible-sift $rolesdir/juju4.sift

## don't stop build on this script return code
true

