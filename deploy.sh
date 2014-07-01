updateIronDoc() {
  rm -rf $1
  git clone "https://github.com/iron/$1.git"
  cd $1
  rustdoc -L target/deps -o ../doc src/lib.rs --html-in-header ../../head.html --html-before-content ../../header.html --html-after-content ../../footer.html
  cd ..
}

# Generate documentation
mkdir -p ./core
cd core
updateIronDoc iron
updateIronDoc urlencoded
updateIronDoc logger
updateIronDoc router
updateIronDoc mount
updateIronDoc persistent
updateIronDoc static-file
updateIronDoc session
updateIronDoc cookie
updateIronDoc body-parser
cd ..

# Serve documentation
cargo build -u
