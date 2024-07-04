#!/bin/bash

set -e

echo "Building for production..."
swift build -c release

if [ -f .build/release/ytmeta ]; then
    sudo cp .build/release/ytmeta /usr/local/bin/
    echo "ytmeta has been installed to /usr/local/bin"
else
    echo "Build failed: ytmeta not found in .build/release/"
    exit 1
fi
