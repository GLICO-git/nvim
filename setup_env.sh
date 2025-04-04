#!/bin/bash

echo "Updating package list..."
sudo apt update

# Install Node.js
echo "Installing Node.js..."
curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - && \
sudo apt-get install -y nodejs

# Install essential packages
echo "Installing essential packages..."
sudo apt install -y git make cmake gcc g++ clang-format libtool libtool-bin autoconf automake pkg-config unzip zsh bat gettext curl python3-pip

# Setup bat symlink
echo "Setting up bat symlink..."
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install oh-my-zsh (does not require sudo)
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Nerd,MesloLGS Font
echo "Downloading and installing DroidSansMono Nerd Font..."
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.local/share/fonts
git clone https://github.com/romkatv/powerlevel10k-media.git
mv ~/powerlevel10k-media/MesloLGS\ NF\ Bold.ttf ~/.local/share/fonts
fc-cache -fv
rm DroidSansMono.zip

# Install powerlevel10k theme
echo "Installing powerlevel10k..."
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh plugins
echo "Installing zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/wting/autojump.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
cd ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/autojump
./install.py
cd ~
git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-bat

# Clone Neovim repository and build Neovim
echo "Cloning and building Neovim..."
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.9.2
make CMAKE_BUILD_TYPE=RelWithDebInfo

# Modify CMakeLists.txt if needed for build issues
sed -i 's|set(CMAKE_BUILD_TYPE .*)|set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build." FORCE)|' CMakeLists.txt

# Configure dependencies
cd .deps
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo ../cmake.deps
cd ..
sudo make install
cd ~

# Set up nvim configuration
echo "Configuring Neovim..."
cd ~/.config/
git clone https://github.com/GLICO-git/nvim && cd nvim/lua/user
#nvim plugins.lua -c "PackerInstall" -c "TSUpdate c lua" -c "q"
#nvim ~/.config/nvim/init.lua

# Update .zshrc with aliases and plugin sources
echo "Configuring .zshrc..."
echo 'alias vi=nvim
alias cat=batcat
function chpwd(){
    emulate -L zsh
    ls
}
source ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh' >> ~/.zshrc

pip3 install flake8
pip3 install black


# Reboot the system to finalize installation
echo "Setup complete! The system will now reboot."
#sudo reboot

nvim
