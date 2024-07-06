# Remediation Script: Remediate_DriveMapping.ps1
 
# Define the network drive letter and path
$driveLetter = "Z:"
$networkPath = "\\server\share"
 
# Map the network drive
New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $networkPath -Persist
 
Write-Output "Network drive has been mapped: $driveLetter"