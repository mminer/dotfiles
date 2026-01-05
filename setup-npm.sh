#!/usr/bin/env bash

set -euo pipefail

echo "Installing npm packages."

npm install -g \
    @anthropic-ai/claude-code \
    @gltf-transform/cli \
    write-good
