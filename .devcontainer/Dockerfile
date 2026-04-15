FROM mcr.microsoft.com/devcontainers/miniconda:1-3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file wget \
    && apt-get clean

USER vscode
WORKDIR /home/vscode

COPY .devcontainer/tb_phylo.txt /tmp/tb_phylo.txt

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda

RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && conda install -y mamba"

# Initialize conda and create environments
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    mamba create -y -n assembly --file /tmp/tb_phylo.txt && \
    mamba clean --all -y"

RUN conda init bash

RUN wget http://genomics.lshtm.ac.uk/phylo_task.tar.gz && \
    tar -xvzf phylo_task.tar.gz && \
    rm phylo_task.tar.gz