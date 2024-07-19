# Ensure the registry key is set and the service is running
$regPath = "HKLM:\Software\MyCompany\Settings"
$regName = "ComplianceSetting"
$regValue = "Enabled"
$serviceName = "MyService"

if (-Not (Test-Path "$regPath\$regName")) {
    New-Item -Path $regPath -Force | Out-Null
    New-ItemProperty -Path $regPath -Name $regName -Value $regValue -PropertyType String -Force | Out-Null
} else {
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue
}

$service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
if ($service.Status -ne "Running") {
    Start-Service -Name $serviceName
}
