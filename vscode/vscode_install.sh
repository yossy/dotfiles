#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0) && pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

rm "$VSCODE_SETTING_DIR/settings.json"
ln -s "$SCRIPT_DIR/settings.json" "${VSCODE_SETTING_DIR}/settings.json"

rm "$VSCODE_SETTING_DIR/keybindings.json"
ln -s "$SCRIPT_DIR/keybindings.json" "${VSCODE_SETTING_DIR}/keybindings.json"

# install extention
cat "${SCRIPT_DIR}/extensions.txt" | while read line
do
 code --install-extension $line
done

code --list-extensions > "${SCRIPT_DIR}/extensions.txt"

# VSCodeVimでNomalMode切り替え時に英数入力に変更するためim-selectをinstallする。
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh
