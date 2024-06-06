Get-Service -Name wuauserv | Stop-Service
Rename-Item -Path C:\Windows\SoftwareDistribution -NewName SoftwareDistribution.old
Get-Service -Name wuauserv | Start-Service