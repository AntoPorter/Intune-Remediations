# Detection Script: Detect_BitLocker.ps1
 
# Check if BitLocker is enabled
$bitLockerStatus = Get-BitLockerVolume -MountPoint "C:"
 
if ($bitLockerStatus.ProtectionStatus -ne "On") {
    Write-Output "BitLocker is not enabled on the system drive."
    exit 1
} else {
    Write-Output "BitLocker is enabled on the system drive."
    exit 0
}