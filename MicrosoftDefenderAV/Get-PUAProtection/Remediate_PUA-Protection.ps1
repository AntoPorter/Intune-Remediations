try {
    Set-MpPreference -PUAProtection Enabled
    Write-Output "Device Remediated"
    exit 0
}
catch {
    Write-Output "Remediation Failed"
    exit 1
}