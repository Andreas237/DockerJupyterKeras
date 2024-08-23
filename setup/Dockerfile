FROM nvcr.io/nvidia/tensorflow:23.09-tf2-py3

RUN apt update && apt upgrade -y \
    && apt install -y python3-pip \
    && python3 -m pip install --upgrade pip

RUN echo python3 --version
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt

RUN python3 -m pip install \
    --extra-index-url=https://pypi.nvidia.com \
    cudf-cu12==23.12.* dask-cudf-cu12==23.12.* cuml-cu12==23.12.* \
    cugraph-cu12==23.12.* cuspatial-cu12==23.12.* cuproj-cu12==23.12.* \
    cuxfilter-cu12==23.12.* cucim-cu12==23.12.* pylibraft-cu12==23.12.* \
    raft-dask-cu12==23.12.*

RUN python3 -m pip install --upgrade jupyterlab

WORKDIR /work
