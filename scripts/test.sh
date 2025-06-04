 #!/bin/bash

# Get the directory where the script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

# Activate virtual environment
echo "Activating virtual environment..."
source "$PROJECT_ROOT/.venv/bin/activate"

# Test endpoints
echo "Testing API endpoints..."

# Test health endpoint
echo "Testing health endpoint..."
curl -s http://localhost:8000/health | jq .

# Test lines endpoint
echo "Testing lines endpoint..."
curl -s http://localhost:8000/lines | jq .

# Test a specific line (e.g., line 1)
echo "Testing line directions endpoint..."
curl -s http://localhost:8000/lines/1/directions | jq .

echo "Tests completed!"

# Keep terminal open
echo "Press any key to close..."
read -n 1 -s