# Check if network protection is enabled
$networkProtection = Get-MpPreference | Select-Object -ExpandProperty EnableNetworkProtection

if ($networkProtection -eq 1) {
    Write-Output "Network protection is enabled."
    exit 0
} else {
    Write-Output "Network protection is disabled."
    exit 1
}
