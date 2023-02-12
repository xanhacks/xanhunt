# xanhunt

A lightweight debian-based docker image that contains all the tools you need to do bugbounty.

## Getting started

Pull the latest docker image:

```bash
sudo docker pull xanhacks/xanhunt:latest
```

Add the following alias to your shell profile:

```bash
alias xanhunt='sudo docker run -it --rm -v "$HOME/.xanhunt/:/root/shared/" --hostname xanhunt xanhacks/xanhunt zsh'
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
- [x] [projectdiscovery/subfinder](https://github.com/projectdiscovery/subfinder)
- [x] [projectdiscovery/notify](https://github.com/projectdiscovery/notify)
- [x] [projectdiscovery/asnmap](https://github.com/projectdiscovery/asnmap)
- [x] [projectdiscovery/katana](https://github.com/projectdiscovery/katana)
- [x] [tomnomnom/unfurl](https://github.com/tomnomnom/unfurl)
- [x] [ffuf/ffuf](https://github.com/ffuf/ffuf)
- [ ] [tomnomnom/hacks/inscope](https://github.com/tomnomnom/hacks/tree/mater/inscope)
- [x] [OJ/gobuster](https://github.com/OJ/gobuster/)

> and some famous linux packages like: **python, ruby, vim, neovim, jq, htop, ...**

## Configuration

- [x] zsh
- [ ] zsh history (in progress)
- [x] neovim

