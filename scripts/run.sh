#!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Activate virtual environment
echo "Activating virtual environment..."
source "$PROJECT_ROOT/.venv/bin/activate"

# Run the API
echo "Starting STCP API..."
cd "$PROJECT_ROOT"
uvicorn main:app --reload --host 0.0.0.0 --port 8000

# Keep terminal open
echo "Press any key to close..."
read -n 1 -s