# Check DNS settings
$dnsServers = Get-DnsClientServerAddress -AddressFamily IPv4 | Select-Object -ExpandProperty ServerAddresses
if ($dnsServers -notcontains "8.8.8.8") {
    Write-Output "DNS settings need to be updated"
    exit 1
} else {
    Write-Output "DNS settings are correct"
    exit 0
}
