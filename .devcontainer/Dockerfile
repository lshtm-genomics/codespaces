FROM mcr.microsoft.com/devcontainers/miniconda:1-3

# Install OS packages (small layer)
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends firefox-esr gnumeric qpdfview file \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode

# Copy environment files
COPY .devcontainer/assembly.txt  /tmp/assembly.txt
COPY .devcontainer/busco.txt  /tmp/busco.txt

# Create busco environment (separate layer)
RUN /opt/conda/condabin/mamba create --name busco --file /tmp/busco.txt -y && \
    mamba clean --all --yes

# Create assembly environment (separate layer)
RUN /opt/conda/condabin/mamba create --name assembly --file /tmp/assembly.txt -y && \
    mamba clean --all --yes

# Download and extract assembly data (separate layer)
RUN wget http://genomics.lshtm.ac.uk/assembly.tar.gz && \
    tar -xzf assembly.tar.gz && \
    rm assembly.tar.gz

# Set up shell initialization
RUN bash -c "source /opt/conda/etc/profile.d/conda.sh && conda init bash"