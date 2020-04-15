#!/bin/bash
CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
RUST_VERSION=nightly
if [[ -e nearcore ]]; then
    cd nearcore;
    git checkout stable || (git reset --hard HEAD && git checkout stable)
    git pull
else
    git clone --depth=1 -b stable https://github.com/nearprotocol/nearcore;
    cd nearcore
fi

COMMAND="cargo build -p near-vm-runner-standalone"

if [[ ! -e $CARGO_HOME ]]; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y --no-modify-path --default-toolchain $RUST_VERSION;
    COMMAND="$HOME/.cargo/bin/cargo build -p near-vm-runner-standalone"
fi
# rustup target add x86_64-apple-darwin
# rustup target add x86_64-unknown-linux-musl
# rustup target add x86_64-pc-windows-msvc

$COMMAND --release --target="$1"
# $COMMAND --release --target=x86_64-pc-windows-msvc
# $COMMAND --release --target=x86_64-unknown-linux-musl
