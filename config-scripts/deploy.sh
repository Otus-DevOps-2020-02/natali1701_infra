#!/bin/bash

echo "***Kopiruem kod prilozheniya***"
git clone -b monolith https://github.com/express42/reddit.git

echo "***Perexodim v directoriyu proecta i cherez bundler stavim zavisimosti***"
cd reddit && bundle install

echo "***Zapusk servera prilozheniya v papke proekt***"
puma -d

echo "***Proverka zapuska servera i smotrim port na kotorom slushaet***"
ps aux | grep puma
