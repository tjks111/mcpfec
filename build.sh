#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Building mcpo (Python dependencies)..."
# Create and activate a virtual environment
python3 -m venv .venv
. .venv/bin/activate
# Assuming Railway provides a Python environment and uv
uv sync --locked
# Deactivate the virtual environment
deactivate

echo "Building mcp-openfec (Node.js dependencies and build)..."
cd mcp-openfec
npm install
npm run build
cd ..

echo "Build complete."
