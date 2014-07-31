#!/bin/sh

set -eu

# Update Rust
make nightly-uninstall
make nightly-install

# Update Cargo

# Generate Iron documentation
mkdir -p iron
cd iron
./../updateIronDoc iron
cd ..

# Generate core documentation
mkdir -p core
cd core
./../updateIronDoc iron
./../updateIronDoc urlencoded
./../updateIronDoc logger
./../updateIronDoc router
./../updateIronDoc mount
./../updateIronDoc persistent
./../updateIronDoc static-file
./../updateIronDoc session
./../updateIronDoc cookie
./../updateIronDoc body-parser
cd ..

# Serve documentation
cargo build -u
./target/serve_docs
