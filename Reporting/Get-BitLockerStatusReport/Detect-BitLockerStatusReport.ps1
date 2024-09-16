# Check BitLocker encryption status
$bitLockerStatus = Get-BitLockerVolume | Select-Object MountPoint, VolumeStatus, EncryptionPercentage

# Output the BitLocker encryption status
# Write-Output $bitLockerStatus

$csvPath = "C:\temp\BitLockerStatus.csv"

$bitLockerStatus | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "BitLocker status exported to $csvPath"

Exit 0