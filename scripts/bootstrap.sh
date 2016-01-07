#!/bin/sh

set -eux

env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg install -y ca_root_nss git

fetch -o /tmp/install_salt.sh https://bootstrap.saltstack.com
chmod +x /tmp/install_salt.sh
/tmp/install_salt.sh -X -P git v2015.8.3

echo "file_client: local" > /usr/local/etc/salt/minion

git clone https://github.com/rosstimson/salt-rosstimson.git \
  /usr/local/etc/salt/states

# Begin provsioning via Salt.
salt-call --local state.highstate
