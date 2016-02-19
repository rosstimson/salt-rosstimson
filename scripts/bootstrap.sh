#!/bin/sh

set -eux

SALT_ROOT=/usr/local/etc/salt

# Prerequisites
env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg install -y ca_root_nss

# Install Salt
fetch -o /tmp/install_salt.sh https://bootstrap.saltstack.com
chmod +x /tmp/install_salt.sh
/tmp/install_salt.sh -X -P git v2015.8.7

# When install salt with git option a minion config is created rather than a
# minion.sample.  Check for it and backup before writing own.
[ -f ${SALT_ROOT}/minion ] && \
  cp ${SALT_ROOT}/minion ${SALT_ROOT}/minion.orig

# Create minion config
cat << EOF > ${SALT_ROOT}/minion
file_client: local
file_roots:
  base:
    - ${SALT_ROOT}
    - ${SALT_ROOT}/states

pillar_roots:
  base:
    ${SALT_ROOT}/pillar
EOF

# Create Salt dirs, script will bail if these are already present.
mkdir ${SALT_ROOT}/states
mkdir ${SALT_ROOT}/pillar

# Fetch tarball of Salt state repo and copy into correct locations.  The
# project is organised a little odd due to kitchen-salt, just copy what is
# needed rather than everything.
fetch -o /tmp/salt-rosstimson.tar.gz \
  https://github.com/rosstimson/salt-rosstimson/archive/master.tar.gz
tar xzvf /tmp/salt-rosstimson.tar.gz

cd /tmp/salt-rosstimson-master
cp top.sls ${SALT_ROOT}
cp -r base ${SALT_ROOT}/states
cp -r wifi ${SALT_ROOT}/states
cp -r rosstimson ${SALT_ROOT}/states
cp -r tools ${SALT_ROOT}/states

# Begin provsioning via Salt.
salt-call --local state.highstate

