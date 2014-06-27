updateIron() {
  rm -rf $1
  git clone "https://github.com/reem/$1.git"
  cd $1
  cargo build -uv
  rustdoc -L target/deps -o ../doc src/lib.rs
  cd ..
}

updateIronDoc() {
  rm -rf $1
  git clone "https://github.com/iron/$1.git"
  cd $1
  cargo build -v
  rustdoc -L target/deps -o ../doc src/lib.rs
  cd ..
}

# Generate Iron documentation
mkdir -p iron
cd iron
updateIron iron
cd ..

# Generate core documentation
mkdir -p ./core
cd core
updateIron iron
updateIronDoc urlencoded
updateIronDoc logger
updateIronDoc router
updateIronDoc mount
updateIronDoc persistent
updateIronDoc static-file
updateIronDoc session
updateIronDoc cookie
updateIronDoc body-parser
pwd
cd ..

# Serve documentation
cargo build -u
