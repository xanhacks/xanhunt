#!/bin/bash

install_ohmyzsh() {
	export CHSH=yes
	bash "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-autosuggestions
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-syntax-highlighting
	git -C /root/.oh-my-zsh/custom/plugins/ clone https://github.com/zsh-users/zsh-completions
}

install_ohmyzsh
