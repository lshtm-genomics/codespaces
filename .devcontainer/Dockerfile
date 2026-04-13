FROM mcr.microsoft.com/devcontainers/miniconda:1-3

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file wget \
    && apt-get clean

USER vscode
WORKDIR /home/vscode

COPY .devcontainer/assembly.txt /tmp/assembly.txt
COPY .devcontainer/busco.txt /tmp/busco.txt

RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && conda install -y mamba"

# Initialize conda and create environments
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && \
    mamba create -y -n busco --file /tmp/busco.txt && \
    mamba create -y -n assembly --file /tmp/assembly.txt && \
    mamba clean --all -y"


RUN wget http://genomics.lshtm.ac.uk/assembly.tar.gz && \
    tar -xvzf assembly.tar.gz && \
    rm assembly.tar.gz