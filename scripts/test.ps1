 # Get the directory where the script is located
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_ROOT = Split-Path -Parent $SCRIPT_DIR

# Activate virtual environment
Write-Host "Activating virtual environment..."
& "$PROJECT_ROOT\.venv\Scripts\Activate.ps1"

# Test endpoints
Write-Host "Testing API endpoints..."

# Test health endpoint
Write-Host "Testing health endpoint..."
Invoke-RestMethod -Uri "http://localhost:8000/health" | ConvertTo-Json

# Test lines endpoint
Write-Host "Testing lines endpoint..."
Invoke-RestMethod -Uri "http://localhost:8000/lines" | ConvertTo-Json

# Test a specific line (e.g., line 1)
Write-Host "Testing line directions endpoint..."
Invoke-RestMethod -Uri "http://localhost:8000/lines/1/directions" | ConvertTo-Json

Write-Host "Tests completed!"

# Keep terminal open
Write-Host "Press any key to close..."
Read-Host