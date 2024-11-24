$updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot
if ($updates.Count -gt 0) {
    Write-Output "Pending Windows updates"
    exit 1
} else {
    exit 0
}
