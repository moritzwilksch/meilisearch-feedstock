cargo-bundle-licenses --format yaml --output THIRDPARTY.yml

export RUST_BACKTRACE=1
export MEILI_NO_VERGEN=0
cargo build --release --locked


mkdir -p $PREFIX/bin/
mv ./target/*/release/meilisearch $PREFIX/bin/meilisearch
mv ./target/*/release/meilitool $PREFIX/bin/meilitool
