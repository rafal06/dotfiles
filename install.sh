#!/usr/bin/env bash

# check for zsh
if ! command -v zsh &> /dev/null
then
    echo "Zsh couldn't be found. Please install zsh and run this script again."
    exit
fi

# Download and install required fonts for the zsh theme
echo 'Installing fonts...'
mkdir ~/.local/share/fonts -p # Make this directory only if it doesn't exist already
wget --show-progress -q -P ~/.local/share/fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget --show-progress -q -P ~/.local/share/fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget --show-progress -q -P ~/.local/share/fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget --show-progress -q -P ~/.local/share/fonts/ https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
# --show-progress shows progress bar
# -q turn off output
fc-cache -f	# Refresh font cache

# ask whether to install zsh plugins or not (default yes)
read -p "Do you want to install oh-my-zsh, theme and plugins? (Y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Nn]$ ]]; then
	echo 'Ok, then.'
	echo ''
else
	# install oh-my-zsh, powerlevel10k and plugins
	echo 'Installing oh-my-zsh'
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh )";

	echo 'Installing powerlevel10k'
	git clone --depth=1  https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;

	echo 'Installing zsh syntax highlighting'
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi



# link the dotfiles
echo 'Linking .zshrc'
mv ~/.zshrc ~/.zshrc.old
ln ./.zshrc ~/.zshrc

echo 'Linking .p10k.zsh'
mv ~/.p10k.zsh ~/.p10k.zsh.old
ln ./.p10k.zsh ~/.p10k.zsh

echo 'Linking .gitconfig'
mv ~/.gitconfig ~/.gitconfig.old
ln ./.gitconfig ~/.gitconfig

echo 'Linking neofetch config'
mv ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf.old
ln ./neofetch/config.conf ~/.config/neofetch/config.conf

# set zsh as default shell
echo 'Setting ZSH as default shell'
chsh -s $(which zsh)

echo 'Done'
