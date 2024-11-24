$printerStatus = Get-Printer | Where-Object { $_.PrinterStatus -ne 'Idle' }
if ($printerStatus) {
    Write-Output "Printer issues detected"
    exit 1
} else {
    exit 0
}
