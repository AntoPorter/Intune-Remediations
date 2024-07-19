# Check if the certificate is installed
$cert = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.Subject -eq "CN=CorporateCert" }
if ($cert) {
    Write-Output "Certificate is installed"
    exit 0
} else {
    Write-Output "Certificate is not installed"
    exit 1
}
