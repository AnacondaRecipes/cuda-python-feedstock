:: Build subpackage
set "CUDA_HOME=%PREFIX%\\%SUBDIR%"
set "LIB=%PREFIX%\\%SUBDIR%\\lib\\%TARGET_NAME%;%LIB%"

set DIR_NAME=%PKG_NAME:-=_%
cd %DIR_NAME%
IF "%DIR_NAME%"=="cuda_python" (
  REM The upstream setup.py calls get_version() without dist_name,
  REM so only the generic SETUPTOOLS_SCM_PRETEND_VERSION is honored.
  SET "SETUPTOOLS_SCM_PRETEND_VERSION=%PKG_VERSION%"
)
%PYTHON% -m pip install . --no-deps --no-build-isolation -vv
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Clean up Cython temporary files from site-packages directory
del /s /q %SP_DIR%\*.c
del /s /q %SP_DIR%\*.cpp
