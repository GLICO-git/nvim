# How to Install Nvim 0.9.2

$ sudo apt update

$ curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

$ sudo apt install -y git make cmake gcc g++ libtool libtool-bin autoconf automake pkg-config unzip

$ git clone https://github.com/neovim/neovim.git

$ cd neovim

$ git checkout v0.9.2

$ make CMAKE_BUILD_TYPE=RelWithDebInfo

$ sudo make install


### Well known error
$ sudo apt install gettext


### After install nvim

$ cd ~/.config/

$ git clone https://github.com/GLICO-git/nvim && cd nvim/lua/user

$ nvim plugins.lua

:w (packer install automatic)
:TSUpdate c lua
:q 

$ nvim ~/.config/nvim/init.lua

uncomment all

