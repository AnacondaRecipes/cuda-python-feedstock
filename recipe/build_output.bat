:: Build subpackage
set DIR_NAME=%PKG_NAME:-=_%
cd %DIR_NAME%
%PYTHON% -m pip install . --no-deps --no-build-isolation -vv

:: Clean up Cython temporary files from site-packages directory
del /s /q %SP_DIR%\*.c
del /s /q %SP_DIR%\*.cpp
