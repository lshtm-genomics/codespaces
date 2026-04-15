FROM mcr.microsoft.com/devcontainers/miniconda:1-3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file wget \
    && apt-get clean

USER vscode
WORKDIR /home/vscode

COPY .devcontainer/tb_transcriptomics.txt /tmp/tb_transcriptomics.txt

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda

RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && conda install -y mamba"

# Initialize conda and create environments
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    mamba create -y -n assembly --file /tmp/tb_transcriptomics.txt && \
    mamba clean --all -y"

RUN conda init bash

RUN wget http://genomics.lshtm.ac.uk/tb_transcriptomics.tar.gz && \
    tar -xvzf tb_transcriptomics.tar.gz && \
    rm tb_transcriptomics.tar.gz