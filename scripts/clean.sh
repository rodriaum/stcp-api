#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Remove virtual environment
echo "Removing virtual environment..."
rm -rf "$PROJECT_ROOT/.venv"

# Remove cache files
echo "Removing cache files..."
rm -f "$PROJECT_ROOT/hash.tmp"
rm -rf "$PROJECT_ROOT/__pycache__"
rm -rf "$PROJECT_ROOT/stcp/__pycache__"

echo "Clean completed successfully!"

# Keep terminal open
echo "Press any key to close..."
read -n 1 -s