#!/bin/bash

set -e

FUNCS=()
for f in `ls functions`; do
    FUNCS+=(${f})
done

PYTHON_VERSION="3.8"
WORK_DIR="/tmp/lambda-pkg-$(date +%s)"
DEPS_DIR="${WORK_DIR}/depends"
DIST_DIR="${WORK_DIR}/dists"
OUT_DIR=$(pwd)/terraform

mkdir $WORK_DIR
mkdir $DEPS_DIR
mkdir $DIST_DIR

pipenv --python ${PYTHON_VERSION} install
cp -r $(pipenv --venv)/lib/python${PYTHON_VERSION}/site-packages/* $DEPS_DIR/
cp -r src $DEPS_DIR/
cp -r ${DEPS_DIR}/* ${DIST_DIR}/

for d in ${FUNCS[@]}; do
    FUNC_NAME=${d}
    cp functions/${FUNC_NAME}/main.py ${DIST_DIR}/lambda_${FUNC_NAME}.py
done

cd ${DIST_DIR}/ && zip -q -r dists.zip * && mv dists.zip ${OUT_DIR}/

wait
