#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -fsSL https://get.pnpm.io/install.sh | sh -

# Install command-line tools using Homebrew.
./brew.sh