#!/bin/bash

# Build subpackage
export CUDA_HOME="${PREFIX}/${SUBDIR}"

DIR_NAME="$(echo $PKG_NAME | tr '-' '_')"
cd $DIR_NAME
if [[ ${DIR_NAME} == "cuda_python" ]]; then
  # The upstream setup.py calls get_version() without dist_name,
  # so only the generic SETUPTOOLS_SCM_PRETEND_VERSION is honored.
  export SETUPTOOLS_SCM_PRETEND_VERSION=${PKG_VERSION}
fi
$PYTHON -m pip install . --no-deps --no-build-isolation -vv

# Clean up Cython temporary files from site-packages directory
find $SP_DIR -name "*.c" -type f -delete
find $SP_DIR -name "*.cpp" -type f -delete
