FROM debian:11

USER root
WORKDIR /root

ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin"
ENV NUCLEI_VERSION="2.8.9"
ENV HTTPX_VERSION="1.2.7"
ENV GOWITNESS_VERSION="2.4.2"
ENV GAU_VERSION="2.1.2"
ENV SUBFINDER_VERSION="2.5.5"


RUN apt-get update && \
	apt-get install -y zip curl wget jq htop git make gcc \
		vim neovim zsh ruby ruby-dev python3-setuptools \
		sqlmap nmap masscan

RUN gem install wpscan


COPY ./scripts/install.sh /tmp/install.sh

RUN bash /tmp/install.sh && \ 
	rm /tmp/install.sh

