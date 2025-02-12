#!/bin/bash

# Description : Development Environment Setup Script
# Author: Raviteja
# Date: Feburary 12, 2025
# Version: 1.0
#
# This script automates the Development Environment including dependencies, configurations and required tools.

############################# NEOVIM installation ################################
##################################################################################
# Install dependencies
sudo apt-get install ninja-build gettext cmake unzip curl

# Clone repository
git clone https://github.com/neovim/neovim
cd neovim

# Checkout stable version
git checkout stable

# Build and install
make CMAKE_BUILD_TYPE=Release
sudo make install
##################################################################################

# neovim setup
mkdir ~/.config/nvim
git clone https://github.com/RavitejaKarra24/Config-files.git
cd Config-files
cd theprimeagen 
cd nvim_lazy
mv ./* ~/.config/nvim
source ~/.config/nvim/init.lua
cd ~


# install git
sudo apt install git

