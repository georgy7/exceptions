#!/bin/bash

# Step 1. Making the docs.json

rm docs.json
rm source/docs.json
cd source
rdmd --build-only --force -lib -D -Xfdocs.json exceptions.d 
mv docs.json ../
rm exceptions.a
rm exceptions.html

# Step 2. Making the docs.

cd ..
dub run ddox -- generate-html docs.json docs/
ddoxFound=(~/.dub/packages/ddox-*)
cp -R  ${ddoxFound[0]}/ddox/public/* docs/
