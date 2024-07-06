# Remediation Script: Remediate_InactiveUsers.ps1
 
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
        # Disable inactive user account
Disable-LocalUser -Name $user.Name
Write-Output "Disabled inactive user account: $($user.Name)"
    }
}
 
Write-Output "Inactive user accounts have been disabled."