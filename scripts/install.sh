#!/bin/bash


BIN_DIR="/root/bin"


log() {
    printf '[%(%d/%m/%Y %H:%M:%S)T]' # date format
    echo " ${1}"
}

install_nuclei() {
	local tool='nuclei'
    local tmp_dir="$(mktemp -d)"

	log "Installing ${tool}..."
    wget -q "https://github.com/projectdiscovery/nuclei/releases/download/v${NUCLEI_VERSION}/nuclei_${NUCLEI_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"
    
    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    "${BIN_DIR}/nuclei" # run it to download templates
    rm -rf "${tmp_dir}"
	log "${tool} installed!"
}

install_httpx() {
	local tool='httpx'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
    wget -q "https://github.com/projectdiscovery/httpx/releases/download/v${HTTPX_VERSION}/httpx_${HTTPX_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"
    
    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}/"
    log "${tool} installed!"
}

install_amass() {
	local tool='amass'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
    wget -q "https://github.com/OWASP/Amass/releases/latest/download/amass_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}_linux_amd64/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}/"
    log "${tool} installed!"
}

install_gowitness() {
	local tool='gowitness'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
	wget -q "https://github.com/sensepost/gowitness/releases/download/${GOWITNESS_VERSION}/gowitness-${GOWITNESS_VERSION}-linux-amd64" \
        -O "${BIN_DIR}/${tool}"
	chmod +x "${BIN_DIR}/${tool}"

	wget -q 'https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' \
		-O "${tmp_dir}/google-chrome_amd64.deb"
	dpkg -i "${tmp_dir}/google-chrome_amd64.deb" 2>/dev/null
	apt-get --fix-broken install -y
	dpkg -i "${tmp_dir}/google-chrome_amd64.deb"
    rm -rf "${tmp_dir}/"
    log "${tool} installed!"
}

install_gau() {
	local tool='gau'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
    wget -q "https://github.com/lc/gau/releases/download/v${GAU_VERSION}/gau_${GAU_VERSION}_linux_amd64.tar.gz" \
        -O "${tmp_dir}/${tool}_linux_amd64.tar.gz"
    
    (cd "${tmp_dir}" && tar xvf "${tmp_dir}/${tool}_linux_amd64.tar.gz")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}/"
    log "${tool} installed!"
}

install_drupwn() {
	local tool='drupwn'

    log "Installing ${tool}..."
	(cd /opt && \
		git clone https://github.com/immunIT/drupwn && \
		cd drupwn && \
		python3 setup.py install)
    log "${tool} installed!"
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
	wget -q "https://github.com/projectdiscovery/asnmap/releases/download/v${ASNMAP_VERSION}/asnmap_${ASNMAP_VERSION}_linux_amd64.zip" \
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
	wget -q "https://github.com/projectdiscovery/katana/releases/download/v${KATANA_VERSION}/katana_${KATANA_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}"
    log "${tool} installed!"
}

install_notify() {
	local tool='notify'
	local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
	wget -q "https://github.com/projectdiscovery/notify/releases/download/v${NOTIFY_VERSION}/notify_${NOTIFY_VERSION}_linux_amd64.zip" \
        -O "${tmp_dir}/${tool}_linux_amd64.zip"

    (cd "${tmp_dir}" && unzip -q "${tmp_dir}/${tool}_linux_amd64.zip")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}"
    log "${tool} installed!"
}

install_ffuf() {
	local tool='ffuf'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
    wget -q "https://github.com/ffuf/ffuf/releases/download/v${FFUF_VERSION}/ffuf_${FFUF_VERSION}_linux_amd64.tar.gz" \
        -O "${tmp_dir}/${tool}_linux_amd64.tar.gz"
    
    (cd "${tmp_dir}" && tar xvf "${tmp_dir}/${tool}_linux_amd64.tar.gz")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}/"
    log "${tool} installed!"
}

install_unfurl() {
	local tool='unfurl'
    local tmp_dir="$(mktemp -d)"

    log "Installing ${tool}..."
    wget -q "https://github.com/tomnomnom/unfurl/releases/download/v${UNFURL_VERSION}/unfurl-linux-amd64-${UNFURL_VERSION}.tgz" \
        -O "${tmp_dir}/${tool}_linux_amd64.tgz"
    
    (cd "${tmp_dir}" && tar xvf "${tmp_dir}/${tool}_linux_amd64.tgz")
    mv "${tmp_dir}/${tool}" "${BIN_DIR}/${tool}"
    rm -rf "${tmp_dir}/"
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
install_notify
install_ffuf
install_unfurl
