FROM mcr.microsoft.com/devcontainers/miniconda:1-3

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file

USER vscode
WORKDIR /home/vscode

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
RUN bash Miniforge3-Linux-x86_64.sh -b
RUN bash -c "source /home/vscode/miniforge3/etc/profile.d/conda.sh && conda init bash"

# set up conda environment
COPY .devcontainer/task.txt  /tmp/task.txt
RUN /home/vscode/miniforge3/condabin/mamba create --name task --file /tmp/task.txt && \
    /home/vscode/miniforge3/condabin/mamba clean --all --yes


### Data download

RUN wget http://genomics.lshtm.ac.uk/test.tar.gz
RUN tar -xvzf test.tar.gz
RUN rm test.tar.gz Miniforge3-Linux-x86_64.sh