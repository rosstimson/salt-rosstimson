/usr/local/etc/sudoers:
  file.line:
    - content: '%wheel ALL=(ALL) NOPASSWD: ALL'
    - match: '# %wheel ALL=(ALL) NOPASSWD: ALL'
    - mode: replace
