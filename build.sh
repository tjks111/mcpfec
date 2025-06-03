#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Building mcpo (Python dependencies)..."
# Assuming Railway provides a Python environment and pip
pip install -r mcpo/requirements.txt
# Or if using uv: uv sync --locked mcpo/uv.lock

echo "Building mcp-openfec (Node.js dependencies and build)..."
cd mcp-openfec
npm install
npm run build
cd ..

echo "Build complete."
