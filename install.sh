#!/bin/sh

# Env
NEO_APP_NAME=nvim
NEO_APP_CONFIG=~/.config/$NEO_APP_NAME
NEO_APP_CACHE=~/.cache/$NEO_APP_NAME
NEO_APP_SHARE=~/.local/share/$NEO_APP_NAME
NEO_APP_STATE=~/.local/state/$NEO_APP_NAME
export NEO_APP_NAME NEO_APP_CONFIG NEO_APP_CACHE NEO_APP_SHARE NEO_APP_STATE

# Uninstalling the old config
echo "Uninstalling $NEO_APP_NAME ..."
rm -rfv $NEO_APP_CONFIG $NEO_APP_CACHE $NEO_APP_SHARE $NEO_APP_STATE
echo "DONE!\n"

# Installing the new config
echo "Installing $NEO_APP_NAME ..."
mkdir -p $NEO_APP_CONFIG
cp -Rv ./lua $NEO_APP_CONFIG/lua
cp -v .neoconf.json $NEO_APP_CONFIG/.neoconf.json
cp -v init.lua $NEO_APP_CONFIG/init.lua
cp -v stylua.toml $NEO_APP_CONFIG/stylua.toml
# stow --verbose --restow --target=$NEO_APP_CONFIG .
echo "DONE!\n"

#alias mnv="NVIM_APPNAME=$NEO_APP_NAME nvim"
