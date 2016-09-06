#!/bin/sh

set -eux

case $(uname) in
  FreeBSD)
    SALT_ROOT=/usr/local/etc/salt
  ;;
  OpenBSD)
    SALT_ROOT=/etc/salt
  ;;
esac

# Prerequisites
case $(uname) in
  FreeBSD)
    env ASSUME_ALWAYS_YES=YES pkg bootstrap
    pkg install -y ca_root_nss
  ;;
  # Set local mirror for pkg_add as we'll just use packages to instal Salt.
  OpenBSD)
    echo 'installpath = mirror.bytemark.co.uk' > /etc/pkg.conf
  ;;
esac

# Install Salt
case $(uname) in
  FreeBSD)
    fetch -o /tmp/install_salt.sh https://bootstrap.saltstack.com
    chmod +x /tmp/install_salt.sh
    /tmp/install_salt.sh -X -P git v2015.8.10
  ;;
  OpenBSD)
    pkg_add salt
  ;;
esac

# When installing salt with git option a minion config is created rather than a
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
mkdir -p ${SALT_ROOT}/states
mkdir -p ${SALT_ROOT}/pillar

# Fetch tarball of Salt state repo and copy into correct locations.  The
# project is organised a little odd due to kitchen-salt, just copy what is
# needed rather than everything.
case $(uname) in
  FreeBSD)
    fetch -o /tmp/salt-rosstimson.tar.gz \
      https://github.com/rosstimson/salt-rosstimson/archive/master.tar.gz
  ;;
  OpenBSD)
    ftp -o /tmp/salt-rosstimson.tar.gz \
      https://github.com/rosstimson/salt-rosstimson/archive/master.tar.gz
  ;;
esac
tar xzvf /tmp/salt-rosstimson.tar.gz -C /tmp

cd /tmp/salt-rosstimson-master
cp top.sls ${SALT_ROOT}
cp -r base ${SALT_ROOT}/states
cp -r wifi ${SALT_ROOT}/states
cp -r rosstimson ${SALT_ROOT}/states
cp -r tools ${SALT_ROOT}/states
cp -r x11 ${SALT_ROOT}/states
cp -r langs ${SALT_ROOT}/states

# Begin provsioning via Salt.
salt-call --local state.highstate

