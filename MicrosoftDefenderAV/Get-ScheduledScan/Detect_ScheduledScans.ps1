# Check if scheduled scans are configured
$scanSchedule = Get-MpPreference | Select-Object -ExpandProperty ScanScheduleQuickScanTime

if ($scanSchedule) {
    Write-Output "Scheduled scans are configured."
    exit 0
} else {
    Write-Output "Scheduled scans are not configured."
    exit 1
}
