# Define the inactivity threshold in days
$inactivityThreshold = 90

# Get the current date
$currentDate = Get-Date

# Get all user profiles on the endpoint
$userProfiles = Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false }

foreach ($profile in $userProfiles) {
    # Get the last use time of the profile
    $lastUseTime = [Management.ManagementDateTimeConverter]::ToDateTime($profile.LastUseTime)
    
    # Calculate the number of days since the profile was last used
    $daysInactive = ($currentDate - $lastUseTime).Days
    
    if ($daysInactive -ge $inactivityThreshold) {
        # Log the profile that is inactive
        Write-Output "Inactive profile detected: $($profile.LocalPath) - Last used: $lastUseTime"
        
        # Optionally, remove the inactive profile
        # Remove-WmiObject -InputObject $profile
    }
}
