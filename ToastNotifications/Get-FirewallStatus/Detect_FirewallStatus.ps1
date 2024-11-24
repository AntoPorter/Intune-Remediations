$firewallStatus = Get-NetFirewallProfile -Profile Domain,Public,Private
if ($firewallStatus.Enabled -contains $false) {
    Write-Output "Firewall is disabled"
    exit 1
} else {
    exit 0
}
