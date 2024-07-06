# Detection Script: Detect_LowDiskSpace.ps1
 
# Define the threshold for low disk space in GB
$thresholdGB = 10
 
# Get the free space on the system drive
$freeSpaceGB = [math]::Round((Get-PSDrive -Name C).Free / 1GB, 2)
 
if ($freeSpaceGB -lt $thresholdGB) {
    Write-Output "Low disk space detected: $freeSpaceGB GB free"
    exit 1
} else {
    Write-Output "Sufficient disk space: $freeSpaceGB GB free"
    exit 0
}