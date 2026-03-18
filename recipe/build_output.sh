#!/bin/bash

DIR_NAME="$(echo $PKG_NAME | tr '-' '_')"
cd $DIR_NAME
if [[ ${DIR_NAME} == "cuda_python" || ${DIR_NAME} == "cuda_bindings" ]]; then
  # The upstream setup.py calls get_version() without dist_name,
  # so only the generic SETUPTOOLS_SCM_PRETEND_VERSION is honored.
  export SETUPTOOLS_SCM_PRETEND_VERSION=${PKG_VERSION}
fi
$PYTHON -m pip install . -vv --no-deps --no-build-isolation

# Clean up Cython temporary files from site-packages directory
find $SP_DIR -name "*.c" -type f -delete
find $SP_DIR -name "*.cpp" -type f -delete
