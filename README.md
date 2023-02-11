# xanhunt

A lightweight debian-based docker image that contains all the tools you need to bugbounty web applications.

## Getting started

Pull the latest docker image:

```bash
sudo docker pull xanhacks/xanhunt:latest
```

Add the following alias to your shell profile:

```bash
alias xanhunt='sudo docker run -it --rm -v "$HOME/.xanhunt/:/root/shared/" --hostname 'xanhunt' xanhunt bash'
```

Start `xanhunt`:

```bash
xanhunt
```
