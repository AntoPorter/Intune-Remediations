# Install the certificate
Import-Certificate -FilePath "C:\Path\To\CorporateCert.cer" -CertStoreLocation Cert:\LocalMachine\My
Write-Output "Certificate installed"
