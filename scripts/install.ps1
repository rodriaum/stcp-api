 # Get the directory where the script is located
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_ROOT = Split-Path -Parent $SCRIPT_DIR

# Create virtual environment if it doesn't exist
if (-not (Test-Path "$PROJECT_ROOT\.venv")) {
    Write-Host "Creating virtual environment..."
    python -m venv "$PROJECT_ROOT\.venv"
}

# Activate virtual environment
Write-Host "Activating virtual environment..."
& "$PROJECT_ROOT\.venv\Scripts\Activate.ps1"

# Install requirements
Write-Host "Installing requirements..."
pip install -r "$PROJECT_ROOT\requirements.txt"

Write-Host "Installation completed successfully!"

# Keep terminal open
Write-Host "Press any key to close..."
Read-Host