# Check disk space usage
$diskSpace = Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="Used(GB)";Expression={[math]::round($_.Used/1GB,2)}}, @{Name="Free(GB)";Expression={[math]::round($_.Free/1GB,2)}}

# Output the disk space usage
# Write-Output $diskSpace

$csvPath = "C:\temp\DiskSpaceStatus.csv"

$diskSpace | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Disk Space status exported to $csvPath"

Exit 0
