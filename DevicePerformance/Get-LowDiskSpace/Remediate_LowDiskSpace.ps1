# Remediation Script: Remediate_LowDiskSpace.ps1
 
# Clear temporary files
$TempFolder = "$env:Temp"
Remove-Item "$TempFolder\*" -Recurse -Force -ErrorAction SilentlyContinue
 
# Clear Windows Update cache
$WindowsUpdateCache = "C:\Windows\SoftwareDistribution\Download"
Remove-Item "$WindowsUpdateCache\*" -Recurse -Force -ErrorAction SilentlyContinue
 
# Clear Recycle Bin
Clear-RecycleBin -Force -ErrorAction SilentlyContinue
 
Write-Output "Disk space cleanup completed."