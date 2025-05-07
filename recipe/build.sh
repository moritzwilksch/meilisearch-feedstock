#!/bin/bash

set -euxo pipefail

export RUST_BACKTRACE=1
export MEILI_NO_VERGEN=0
export LIBGIT2_NO_VENDOR=1
export DYLD_FALLBACK_LIBRARY_PATH="${BUILD_PREFIX}/lib"

if [[ "${target_platform}" != "${build_platform}" ]]; then
  export RUSTFLAGS="${RUSTFLAGS:-} -L${BUILD_PREFIX}/lib"
  export LDFLAGS="${LDFLAGS} -L${BUILD_PREFIX}/lib"
fi

cargo build --release --locked

mkdir -p $PREFIX/bin/
mv ./target/*/release/meilisearch $PREFIX/bin/meilisearch
mv ./target/*/release/meilitool $PREFIX/bin/meilitool

cargo-bundle-licenses --format yaml --output THIRDPARTY.yml
