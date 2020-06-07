#!/bin/bash

echo "***Obnovlenie APT***"
sudo apt update

echo "***Ustanavlivaem Ruby i Bundler***"
sudo apt install -y ruby-full ruby-bundler build-essential

echo "***Versiya ruby***"

ruby -v

echo "***Versiya bundler***"

bundler -v
