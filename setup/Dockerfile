FROM nvcr.io/nvidia/tensorflow:25.02-tf2-py3

WORKDIR /work

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
COPY requirements.txt .

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="${VIRTUAL_ENV}/bin:${PATH}"

RUN uv venv ${VIRTUAL_ENV} && uv pip install -r requirements.txt \
    && uv pip install jupyter \
    && uv pip install torch torchvision --index-url https://download.pytorch.org/whl/cu126 \
    && uv pip install \
       "cudf-cu12==26.8.*" "cuml-cu12==26.8.*"



ENTRYPOINT ["/opt/venv/bin/jupyter", "lab"]
