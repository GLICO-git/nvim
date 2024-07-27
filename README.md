# Prerequisite
$ sudo apt update

$ curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

$ sudo apt install -y git make cmake gcc g++ clang-format libtool libtool-bin autoconf automake pkg-config unzip zsh bat gettext

$ mkdir -p ~/.local/bin

$ ln -s /usr/bin/batcat ~/.local/bin/bat

##### oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

### Install Font
```
#/bin/bash
# install DroidSansMono Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.local/share/fonts
fc-cache -fv
echo "done!"
```

##### powerlevel10k
1. $ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

##### zsh-autosuggestion
1. $ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

##### zsh-syntaxhighlighting
1. $ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##### autojump
1. $ git clone https://github.com/wting/autojump.git ${ZSH_CUSTOM}/plugins/autojump
2. $ cd ${ZSH_CUSTOM}/plugins/autojump
3. $ ./install.py

##### zsh-bat
1. git clone https://github.com/fdellwing/zsh-bat.git ${ZSH_CUSTOM}/plugins/zsh-bat


# How to Install Nvim 0.9.2

$ git clone https://github.com/neovim/neovim.git

$ cd neovim

$ git checkout v0.9.2

$ make CMAKE_BUILD_TYPE=RelWithDebInfo

# Trouble Shooting
### Build error for RelWithDebInfo
1. Edit CMakeLists.txt
```
# CMakeLists.txt

set(CMAKE_CONFIGURATION_TYPES "Debug;Release;MinSizeRel;RelWithDebInfo" CACHE STRING "Possible build types")
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "RelWithDebInfo" CACHE STRING "Choose the type of build." FORCE)
endif()

message(STATUS "Build type: ${CMAKE_BUILD_TYPE}")

```
2. Config .deps/Cmake
```
cd .deps
cmake -G 'Unix Makefiles' -DCMAKE_BUILD_TYPE=RelWithDebInfo /home/glico/neovim/cmake.deps
```

$ sudo make install

### After install nvim

$ cd ~/.config/

$ git clone https://github.com/GLICO-git/nvim && cd nvim/lua/user

$ nvim plugins.lua

:w (packer install automatic)
:TSUpdate c lua
:q 


$ nvim ~/.config/nvim/init.lua

uncomment all


### cf) .zshrc
```
alias vi=nvim
alias cat=batcat
function chpwd(){
    emulate -L zsh
    ls
}
source ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ${ZSH_CUSTOM}/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[[ -s ${HOME}/.autojump/etc/profile.d/autojump.sh ]] && source ${HOME}/.autojump/etc/profile.d/autojump.sh
    autoload -U compinit && compinit -u
    
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

```
### Reboot your machine
$ sudo reboot
