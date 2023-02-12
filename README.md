# xanhunt

A lightweight debian-based docker image that contains all the tools you need to do bugbounty.

## Getting started

Pull the latest docker image from [DockerHub](https://hub.docker.com/r/xanhacks/xanhunt):

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

Recon (URLs and domains):

- [x] [OWASP/Amass](https://github.com/OWASP/Amass)
- [x] [OJ/gobuster](https://github.com/OJ/gobuster/)
- [x] [lc/gau](https://github.com/lc/gau)
- [x] [projectdiscovery/katana](https://github.com/projectdiscovery/katana)
- [x] [projectdiscovery/subfinder](https://github.com/projectdiscovery/subfinder)

Recon (infrastructure scanning):

- [x] [robertdavidgraham/masscan](https://github.com/robertdavidgraham/masscan)
- [x] [nmap/nmap](https://github.com/nmap/nmap)
- [x] [projectdiscovery/asnmap](https://github.com/projectdiscovery/asnmap)

Recon (tech detection):

- [x] [projectdiscovery/httpx](https://github.com/projectdiscovery/httpx)
- [x] [sensepost/gowitness](https://github.com/sensepost/gowitness)

Scanning:

- [x] [projectdiscovery/nuclei](https://github.com/projectdiscovery/nuclei)
- [x] [sqlmapproject/sqlmap](https://github.com/sqlmapproject/sqlmap)
- [x] [immunIT/drupwn](https://github.com/immunIT/drupwn)
- [x] [wpscanteam/wpscan](https://github.com/wpscanteam/wpscan)

Fuzzing:

- [x] [xmendez/wfuzz](https://github.com/xmendez/wfuzz)
- [x] [ffuf/ffuf](https://github.com/ffuf/ffuf)

Others (reporting, cleaning, ...):

- [x] [projectdiscovery/notify](https://github.com/projectdiscovery/notify)
- [x] [tomnomnom/unfurl](https://github.com/tomnomnom/unfurl)
- [ ] [tomnomnom/hacks/inscope](https://github.com/tomnomnom/hacks/tree/mater/inscope)

> and some famous linux packages like: **python, ruby, vim, neovim, jq, htop, ...**

## Configuration

- [x] zsh
- [ ] zsh history (in progress)
- [x] neovim

