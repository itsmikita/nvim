#!/bin/sh

NVIM_CONFIG_DIR=~/.config/nvim

echo "Removing existing Lua config..."
rm -rfv ./init.lua ./lua
mkdir ./lua
cp -rfv $NVIM_CONFIG_DIR/init.lua .
cp -rfv $NVIM_CONFIG_DIR/lua/* ./lua 
echo "DONE!"

