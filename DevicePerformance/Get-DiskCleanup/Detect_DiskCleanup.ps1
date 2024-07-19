# Check for low disk space
$freeSpace = (Get-PSDrive -Name C).Free
if ($freeSpace -lt 10GB) {
    Write-Output "Low disk space"
    exit 1
} else {
    Write-Output "Sufficient disk space"
    exit 0
}
