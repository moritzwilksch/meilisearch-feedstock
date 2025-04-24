cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

export RUST_BACKTRACE=1
export MEILI_NO_VERGEN=0
export GIT2_SYS_USE_PKG_CONFIG=1
export PKG_CONFIG_ALLOW_CROSS=1
export PKG_CONFIG_LIBDIR=$PREFIX/lib/pkgconfig
cargo build --release --locked


mkdir -p $PREFIX/bin/
mv ./target/*/release/meilisearch $PREFIX/bin/meilisearch
mv ./target/*/release/meilitool $PREFIX/bin/meilitool
