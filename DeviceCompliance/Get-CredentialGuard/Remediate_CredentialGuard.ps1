# Remediation Script: Remediate_CredentialGuard.ps1
 
# Enable Credential Guard
$regKey = "HKLM:\SYSTEM\CurrentControlSet\Control\DeviceGuard"
Set-ItemProperty -Path $regKey -Name "EnableVirtualizationBasedSecurity" -Value 1
Set-ItemProperty -Path $regKey -Name "RequirePlatformSecurityFeatures" -Value 1
 
$regKey = "HKLM:\SYSTEM\CurrentControlSet\Control\LSA"
Set-ItemProperty -Path $regKey -Name "LsaCfgFlags" -Value 1
 
Write-Output "Credential Guard has been enabled."