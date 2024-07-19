# Configure the VPN profile
Add-VpnConnection -Name "CorporateVPN" -ServerAddress "vpn.corporate.com" -TunnelType "L2tp" -AuthenticationMethod "Eap" -EncryptionLevel "Required" -RememberCredential
Write-Output "VPN configured"
