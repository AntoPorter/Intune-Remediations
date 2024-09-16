# Get list of installed software
$software = Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Output the list
# Write-Output $software

$csvPath = "C:\temp\SoftwareInventoryReportStatus.csv"

$software | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Software Inventory Report status exported to $csvPath"

Exit 0