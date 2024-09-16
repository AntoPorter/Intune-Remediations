# Check Windows Firewall status
$firewallStatus = Get-NetFirewallProfile | Select-Object Name, Enabled, DefaultInboundAction, DefaultOutboundAction

# Output the Firewall status
# Write-Output $firewallStatus

$csvPath = "C:\temp\FirewallProfileStatus.csv"

$firewallStatus | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Firewall Profile status exported to $csvPath"

Exit 0
