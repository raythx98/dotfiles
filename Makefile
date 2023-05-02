.PHONY: all
all: stow

#########################
# MANUAL STEPS REQUIRED #
#########################
macos-manual-setup:
	# install developer tools and iTerm2
	xcode-select --install
	# install homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	# update homebrew
	brew update
	# install git
	brew install git
	# clone dotfiles
	git clone https://github.com/raythx98/dotfiles.git ~/.dotfiles
	# go to directory
	cd ~/.dotfiles

###################
# Automated Steps #
###################
macos-setup: macos-install-packages install-ohmyzsh install-ohmyzsh-plugins install-python stow generate-ssh-keys

macos-install-packages:
	brew install git neovim tmux htop go wget pyenv diff-so-fancy ag jq shellcheck protobuf protoc-gen-go fzf zsh stow sqlc node ngrok/ngrok/ngrok swag

install-ohmyzsh:
	# manual step due to environment variable
	# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

install-ohmyzsh-plugins:
	## manual step due to environment variable
	# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	## add to ~/.zshrc -> plugins=( [plugins...] zsh-syntax-highlighting)
	## handled by stow

	## manual step due to environment variable
	# git clone git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	## add to ~/.zshrc -> plugins=( [plugins...] zsh-autosuggestions)
	## handled by stow

	## manual step due to environment variable
	#   git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
	## add to ~/.zshrc -> fpath+=$${ZSH_CUSTOM:-$${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
	## above           -> source "$ZSH/oh-my-zsh.sh"
	## handled by stow

install-python:
	pyenv install 3.11.1
	pyenv global system 3.11.1
	brew install pyenv-virtualenv

generate-ssh-keys:
	ssh-keygen -t ed25519 -C "raythx98@gmail.com"
	# specify email
	touch ~/.ssh/config
	echo "Host *.github.com" >> ~/.ssh/config
	echo "	AddKeysToAgent yes" >> ~/.ssh/config
	echo "	IdentityFile ~/.ssh/id_ed25519" >> ~/.ssh/config
	ssh-add ~/.ssh/id_ed25519

.PHONY: crontab
crontab:
	crontab ./cron/crontab

.PHONY: stow
stow:
	# inspect manually before overriding dotfiles
	/bin/ls -d */ | awk -F/ '{print $$1}' | xargs -t -I {} stow -R {}

###############
# Other Tools #
###############
# iTerm
# Telegram
# Whatsapp
# Github Desktop
# Visual Studio Code
# Docker
# Goland
# Datagrip
# Postman
# Printer & Scanner

# iTerm
# System-wide shortcut: Keys -> Hotkey
# Other iTerm shortcuts: Keys -> Key Bindings
# Improve iTerm typing: Profiles -> Default -> Keys -> Key Mappings -> Presets -> Natural Text Editing
# Prefer new window than tab: Advanced -> Windows -> Open files in new windows, not new tabs

# System Preferences
# Change Machine Name -> General > About
# Dock Settings -> Desktop & Dock
# Display Settings -> Displays
# Add Language -> General > Language & Region
# Change Language -> Keyboard > Keyboard Shortcuts > Input Sources
# Trackpad -> Trackpad > Point & Click > Tap to click 