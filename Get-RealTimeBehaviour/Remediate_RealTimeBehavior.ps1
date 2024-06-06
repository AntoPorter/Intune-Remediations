try {
    Set-MpPreference -DisableBehaviorMonitoring $false
    Write-Output "Device Remediated"
    exit 0
}
catch {
    Write-Output "Remediation Failed"
    exit 1
}