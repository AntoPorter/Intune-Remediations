# Check if cloud-delivered protection is enabled
$cloudProtection = Get-MpPreference | Select-Object -ExpandProperty MAPSReporting

if ($cloudProtection -ne 0) {
    Write-Output "Cloud-delivered protection is enabled."
    exit 0
} else {
    Write-Output "Cloud-delivered protection is disabled."
    exit 1
}
