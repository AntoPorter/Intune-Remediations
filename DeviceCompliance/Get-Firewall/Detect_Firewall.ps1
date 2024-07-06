# Detection Script: Detect_Firewall.ps1
 
# Check if the firewall is enabled
$firewallStatus = Get-NetFirewallProfile -Profile Domain,Public,Private
 
foreach ($profile in $firewallStatus) {
    if ($profile.Enabled -eq $false) {
Write-Output "Firewall is disabled for profile: $($profile.Name)"
        exit 1
    }
}
 
Write-Output "Firewall is enabled for all profiles."
exit 0