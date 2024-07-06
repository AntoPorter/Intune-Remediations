# Remediation Script: Remediate_Firewall.ps1
 
# Enable the firewall for all profiles
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
 
Write-Output "Firewall has been enabled for all profiles."