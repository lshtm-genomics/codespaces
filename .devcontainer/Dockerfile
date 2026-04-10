FROM mcr.microsoft.com/devcontainers/miniconda:1-3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file wget \
    && apt-get clean

USER vscode
WORKDIR /home/vscode

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh && \
    bash Miniforge3-Linux-x86_64.sh -b && \
    rm Miniforge3-Linux-x86_64.sh

ENV PATH="/home/vscode/miniforge3/bin:/home/vscode/miniforge3/condabin:${PATH}"

COPY .devcontainer/assembly.txt /tmp/assembly.txt
COPY .devcontainer/busco.txt /tmp/busco.txt

RUN mamba create -y -n busco --file /tmp/busco.txt && \
    mamba create -y -n assembly --file /tmp/assembly.txt && \
    mamba clean --all -y

RUN wget http://genomics.lshtm.ac.uk/assembly.tar.gz && \
    tar -xvzf assembly.tar.gz && \
    rm assembly.tar.gz