# Check status of critical services
$services = Get-Service -Name "wuauserv", "BITS", "WinDefend" | Select-Object Name, Status

# Output the service status
# Write-Output $services

$csvPath = "C:\temp\ServiceStatus.csv"

$services | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Service status exported to $csvPath"

Exit 0