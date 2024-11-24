$antivirusStatus = Get-MpComputerStatus
if ($antivirusStatus.AntivirusEnabled -eq $false) {
    Write-Output "Antivirus is disabled"
    exit 1
} else {
    exit 0
}
