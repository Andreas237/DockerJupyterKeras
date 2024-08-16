# Dockerized Jupyter

This is my take on Dockerized Jupyter.  I use it for Keras and Tensorflow projects.  It assumes datasets are in `<current working director>/datasets`.


# How to use it

`chmod +x setup.sh` builds the Dockerfile in `setup/` and opens a Jupyter notebook which mounts the `notebooks/` directory for reading and writing and `/opt/datasets` for reading.