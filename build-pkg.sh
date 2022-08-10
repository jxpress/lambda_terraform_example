#!/bin/bash

set -e

WORK_DIR="/tmp/lambda-pkg-$(date +%s)"
DEPS_DIR="${WORK_DIR}/depends"
DIST_DIR="${WORK_DIR}/dists"
OUT_DIR=$(pwd)/terraform

mkdir $WORK_DIR
mkdir $DEPS_DIR
mkdir $DIST_DIR

pipenv lock -r > requirements.txt
pip install -r requirements.txt -t ${DIST_DIR}/
cp -r ./functions/* ${DIST_DIR}/

cd ${DIST_DIR}/ && zip -q -r dists.zip * && mv dists.zip ${OUT_DIR}/
