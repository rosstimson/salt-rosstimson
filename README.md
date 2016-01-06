# salt-rosstimson

[![wercker status](https://app.wercker.com/status/f24cd35fa39b309e6344d6786387579f/m/master "wercker status")](https://app.wercker.com/project/bykey/f24cd35fa39b309e6344d6786387579f)

Provision my laptop with [SaltStack][saltstack].

## Todo

- [ ] Secrets in pillars e.g. user password/ssh key and wifi password.
- [ ] Compatibility with both FreeBSD and Linux (Fedora).
- [ ] Fetch port tree (this will take a long time and might break Wercker CI).
- [ ] Install `password-store` via port for git and xclip support.
- [ ] Install `par` there is no port for this.

## Development

* Source hosted at [GitHub][repo]
* Report issues/questions/feature requests on [GitHub Issues][issues]

## License and Author

Author:: [Ross Timson][rosstimson]
<[ross@rosstimson.com](mailto:ross@rosstimson.com)>

License:: Licensed under [WTFPL][license].


[rosstimson]:         https://github.com/rosstimson
[repo]:               https://github.com/rosstimson/salt-rosstimson
[issues]:             https://github.com/rosstimson/salt-rosstimson/issues
[license]:            http://www.wtfpl.net/
[saltstack]:          https://saltstack.com
[serverspec]:         https://github.com/serverspec/serverspec
[testkitchen]:        https://github.com/test-kitchen/test-kitchen
