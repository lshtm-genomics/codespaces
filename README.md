# teaching-codespaces

## Adding a new Codespace

1. Create a new branch from `main` with the name of your new codespace.
2. Build your conda environment on linux.
3. Replace the contents of `.devcontainer/env.txt` with the output of `conda list --explicit` which should be run from your conda environment.
4. Upload a tar zip of your data to genomics.lshtm.ac.uk and replace the filenames in the `wget` and `tar` commands in "Data download" of the `.devcontainer/Dockerfile` file.