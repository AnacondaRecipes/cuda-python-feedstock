:: Build subpackage
set "CUDA_HOME=%PREFIX%\\%SUBDIR%"
set "LIB=%PREFIX%\\%SUBDIR%\\lib\\%TARGET_NAME%;%LIB%"

set DIR_NAME=%PKG_NAME:-=_%
cd %DIR_NAME%

%PYTHON% -m pip install . --no-deps --no-build-isolation -vv
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Clean up Cython temporary files from site-packages directory
del /s /q %SP_DIR%\*.c
del /s /q %SP_DIR%\*.cpp
