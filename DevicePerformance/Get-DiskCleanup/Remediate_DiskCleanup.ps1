# Perform disk cleanup
Start-Process -FilePath "cleanmgr.exe" -ArgumentList "/sagerun:1" -Wait
Write-Output "Disk cleanup performed"
