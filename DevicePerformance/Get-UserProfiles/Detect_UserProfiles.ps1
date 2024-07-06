# Detection Script: Detect_UserProfiles.ps1
 
# Define the size threshold in MB
$sizeThresholdMB = 500
 
# Get all user profiles
$userProfiles = Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false }
 
# Initialize flag for non-compliance
$nonCompliant = $false
 
foreach ($profile in $userProfiles) {
    # Check if the profile is corrupted
    if ($profile.Status -ne 0) {
        Write-Output "Corrupted profile detected: $($profile.LocalPath)"
        $nonCompliant = $true
    }
 
    # Check if the profile size exceeds the threshold
    $profileSizeMB = [math]::Round((Get-ChildItem -Path $profile.LocalPath -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
    if ($profileSizeMB -gt $sizeThresholdMB) {
        Write-Output "Profile size exceeds threshold: $($profile.LocalPath) - Size: $profileSizeMB MB"
        $nonCompliant = $true
    }
}
 
if ($nonCompliant) {
    exit 1
} else {
    Write-Output "All user profiles are compliant."
    exit 0
}