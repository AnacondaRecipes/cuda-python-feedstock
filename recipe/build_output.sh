#!/bin/bash
set -euo pipefail

DIR_NAME="$(echo $PKG_NAME | tr '-' '_')"
cd $DIR_NAME

$PYTHON -m pip install . -vv --no-deps --no-build-isolation

# Clean up Cython temporary files from site-packages directory
find $SP_DIR -name "*.c" -type f -delete
find $SP_DIR -name "*.cpp" -type f -delete
