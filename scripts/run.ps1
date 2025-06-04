 # Get the directory where the script is located
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PROJECT_ROOT = Split-Path -Parent $SCRIPT_DIR

# Activate virtual environment
Write-Host "Activating virtual environment..."
& "$PROJECT_ROOT\.venv\Scripts\Activate.ps1"

# Run the API
Write-Host "Starting STCP API..."
Set-Location $PROJECT_ROOT
uvicorn main:app --reload --host 0.0.0.0 --port 8000

# Keep terminal open
Write-Host "Press any key to close..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

# Keep terminal open
Write-Host "Press any key to close..."
Read-Host