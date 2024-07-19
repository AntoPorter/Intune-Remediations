# Check if the VPN profile is configured
$vpnProfile = Get-VpnConnection -Name "CorporateVPN" -ErrorAction SilentlyContinue
if ($vpnProfile) {
    Write-Output "VPN is configured"
    exit 0
} else {
    Write-Output "VPN is not configured"
    exit 1
}
