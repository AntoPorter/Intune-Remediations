# Check if a specific registry key exists and a service is running
$regPath = "HKLM:\Software\MyCompany\Settings"
$regName = "ComplianceSetting"
$serviceName = "MyService"

$regExists = Test-Path "$regPath\$regName"
$serviceStatus = Get-Service -Name $serviceName -ErrorAction SilentlyContinue

if ($regExists -and $serviceStatus.Status -eq "Running") {
    Write-Output "Compliance settings are in place."
} else {
    Write-Output "Compliance settings are not in place."
}
