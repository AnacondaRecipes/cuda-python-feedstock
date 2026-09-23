#!/bin/bash
set -euo pipefail

# Build subpackage
export CUDA_HOME="${PREFIX}/${SUBDIR}"

DIR_NAME="$(echo $PKG_NAME | tr '-' '_')"
cd $DIR_NAME

$PYTHON -m pip install . --no-deps --no-build-isolation -vv

# Clean up Cython temporary files from site-packages directory
find $SP_DIR -name "*.c" -type f -delete
find $SP_DIR -name "*.cpp" -type f -delete
