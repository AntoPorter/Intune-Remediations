# Remediation Script: Remediate_UserProfiles.ps1
 
# Define the size threshold in MB
$sizeThresholdMB = 500
 
# Get all user profiles
$userProfiles = Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false }
 
foreach ($profile in $userProfiles) {
    # Check if the profile is corrupted
    if ($profile.Status -ne 0) {
        # Remove corrupted profile
        Remove-WmiObject -InputObject $profile
        Write-Output "Removed corrupted profile: $($profile.LocalPath)"
    }
 
    # Check if the profile size exceeds the threshold
    $profileSizeMB = [math]::Round((Get-ChildItem -Path $profile.LocalPath -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB, 2)
    if ($profileSizeMB -gt $sizeThresholdMB) {
        # Remove large profile
        Remove-WmiObject -InputObject $profile
        Write-Output "Removed large profile: $($profile.LocalPath) - Size: $profileSizeMB MB"
    }
}
 
Write-Output "User profile remediation tasks completed."