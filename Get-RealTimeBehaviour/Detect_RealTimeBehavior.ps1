if((Get-MpComputerStatus).BehaviorMonitorEnabled  -eq "True") {
    Write-Output "Device Compliant"
    exit 0
} else {
    Write-Output "Device Non-Compliant"
    exit 1
}