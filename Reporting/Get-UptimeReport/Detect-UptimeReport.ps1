# Get the last boot time
$lastBootTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime

# Calculate the uptime
$uptime = (Get-Date) - $lastBootTime

# Output the uptime
Write-Output "The system has been up for: $($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes."

Exit 0