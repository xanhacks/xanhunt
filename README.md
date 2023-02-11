# xanhunt

A lightweight debian-based docker image that contains all the tools you need to do bugbounty on web applications.

## Getting started

Pull the latest docker image:

```bash
sudo docker pull xanhacks/xanhunt:latest
```

Add the following alias to your shell profile:

```bash
alias xanhunt='sudo docker run -it --rm -v "$HOME/.xanhunt/:/root/shared/" --hostname xanhunt xanhacks/xanhunt bash'
```

Start `xanhunt`:

```bash
xanhunt
```

## Tools

- [x] [lc/gau](https://github.com/lc/gau)
- [x] [OWASP/Amass](https://github.com/OWASP/Amass)
- [x] [projectdiscovery/nuclei](https://github.com/projectdiscovery/nuclei)
- [x] [sqlmapproject/sqlmap](https://github.com/sqlmapproject/sqlmap)
- [x] [wpscanteam/wpscan](https://github.com/wpscanteam/wpscan)
- [x] [immunIT/drupwn](https://github.com/immunIT/drupwn)
- [x] [robertdavidgraham/masscan](https://github.com/robertdavidgraham/masscan)
- [x] [nmap/nmap](https://github.com/nmap/nmap)
- [x] [projectdiscovery/httpx](https://github.com/projectdiscovery/httpx)
- [x] [sensepost/gowitness](https://github.com/sensepost/gowitness)
- [ ] [projectdiscovery/subfinder](https://github.com/projectdiscovery/subfinder)
- [ ] [projectdiscovery/notify](https://github.com/projectdiscovery/notify)
- [ ] [projectdiscovery/asnmap](https://github.com/projectdiscovery/asnmap)
- [ ] [projectdiscovery/katana](https://github.com/projectdiscovery/katana)

> and some famous linux packages like: vim, neovim, jq, htop, ...

## Configuration

- [ ] zsh
- [ ] zsh history
- [ ] neovim
