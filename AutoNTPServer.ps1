# Import the required modules
Import-Module PSWindowsUpdate

# Check if the Windows Time service is installed and running
$service = Get-Service w32time

# If the service is not installed or not running, exit the script
if ($service.Status -ne "Running") {
    Write-Host "The Windows Time service is not installed or not running. Exiting script."
    exit
}

# Configure the NTP server settings
Write-Host "Configuring NTP server settings..."
w32tm /config /manualpeerlist:"0.pool.ntp.org,1.pool.ntp.org,2.pool.ntp.org" /syncfromflags:manual /reliable:yes /update

# Restart the Windows Time service
Write-Host "Restarting the Windows Time service..."
Restart-Service w32time

# Check the NTP server configuration
Write-Host "Checking the NTP server configuration..."
w32tm /query /peers
