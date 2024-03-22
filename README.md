# Prerequisite
$ sudo apt update

$ curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

$ sudo apt install -y git make cmake gcc g++ clang-format libtool libtool-bin autoconf automake pkg-config unzip zsh bat

$ mkdir -p ~/.local/bin

$ ln -s /usr/bin/batcat ~/.local/bin/bat

##### oh-my-zsh
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

##### powerlevel10k
$ git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

##### zsh-autosuggestion
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

##### zsh-syntaxhighlighting
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##### autojump
$ git clone git://github.com/wting/autojump.git
$ cd autojump
$ ./install.py or ./uninstall.py

##### zsh-bat
git clone https://github.com/fdellwing/zsh-bat.git $ZSH_CUSTOM/plugins/zsh-bat


# How to Install Nvim 0.9.2

$ git clone https://github.com/neovim/neovim.git

$ cd neovim

$ git checkout v0.9.2

$ make CMAKE_BUILD_TYPE=RelWithDebInfo

$ sudo make install


### Well known error
$ sudo apt install gettext

use ({ "nvim-neotest/nvim-nio" })
  -> in plugin.lua

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
    source /home/ssu-20201750/.oh-my-zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /home/ssu-20201750/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    [[ -s /home/ssu-20201750/.autojump/etc/profile.d/autojump.sh ]] && source /home/ssu-20201750/.autojump/etc/profile.d/autojump.sh
    autoload -U compinit && compinit -u
    
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

```
