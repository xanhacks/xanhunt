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


RUN apt-get update && \
	apt-get install -y zip curl wget jq htop git make gcc \
		vim neovim zsh ruby ruby-dev python3-setuptools \
		sqlmap nmap masscan

RUN gem install wpscan


COPY ./scripts/ /tmp/scripts/
RUN bash /tmp/scripts/install.sh && \
	bash /tmp/scripts/configure.sh && \
	rm -rf /tmp/scripts/

COPY ./files/zshrc /root/.zshrc
COPY ./files/zsh_history /root/.zsh_history
