set DIR_NAME=%PKG_NAME:-=_%
cd %DIR_NAME%

%PYTHON% -m pip install . -vv --no-deps --no-build-isolation
IF %ERRORLEVEL% NEQ 0 EXIT /B %ERRORLEVEL%

:: Clean up Cython temporary files from site-packages directory
del /s /q %SP_DIR%\*.c
del /s /q %SP_DIR%\*.cpp
