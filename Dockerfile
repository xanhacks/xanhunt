FROM debian:11

USER root
WORKDIR /root


ENV NUCLEI_VERSION="2.8.9"
ENV HTTPX_VERSION="1.2.7"


RUN apt-get update && \
	apt-get install -y zip curl wget jq htop git

COPY ./scripts/install.sh /tmp/install.sh

RUN bash /tmp/install.sh && \ 
	rm /tmp/install.sh

