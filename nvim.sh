#!/usr/bin/sh

# https://github.com/neovim/neovim/pull/22128
NEO_APP_NAME=nvim
alias nvim="NVIM_APPNAME=$NEO_APP_NAME nvim"
nvim
