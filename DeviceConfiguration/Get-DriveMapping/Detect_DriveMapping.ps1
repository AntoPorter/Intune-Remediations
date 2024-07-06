# Detection Script: Detect_DriveMapping.ps1
 
# Define the network drive letter and path
$driveLetter = "Z:"
$networkPath = "\\server\share"
 
# Check if the drive is mapped
$drive = Get-PSDrive -Name $driveLetter -ErrorAction SilentlyContinue
 
if ($null -eq $drive -or $drive.Root -ne $networkPath) {
    Write-Output "Network drive not mapped: $driveLetter"
    exit 1
} else {
    Write-Output "Network drive is mapped: $driveLetter"
    exit 0
}