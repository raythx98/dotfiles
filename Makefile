.PHONY: all
all: stow

macos-install-stow:
	brew install stow

macos-install-brew:
	xcode-select --install
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew update

macos-install-zsh:
	brew install zsh

macos-install-packages:
	brew install git neovim tmux htop go wget pyenv diff-so-fancy ag jq shellcheck protobuf fzf 

macos-setup: macos-install-stow macos-install-brew macos-install-packages macos-install-zsh install-ohmyzsh install-python stow

install-ohmyzsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	install-ohmyzsh-plugins

install-ohmyzsh-plugins:
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	plugins=( [plugins...] zsh-syntax-highlighting)

	git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
	fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
	source "$ZSH/oh-my-zsh.sh"

install-pyenv:
	pyenv install 3.11.0
	pyenv global system 3.11.0
	brew install pyenv-virtualenv

.PHONY: crontab
crontab:
	crontab ./cron/crontab

.PHONY: stow
stow:
	/bin/ls -d */ | awk -F/ '{print $$1}' | xargs -t -I {} stow -R {}
