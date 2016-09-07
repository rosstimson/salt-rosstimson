# This is shite but I cannot seem to get Salt to resolve the ambiguity
# between gnupg-1.x.x and gnupg-2.x.x.  And in fact even when you specify
# the exact version it still shows an error saying it cannot find:
#   <MIRROR>/gnupg-2.1.9p0--tgz
{% elif grains['os']=="OpenBSD" %}
gnupg2:
  pkg.installed:
    - sources:
      - gnupg: ftp://mirror.bytemark.co.uk/OpenBSD/6.0/packages/amd64/gnupg-2.1.9p0.tgz
{% endif %}
