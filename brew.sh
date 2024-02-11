#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Use the latest Homebrew.
brew update

# Upgrade already-installed formulae.
brew upgrade

# Install useful tools.
brew install alfred
brew install brotli
brew install gh
brew install hyperfine
brew install --cask iterm2
brew install jq
brew install k6
brew install jandedobbeleer/oh-my-posh/oh-my-posh
brew install rectangle

brew tap bramstein/webfonttools
brew install woff2

# Remove outdated versions from the cellar.
brew cleanup