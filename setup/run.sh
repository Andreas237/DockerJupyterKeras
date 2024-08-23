#!/bin/bash
#TODO: cleanup the incontainer path
NAME=$(cat DOCKER_IMAGE_NAME)
NB_LOCATION_HOST=./notebooks/
CONTAINER_WORKDIR=/work
DATASETS_PATH_HOST=./datasets/

# echo "-----------------------------------------------"
# echo "+++++++++++++++++++++++++++++++++++++++++++++++"
# echo
# echo "Use the Jupyter URL provided, but change 'hostname' to 'localhost' and use port '8080' rather than '8888'."
# echo
# echo "+++++++++++++++++++++++++++++++++++++++++++++++"
# echo "-----------------------------------------------"


if [[ "$1" == "cpu" ]]; then
docker run \
--ipc=host \
--ulimit memlock=-1 \
-it \
-p 8080:8888 \
--read-only -v ${DATASETS_PATH_HOST}:${CONTAINER_WORKDIR} \
-v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
--rm \
${NAME} jupyter-lab --ip 0.0.0.0 --no-browser ${CONTAINER_WORKDIR}


elif [[ $1 == "gpu" ]]; then
docker run \
--gpus all \
--ipc=host \
--ulimit memlock=-1 \
-it \
-p 8080:8888 \
--read-only -v ${DATASETS_PATH_HOST}:${CONTAINER_WORKDIR} \
-v ${NB_LOCATION_HOST}:${CONTAINER_WORKDIR} \
-v 
--rm \
nvcr.io/nvidia/tensorflow:23.09-tf2-py3 jupyter-lab --ip 0.0.0.0 --no-browser ${CONTAINER_WORKDIR}

else
echo "Received $1"
echo 'Use "gpu" to use a GPU accelerated container with only Tensorflow'
echo 'Use "deepsig" to use a CPU only container with the libraries needed for the DeepSig workbook'
fi