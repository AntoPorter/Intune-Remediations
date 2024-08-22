# (Detect_GenericRegistryChange.ps1)
# Detect if the registry key exists

$RegistryPath = "HKLM:\SOFTWARE\Microsoft\IntuneManagementExtension\SideCarPolicies\Scripts"
if (Test-Path -Path $RegistryPath) {
    Write-Host "Registry key exists: $RegistryPath"
    exit 0
} else {
    Write-Host "Registry key not found: $RegistryPath"
    exit 1
}