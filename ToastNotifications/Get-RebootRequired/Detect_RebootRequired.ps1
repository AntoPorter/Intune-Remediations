$uptime = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$daysUptime = (Get-Date) - $uptime
if ($daysUptime.Days -ge 7) {
    Write-Output "Reboot required"
    exit 1
} else {
    exit 0
}
