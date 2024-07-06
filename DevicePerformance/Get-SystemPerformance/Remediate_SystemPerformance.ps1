# Remediation Script: Remediate_SystemPerformance.ps1
 
# Clear temporary files
$TempFolder = "$env:Temp"
Remove-Item "$TempFolder\*" -Recurse -Force -ErrorAction SilentlyContinue
 
# Clear Windows Update cache
$WindowsUpdateCache = "C:\Windows\SoftwareDistribution\Download"
Remove-Item "$WindowsUpdateCache\*" -Recurse -Force -ErrorAction SilentlyContinue
 
# Optimize disk space
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -NoNewWindow -Wait
 
# Defragment the disk (if not SSD)
$diskType = Get-PhysicalDisk | Where-Object MediaType -eq "HDD"
if ($diskType) {
    Optimize-Volume -DriveLetter C -Defrag -Verbose
}
 
Write-Output "System performance optimization tasks completed."