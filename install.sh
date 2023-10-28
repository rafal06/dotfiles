#!/usr/bin/env bash

# ----------------------
# Check for dependencies

abort=false

for cmd in zsh wget git; do
    if ! command -v $cmd &> /dev/null; then
        echo "Critical: $cmd not found"
        abort=true
    fi
done

for cmd in exa atuin diff-so-fancy; do
    if ! command -v $cmd &> /dev/null; then
        echo "Warning: $cmd not found"
    fi
done

if [ "$abort" = true ]; then
    exit 1
fi

# -----------------------------------------------------
# Download and install required fonts for the zsh theme

echo -e "\nInstalling fonts..."
font_dir="$HOME/.local/share/fonts"

# Create the font directory if it doesn't exist
mkdir -p "$font_dir"

font_urls=(
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

for url in "${font_urls[@]}"; do
	# Quiet with progress bar
    wget --show-progress -q -P "$font_dir" "$url"
done

# Refresh the font cache
fc-cache -f

echo "Fonts installed and cache refreshed"

# -------------------------------
# Install zsh plugins and a theme

echo -e "\nInstalling zsh plugins..."

echo 'Installing oh-my-zsh'
git clone -q --progress --depth=1 https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

echo 'Installing powerlevel10k'
git clone -q --progress --depth=1  https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo 'Installing zsh syntax highlighting'
git clone -q --progress --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# -----------------
# Link the dotfiles

echo -e '\nLinking .zshrc'
mv ~/.zshrc ~/.zshrc.old
ln ./.zshrc ~/.zshrc

echo 'Linking .p10k.zsh'
mv ~/.p10k.zsh ~/.p10k.zsh.old
ln ./.p10k.zsh ~/.p10k.zsh

echo 'Linking .gitconfig'
mv ~/.gitconfig ~/.gitconfig.old
ln ./.gitconfig ~/.gitconfig

echo 'Setting zsh as default shell'
chsh -s $(which zsh)

echo -e '\nDone'
