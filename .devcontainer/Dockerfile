FROM mcr.microsoft.com/devcontainers/miniconda:1-3

USER vscode
WORKDIR /home/vscode

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh
RUN bash -b Miniforge3-Linux-x86_64.sh

# install sudo 
# USER root
# RUN apt-get update && apt-get install -y sudo procps wget

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
# USER mambauser
# COPY --chown=$MAMBA_USER:$MAMBA_USER .devcontainer/env.txt /tmp/env.txt
# RUN micromamba create --name test --file /tmp/env.txt && \
#     micromamba clean --all --yes


# # change directory
# WORKDIR /home/mambauser

# RUN wget https://genomics.lshtm.ac.uk/data-mapping.v1.3.tgz
# RUN tar -xvzf data-mapping.v1.3.tgz





# [Optional] Uncomment to install a different version of Python than the default
# RUN conda install -y python=3.6 \
#     && pip install --no-cache-dir pipx \
#     && pipx reinstall-all

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
