for extension in $(jq '.customizations.vscode.extensions' ../devcontainer.json); do
  code server --install-extension $extension
done