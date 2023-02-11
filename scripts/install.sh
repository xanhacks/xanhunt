#!/bin/bash


BIN_DIR="/root/bin"


log() {
    printf '[%(%d/%m/%Y %H:%M:%S)T]' # date format
    echo " ${1}"
}

install_nuclei() {
    local tmp_dir="$(mktemp -d)"

	log "Installing nuclei..."
    wget -q "https://github.com/projectdiscovery/nuclei/releases/download/v${NUCLEI_VERSION}/nuclei_${NUCLEI_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/nuclei_linux_amd64.zip"
    
    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/nuclei_linux_amd64.zip")
    mv "${tmp_dir}/nuclei" "${BIN_DIR}/nuclei"
    "${BIN_DIR}/nuclei" # run it to download templates
    rm -rf "${tmp_dir}"
	log "nuclei installed!"
}

install_httpx() {
    local tmp_dir="$(mktemp -d)"

    log "Installing httpx..."
    wget "https://github.com/projectdiscovery/httpx/releases/download/v${HTTPX_VERSION}/httpx_${HTTPX_VERSION}_linux_amd64.zip' \
        -O "${tmp_dir}/httpx_linux_amd64.zip"
    
    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/httpx_linux_amd64.zip")
    mv "${tmp_dir}/httpx" "${BIN_DIR}/httpx"
    rm -rf "${tmp_dir}/"
    log "httpx installed!"
}

mkdir "$BIN_DIR"
export PATH="${PATH}:${BIN_DIR}"

install_nuclei
install_httpx

