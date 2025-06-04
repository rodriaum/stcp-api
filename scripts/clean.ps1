 # Get the directory where the script is located
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_ROOT = Split-Path -Parent $SCRIPT_DIR

# Remove virtual environment
Write-Host "Removing virtual environment..."
Remove-Item -Path "$PROJECT_ROOT\.venv" -Recurse -Force -ErrorAction SilentlyContinue

# Remove cache files
Write-Host "Removing cache files..."
Remove-Item -Path "$PROJECT_ROOT\hash.tmp" -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$PROJECT_ROOT\__pycache__" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$PROJECT_ROOT\stcp\__pycache__" -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "Clean completed successfully!"

# Keep terminal open
Write-Host "Press any key to close..."
Read-Host