FROM mambaorg/micromamba:2.0.5


# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
COPY --chown=$MAMBA_USER:$MAMBA_USER .devcontainer/env.txt /tmp/env.txt
RUN micromamba create --name test --file /tmp/env.txt && \
    micromamba clean --all --yes

USER micromambauser
# change directory
WORKDIR /home/micromambauser
RUN wget https://genomics.lshtm.ac.uk/data-mapping.v1.3.tgz
RUN tar -xvzf data-mapping.v1.3.tgz

# [Optional] Uncomment to install a different version of Python than the default
# RUN conda install -y python=3.6 \
#     && pip install --no-cache-dir pipx \
#     && pipx reinstall-all

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>
