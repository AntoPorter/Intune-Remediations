# Check if security intelligence updates are up-to-date
$lastUpdate = Get-MpComputerStatus | Select-Object -ExpandProperty AntivirusSignatureLastUpdated

if ($lastUpdate -lt (Get-Date).AddDays(-1)) {
    Write-Output "Security intelligence updates are outdated."
    exit 1
} else {
    Write-Output "Security intelligence updates are up-to-date."
    exit 0
}
