FROM mcr.microsoft.com/devcontainers/miniconda:1-3

# OS packages (kept from original — drop any you don't actually need for this lite version,
# e.g. firefox-esr/gnumeric/qpdfview aren't needed if students only view .qzv at view.qiime2.org)
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends zstd \
    && rm -rf /var/lib/apt/lists/*

USER vscode
WORKDIR /home/vscode

# --- lightweight placeholder env, just so `conda activate microbiome` works ---
# (no real QIIME2 install needed — nothing in this lite version actually runs it)
RUN conda create --name microbiome python=3.10 -y \
    && conda clean --all --yes \
    && echo "conda activate microbiome" >> /home/vscode/.bashrc

# --- canned reference outputs (the "answers" the fake tools copy into place) ---
RUN mkdir -p /opt/microbiome-canned \
    && wget -qO /tmp/canned.tar.zst \
       https://github.com/lshtm-genomics/codespaces/releases/download/v2/microbiome-canned.tar.zst \
    && zstd -d /tmp/canned.tar.zst -c | tar -xf - -C /opt/microbiome-canned --strip-components=1 \
    && rm /tmp/canned.tar.zst

# --- fake qiime / fastqc / multiqc stubs ---
COPY fake-bin/qiime fake-bin/fastqc fake-bin/multiqc /usr/local/bin/
USER root
RUN chmod +x /usr/local/bin/qiime /usr/local/bin/fastqc /usr/local/bin/multiqc
USER vscode

ENV MICROBIOME_CANNED=/opt/microbiome-canned

# --- seed the student's working dir with ONLY the real inputs ---
RUN mkdir -p /home/vscode/data/microbiome \
    && cp -r /opt/microbiome-canned/fastq /opt/microbiome-canned/db /opt/microbiome-canned/meta.csv \
       /home/vscode/data/microbiome/
