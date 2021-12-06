#!/usr/bin/env bash

# check for zsh
if ! command -v zsh &> /dev/null
then
    echo "Zsh couldn't be found. Please install zsh and run this script again."
    exit
fi

# install the fonts
echo 'Please install and set the required fonts.'
echo 'https://github.com/romkatv/powerlevel10k#manual-font-installation'

# install oh-my-zsh and powerlevel10k
read -p "Do you want to install oh-my-zsh and powerlevel10k? *Required for the theme* (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh )";
	git clone --depth=1  https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k;
fi;



# link the dotfiles
echo 'Linking .zshrc'
mv ~/.zshrc ~/.zshrc.old
link ./.zshrc ~/.zshrc

echo 'Linking .p10k.zsh'
mv ~/.p10k.zsh ~/.p10k.zsh.old
link ./.p10k.zsh ~/.p10k.zsh

echo 'Linking .gitconfig'
mv ~/.gitconfig ~/.gitconfig.old
link ./.gitconfig ~/.gitconfig

echo 'Linking neofetch config'
mv ~/.config/neofetch/config.conf ~/.config/neofetch/config.conf.old
link ./neofetch/config.conf ~/.config/neofetch/config.conf

# set zsh as default shell
echo 'Setting ZSH as default shell'
chsh -s $(which zsh)

echo 'Done'
