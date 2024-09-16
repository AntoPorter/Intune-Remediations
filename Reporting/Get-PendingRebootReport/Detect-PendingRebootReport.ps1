# Check for pending reboot
$pendingReboot = Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -ErrorAction SilentlyContinue

if ($pendingReboot) {
    Write-Output "Reboot is pending."
} else {
    Write-Output "No reboot pending."
}

Exit 0