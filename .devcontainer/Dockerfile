FROM ubuntu:22.04 as vscode-server-setup

ARG DISTDIR=./.devcontainer
ARG SCRIPTS_DIR=${DISTDIR}/scripts
ARG DOWNLOAD_VSCODE_SERVER_SCRIPT=${SCRIPTS_DIR}/download-vscode-server.sh
ARG INSTALL_VSCODE_EXTENSIONS_SCRIPT=${SCRIPTS_DIR}/install-vscode-extensions.sh

COPY ${DISTDIR} ${DISTDIR}

RUN apt-get update && \
    apt-get install curl jq -y

RUN chmod +x ${DOWNLOAD_VSCODE_SERVER_SCRIPT} && \ 
    bash -c ${DOWNLOAD_VSCODE_SERVER_SCRIPT}

RUN chmod +x ${INSTALL_VSCODE_EXTENSIONS_SCRIPT} && \
    bash -c ${INSTALL_VSCODE_EXTENSIONS_SCRIPT}

FROM continuumio/miniconda3:master

ARG DISTDIR=src
ARG VSCODE_SERVER_PATH=/root/.vscode-server

WORKDIR /usr

COPY ${DISTDIR} ${DISTDIR}
COPY --from=vscode-server-setup ${VSCODE_SERVER_PATH} ${VSCODE_SERVER_PATH}

RUN apt-get update && \
    apt-get install ffmpeg libsm6 libxext6 -y

RUN conda env create -f ./${DISTDIR}/venv/environment.yml

ENTRYPOINT sleep infinity