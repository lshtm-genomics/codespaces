FROM mcr.microsoft.com/devcontainers/miniconda:0-3

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY .devcontainer/env.txt /tmp/conda-tmp/
RUN /opt/conda/bin/conda create --name mapping --file /tmp/conda-tmp/env.txt && rm -rf /tmp/conda-tmp

# change to user vscode 
USER vscode
# change directory
WORKDIR $HOME
RUN wget https://genomics.lshtm.ac.uk/data-mapping.v1.3.tgz
RUN tar -xvzf data-mapping.v1.3.tgz
RUN rm data-mapping.v1.3.tgz

# [Optional] Uncomment to install a different version of Python than the default
# RUN conda install -y python=3.6 \
#     && pip install --no-cache-dir pipx \
#     && pipx reinstall-all

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
