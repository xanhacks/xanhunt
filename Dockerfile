FROM debian:11

USER root
WORKDIR /root

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin"
ENV NUCLEI_VERSION="2.8.9"
ENV HTTPX_VERSION="1.2.7"
ENV GOWITNESS_VERSION="2.4.2"
ENV GAU_VERSION="2.1.2"
ENV SUBFINDER_VERSION="2.5.5"
ENV ASNMAP_VERSION="1.0.0"
ENV KATANA_VERSION="0.0.3"
ENV NOTIFY_VERSION="1.0.4"
ENV FFUF_VERSION="2.0.0"
ENV UNFURL_VERSION="0.4.3"


RUN apt-get update && \
	apt-get install -y zip curl wget jq htop git make gcc procps \
		vim neovim zsh ruby ruby-dev python3-setuptools python3-pip \
		sqlmap nmap masscan gobuster

RUN gem install wpscan && \
	python3 -m pip install wfuzz


COPY ./scripts/ /tmp/scripts/
RUN bash /tmp/scripts/install.sh && \
	bash /tmp/scripts/configure.sh && \
	rm -rf /tmp/scripts/

COPY ./files/zshrc /root/.zshrc
COPY ./files/zsh_history /root/.zsh_history
RUN mkdir -p /root/.config/nvim/
COPY ./files/init.vim /root/.config/nvim/init.vim
