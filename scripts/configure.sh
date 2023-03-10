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
	(cd "${HOME}/wordlists/" && cat raft-large-*.txt | sort | uniq > raft-large.txt)
	log 'raft wordlists installed!'
}

configure_tools() {
	mv /tmp/files/zshrc /root/.zshrc
	mv /tmp/files/zsh_history /root/.zsh_history

	mkdir -p /root/.config/{nvim,nuclei}
	mv /tmp/files/init.vim /root/.config/nvim/init.vim
	mv /tmp/files/nuclei_config.yaml /root/.config/nuclei/config.yaml
}

install_ohmyzsh
install_raft_wordlists
configure_tools
