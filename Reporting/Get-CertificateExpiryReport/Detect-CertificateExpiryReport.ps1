# Check for certificates nearing expiry
$certificates = Get-ChildItem -Path Cert:\LocalMachine\My | Where-Object { $_.NotAfter -lt (Get-Date).AddDays(30) } | Select-Object Subject, NotAfter

# Output the certificates nearing expiry
# Write-Output $certificates

$csvPath = "C:\temp\CertificateExpiryStatus.csv"

$certificates | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Certificate Expiry status exported to $csvPath"

Exit 0