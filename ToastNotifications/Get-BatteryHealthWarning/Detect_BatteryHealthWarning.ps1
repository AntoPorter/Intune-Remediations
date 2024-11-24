$batteryStatus = Get-WmiObject -Query "Select * from Win32_Battery"
if ($batteryStatus.EstimatedChargeRemaining -lt 50) {
    Write-Output "Battery health warning"
    exit 1
} else {
    exit 0
}
