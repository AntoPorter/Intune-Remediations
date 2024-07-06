# Remediation Script: Remediate_BitLocker.ps1
 
# Enable BitLocker on the system drive
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -UsedSpaceOnly -TpmProtector
 
Write-Output "BitLocker has been enabled on the system drive."