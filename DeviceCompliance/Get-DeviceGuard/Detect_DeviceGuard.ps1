# Detection Script: Detect_DeviceGuard.ps1
 
# Check if Device Guard is enabled
$deviceGuardStatus = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard
 
if ($deviceGuardStatus.SecurityServicesConfigured -contains 2 -and $deviceGuardStatus.SecurityServicesRunning -contains 2) {
    Write-Output "Device Guard is enabled."
    exit 0
} else {
    Write-Output "Device Guard is not enabled."
    exit 1
}