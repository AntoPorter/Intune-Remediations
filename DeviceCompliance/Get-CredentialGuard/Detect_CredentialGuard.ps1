# Detection Script: Detect_CredentialGuard.ps1
 
# Check if Credential Guard is enabled
$credentialGuardStatus = Get-CimInstance -ClassName Win32_DeviceGuard -Namespace root\Microsoft\Windows\DeviceGuard
 
if ($credentialGuardStatus.SecurityServicesConfigured -contains 1 -and $credentialGuardStatus.SecurityServicesRunning -contains 1) {
    Write-Output "Credential Guard is enabled."
    exit 0
} else {
    Write-Output "Credential Guard is not enabled."
    exit 1
}