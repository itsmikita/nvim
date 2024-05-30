#!/bin/sh

NEO_APP_NAME=nvim
NEO_APP_CONFIG=~/.config/$NEO_APP_NAME
NEO_APP_CACHE=~/.cache/$NEO_APP_NAME
NEO_APP_SHARE=~/.local/share/$NEO_APP_NAME
NEO_APP_STATE=~/.local/state/$NEO_APP_NAME

echo "Uninstalling $NEO_APP_NAME..."

rm -rfv $NEO_APP_CONFIG $NEO_APP_CACHE $NEO_APP_SHARE $NEO_APP_STATE

echo "DONE!"