FROM mcr.microsoft.com/devcontainers/miniconda:1-3

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview

USER vscode
WORKDIR /home/vscode

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
RUN bash Miniforge3-Linux-x86_64.sh -b
RUN bash -c "source /home/vscode/miniforge3/etc/profile.d/conda.sh && conda init bash"

# set up conda environment
COPY .devcontainer/env.txt  /tmp/env.txt
RUN /home/vscode/miniforge3/condabin/mamba create --name mapping --file /tmp/env.txt && \
    /home/vscode/miniforge3/condabin/mamba clean --all --yes


### Data download

# RUN wget https://genomics.lshtm.ac.uk/data-mapping.v1.3.tgz
# RUN tar -xvzf data-mapping.v1.3.tgz




