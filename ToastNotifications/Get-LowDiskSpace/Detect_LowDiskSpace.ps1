$freeSpace = (Get-PSDrive -Name C).Free
$freeSpaceGB = [math]::round($freeSpace / 1GB, 2)
if ($freeSpaceGB -lt 10) {
    Write-Output "Low disk space"
    exit 1
} else {
    exit 0
}
