FROM nvcr.io/nvidia/tensorflow:25.02-tf2-py3

WORKDIR /work

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY requirements.txt .

# RUN apt update && apt upgrade -y \
#     && apt install -y python3-pip curl ffmpeg libsm6 libxext6  \
#     && python3 -m pip install --upgrade pip \
#     && uv init && uv venv && source .venv/bin/activate \
#     && uv pip install -r requirements.txt \
#     && uv pip install \
#     --extra-index-url=https://pypi.nvidia.com \
#     cudf-cu12==24.2.* dask-cudf-cu12==24.2.* cuml-cu12==24.2.* \
#     cugraph-cu12==24.2.* cuspatial-cu12==24.2.* cuproj-cu12==24.2.* \
#     cuxfilter-cu12==24.2.* cucim-cu12==24.2.* pylibraft-cu12==24.2.* \
#     raft-dask-cu12==24.2.* \
#     && uv pip install --upgrade jupyterlab \ 
#     && mkdir -p /work/datasets && rm /work/notebooks/main.py

RUN uv pip install -r requirements.txt \
    && uv pip install --extra-index-url=https://pypi.nvidia.com \
        cudf-cu12==24.2.* dask-cudf-cu12==24.2.* cuml-cu12==24.2.* \
        cugraph-cu12==24.2.* cuspatial-cu12==24.2.* cuproj-cu12==24.2.* \
        cuxfilter-cu12==24.2.* cucim-cu12==24.2.* pylibraft-cu12==24.2.* \
        raft-dask-cu12==24.2.* \
    && uv pip install --upgrade jupyterlab
