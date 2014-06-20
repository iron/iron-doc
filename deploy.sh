make nightly-install
./configure
make exe
cd deps/iron
make doc
cd ../..
cp -r deps/iron/doc doc
./bin/main

