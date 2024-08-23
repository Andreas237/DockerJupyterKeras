#!/bin/bash

help() {
    echo
    echo
    echo "This program starts a Docker container with a Jupyter server. Run with: "
    echo
    echo "    >> setup.sh [cpu | gpu] "
    echo
    echo "'cpu' option uses only CPUs"
    echo "'GPU' option attaches all GPUs"
    echo
    echo
}


run() {
    echo "run function received argument '$1'"
    NAME=$(cat setup/DOCKER_IMAGE_NAME)
    NB_LOCATION_HOST=./notebooks/
    DATASETS_PATH_HOST=${NB_LOCATION_HOST}/datasets/
    CONTAINER_WORKDIR=/work
    CONTAINER_DATADIR=${CONTAINER_WORKDIR}/datasets/
    JUPYTER_PORT=8888


    if [[ "$1" == "cpu" ]]; then
    printf "Running CPU only container\n"
    docker run \
    --shm-size=1G \
    --ipc=host \
    --ulimit memlock=-1 \
    -it \
    -p 8888:8888 \
    -v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
    --rm \
    ${NAME} jupyter-lab --ip 0.0.0.0 --port=${JUPYTER_PORT} --no-browser ${CONTAINER_WORKDIR} --allow-root


    # elif [[ $1 == "gpu" ]]; then
    # printf "Running GPU enabled container\n"
    # docker run \
    # --gpus all \
    # --shm-size=1G \
    # --ipc=host \
    # --ulimit memlock=-1 \
    # -it \
    # -p 8080:8888 \
    # --read-only -v ${DATASETS_PATH_HOST}:${CONTAINER_DATADIR} \
    # -v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
    # -v 
    # --rm \
    # nvcr.io/nvidia/tensorflow:23.09-tf2-py3 jupyter-lab --ip 0.0.0.0 --port=${JUPYTER_PORT} --no-browser ${CONTAINER_WORKDIR}

    # else
    # echo "Received $1"
    # echo 'Use "gpu" to use a GPU accelerated container with only Tensorflow'
    # echo 'Use "deepsig" to use a CPU only container with the libraries needed for the DeepSig workbook'
    fi
}



if [[ "$1" == "help" ]]; then
    help
    exit 0;
fi



pushd setup/
current_dir=`pwd`
./build.sh
popd
run $1

