@echo on

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
if %ERRORLEVEL% neq 0 exit 1

COPY %LIBRARY_PREFIX%\lib\libssh2.lib %LIBRARY_PREFIX%\lib\ssh2.lib
if %ERRORLEVEL% neq 0 exit 1

cargo build --release --locked
if %ERRORLEVEL% neq 0 exit 1

RM %LIBRARY_PREFIX%\lib\libssh2.lib
if %ERRORLEVEL% neq 0 exit 1

MKDIR %LIBRARY_PREFIX%\bin
if %ERRORLEVEL% neq 0 exit 1

MOVE target\release\meilisearch.exe %LIBRARY_PREFIX%\bin\meilisearch.exe
if %ERRORLEVEL% neq 0 exit 1

MOVE target\release\meilitool.exe %LIBRARY_PREFIX%\bin\meilitool.exe
if %ERRORLEVEL% neq 0 exit 1
