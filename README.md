# How to Install Nvim 0.9.2
sudo apt update
sudo apt install -y git make cmake gcc g++ libtool libtool-bin autoconf automake pkg-config unzip
sudo apt-get install -y nodejs
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout v0.9.2
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install


### Well known error
sudo apt install gettext
