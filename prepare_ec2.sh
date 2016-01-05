#!/bin/sh
env ASSUME_ALWAYS_YES=YES pkg bootstrap
pkg install -y sudo bash curl
echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /usr/local/etc/sudoers

# kitchen-salt fails to converge as `set -o pipefail` fails in /bin/sh.
# First attempt was to `chsh -s /usr/local/bin/bash ec2-user` but the
# ec2-user is not present when script in user-data is run so it silently
# fails.  The horrible hack is to just symlink, I can live with this as
# it is just to get the testing working.
ln -sf /usr/local/bin/bash /bin/sh
