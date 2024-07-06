# Remediation Script: Remediate_SecureBoot.ps1
 
# Enable Secure Boot
$regKey = "HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State"
Set-ItemProperty -Path $regKey -Name "UEFISecureBootEnabled" -Value 1
 
Write-Output "Secure Boot has been enabled. A system reboot is required for changes to take effect."