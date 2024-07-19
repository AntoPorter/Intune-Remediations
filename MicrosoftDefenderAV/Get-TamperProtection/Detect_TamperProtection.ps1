# Check if tamper protection is enabled
$tamperProtection = Get-MpPreference | Select-Object -ExpandProperty DisableTamperProtection

if ($tamperProtection -eq $false) {
    Write-Output "Tamper protection is enabled."
    exit 0
} else {
    Write-Output "Tamper protection is disabled."
    exit 1
}
