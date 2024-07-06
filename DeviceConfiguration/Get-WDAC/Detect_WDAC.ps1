# Detection Script: Detect_WDAC.ps1
 
# Check if WDAC is enabled
$wdacStatus = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard
 
if ($wdacStatus.SecurityServicesConfigured -contains 2 -and $wdacStatus.SecurityServicesRunning -contains 2) {
    Write-Output "WDAC is enabled."
    exit 0
} else {
    Write-Output "WDAC is not enabled."
    exit 1
}