{% set home = '/home/rosstimson' %}

# Sierra Sunset by Romain Guy: https://www.flickr.com/photos/romainguy/5911366388
get_wallpaper:
  file.managed:
    - name: {{ home }}/pictures/wallpapers/elementarian/sierra-sunset-romain-guy.jpg
    - source: salt://rosstimson/files/sierra-sunset-romain-guy.jpg
    - user: rosstimson
    - group: rosstimson
    - mode: 644
    - makedirs: True

link_wallpaper:
  file.symlink:
    - name: {{ home }}/pictures/wallpapers/default
    - target: {{ home }}/pictures/wallpapers/elementarian/sierra-sunset-romain-guy.jpg
    - user: rosstimson
    - group: rosstimson

