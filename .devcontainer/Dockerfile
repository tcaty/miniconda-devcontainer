FROM continuumio/miniconda3:latest

WORKDIR /usr/src

RUN apt-get update && \
    apt-get install ffmpeg libsm6 libxext6 -y

COPY . .
RUN conda env create -f venv/environment.yml

ENTRYPOINT sleep infinity