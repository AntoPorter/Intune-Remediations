# Detection Script: Detect_InactiveUsers.ps1
 
# Define the inactivity threshold in days
$inactivityThreshold = 90
 
# Get the current date
$currentDate = Get-Date
 
# Get all user accounts
$userAccounts = Get-LocalUser
 
foreach ($user in $userAccounts) {
    # Check the last logon date
$lastLogonDate = (Get-LocalUser -Name $user.Name).LastLogon
 
    if ($lastLogonDate -lt $currentDate.AddDays(-$inactivityThreshold)) {
Write-Output "Inactive user account detected: $($user.Name)"
        exit 1
    }
}
 
Write-Output "No inactive user accounts detected."
exit 0