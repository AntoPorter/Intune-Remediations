if((Get-MpPreference).PUAProtection -eq 1) {
    Write-Output "Device Compliant"
    exit 0
} else {
    Write-Output "Device Non-Compliant"
    exit 1
}