#!/bin/bash

# Please make sure that download-vscode-server.sh script
# downloads only one commit in ~/.vscode-server/bin folder

commit_sha=$(ls /root/.vscode-server/bin)
export PATH="$PATH:/root/.vscode-server/bin/$commit_sha/bin"

for line in $(jq '.customizations.vscode.extensions' .devcontainer/devcontainer.json); do
  if [[ $line != '[' && $line != ']' ]]; then
    extension=$(echo $line | tr -d '",')
    code-server --install-extension $extension --force
  fi
done