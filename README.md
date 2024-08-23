# Dockerized Jupyter

This is my take on Dockerized Jupyter.  I use it for Keras and Tensorflow projects.  It assumes notebooks are in `<current working directory>/notebooks/` and datasets are in `<current working directory>/notebooks/datasets`.

Collaboration is installed by default (via `jupyter_collaboration`)!  So if you install this on a server feel free to work it with your team.  [See `jupyter_collaboration` docs](https://jupyterlab-realtime-collaboration.readthedocs.io/en/latest/).

# How to use it

Use `chmod +x run.sh` to make the builds the Dockerfile in `setup/` and opens a Jupyter notebook which mounts the `notebooks/` directory for reading and writing and `data/` for reading.  `notebooks/` will show up as your working directory, and there will be a subdirectory `data/` with your data.

Pass `cpu`, `gpu`, or `help` to `run.sh`.

`gpu`: run the Docker image with all system GPUs attached.

`cpu`: run the Docker image with just your CPU.

`help`: prints a help message.


# Feedback

Comments, questions, and suggestions are always welcome.  Please open an issue for any of them.