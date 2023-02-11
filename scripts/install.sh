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
    wget -q "https://github.com/projectdiscovery/httpx/releases/download/v${HTTPX_VERSION}/httpx_${HTTPX_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/httpx_linux_amd64.zip"
    
    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/httpx_linux_amd64.zip")
    mv "${tmp_dir}/httpx" "${BIN_DIR}/httpx"
    rm -rf "${tmp_dir}/"
    log "httpx installed!"
}

install_amass() {
    local tmp_dir="$(mktemp -d)"

    log "Installing amass..."
    wget -q 'https://github.com/OWASP/Amass/releases/latest/download/amass_linux_amd64.zip' \
        -O "${tmp_dir}/amass_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/amass_linux_amd64.zip")
    mv "${tmp_dir}/amass_linux_amd64/amass" "${BIN_DIR}/amass"
    rm -rf "${tmp_dir}/"
    log "amass installed!"
}

install_gowitness() {
    local tmp_dir="$(mktemp -d)"

    log "Installing gowitness..."
	wget -q "https://github.com/sensepost/gowitness/releases/download/${GOWITNESS_VERSION}/gowitness-${GOWITNESS_VERSION}-linux-amd64" \
        -O "${BIN_DIR}/gowitness"

	chmod +x "${BIN_DIR}/gowitness"
    log "gowitness installed!"
}

mkdir "$BIN_DIR"

install_nuclei
install_httpx
install_amass
install_gowitness
