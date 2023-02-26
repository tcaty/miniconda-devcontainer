# Быстрый старт на ML1

## Удаленное подключение с помощью vscode

Прежде чем поднять контейнер на ML1, необходимо подключиться к этому серверу. Для этого надо скачать расширение <b>Remote - SSH</b> (ms-vscode-remote.remote-ssh).

# Подробности

devcontainer cli

devcontainer build --workspace-folder . --image-name miniconda-devcontainer:latest
docker create --mount type=bind,source=/home/tcaty/Programming/work/python/container-a,target=/usr/src
