#!/bin/bash
source ./utils.sh


install_ohmyzsh() {
	log 'Install zsh...'
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-autosuggestions
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-syntax-highlighting
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-completions
	log 'zsh installed!'
}

install_raft_wordlists() {
	local tmp_dir="$(mktemp -d)"

	log 'Install raft wordlists...'
	wget -q 'https://codeload.github.com/Averroes/raft/zip/refs/heads/master' \
		-O "${tmp_dir}/raft-master.zip"

	(cd "${tmp_dir}" && unzip -q 'raft-master.zip')
	mv "${tmp_dir}/raft-master/data/wordlists/" "${HOME}/wordlists/"
	rm -rf "${tmp_dir}"
	log 'raft wordlists installed!'
}

install_ohmyzsh
install_raft_wordlists
