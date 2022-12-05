# Import the required modules
Import-Module PSWindowsUpdate

# Check for available updates
Write-Host "Checking for available updates..."
$updates = Get-WindowsUpdate

# If there are no updates available, exit the script
if ($updates.Count -eq 0) {
    Write-Host "No updates available."
    exit
}

# Install the available updates
Write-Host "Installing available updates..."
$updates | Install-WindowsUpdate

# Check for any failed updates
$failedUpdates = Get-WindowsUpdate -ErrorAction SilentlyContinue

# If there are failed updates, write a message and exit the script
if ($failedUpdates.Count -gt 0) {
    Write-Host "Failed to install some updates."
    exit
}

# If all updates were installed successfully, write a message
Write-Host "All updates installed successfully."

#To run this script navigate to the directory this file is stored in and use .\Win10AutoUpdate.ps1
