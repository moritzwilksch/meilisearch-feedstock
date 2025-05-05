cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
COPY %LIBRARY_PREFIX%\lib\ssh2.lib %LIBRARY_PREFIX%\lib\libssh2.lib
cargo build --release --locked
RM %LIBRARY_PREFIX%\lib\libssh2.lib

MKDIR %LIBRARY_PREFIX%\bin

MOVE target\release\meilisearch.exe %LIBRARY_PREFIX%\bin\meilisearch.exe
MOVE target\release\meilitool.exe %LIBRARY_PREFIX%\bin\meilitool.exe
