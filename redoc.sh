updateIronDoc() {
  cd $1
  rustdoc -L target/deps -o ../doc src/lib.rs
  cd ..
}

rm -rf core/doc

# Update documentation
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

