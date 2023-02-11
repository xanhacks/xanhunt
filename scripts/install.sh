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

install_gau() {
    local tmp_dir="$(mktemp -d)"

    log "Installing gau..."
    wget -q "https://github.com/lc/gau/releases/download/v${GAU_VERSION}/gau_${GAU_VERSION}_linux_amd64.tar.gz" \
        -O "${tmp_dir}/gau_linux_amd64.zip"
    
    (cd "${tmp_dir}" && tar xvf "${tmp_dir}/gau_linux_amd64.zip")
    mv "${tmp_dir}/gau" "${BIN_DIR}/gau"
    rm -rf "${tmp_dir}/"
    log "gau installed!"
}

install_drupwn() {
	(cd /opt && \
		git clone https://github.com/immunIT/drupwn && \
		cd drupwn && \
		python3 setup.py install)
}

install_subfinder() {
	local tool='subfinder'
	local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
	wget -q "https://github.com/projectdiscovery/subfinder/releases/download/v${SUBFINDER_VERSION}/subfinder_${SUBFINDER_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}"
    log "${tool} installed!"
}

install_asnmap() {
	local tool='asnmap'
	local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
	wget -q "https://github.com/projectdiscovery/${tool}/releases/download/v${ASNMAP_VERSION}/${tool}_${ASNMAP_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}"
    log "${tool} installed!"
}

install_katana() {
	local tool='katana'
	local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
	wget -q "https://github.com/projectdiscovery/${tool}/releases/download/v${KATANA_VERSION}/${tool}_${KATANA_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}"
    log "${tool} installed!"
}


mkdir "$BIN_DIR"

install_nuclei
install_httpx
install_amass
install_gowitness
install_gau
install_drupwn
install_subfinder
install_asnmap
install_katana
