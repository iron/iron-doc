#!/bin/sh

set -eu

# Update Rust
make nightly-uninstall
make nightly-install

# Update Cargo

# Generate Iron documentation
mkdir -p iron
(cd iron; ./../updateIronDoc iron)

# Generate core documentation
mkdir -p core

TARGETS="iron urlencoded logger router mount persistent static-file session cookie body-parser"

for target in $TARGETS; do
	(cd core; ./../updateIronDoc $target)
done

# Serve documentation
cargo build -u
./target/serve_docs
