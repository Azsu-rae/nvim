#! /bin/bash

if ! brew list | grep tree-sitter; then
    brew install tree-sitter-cli
fi

if ! brew list | grep ripgrep; then
    brew install ripgrep
fi
