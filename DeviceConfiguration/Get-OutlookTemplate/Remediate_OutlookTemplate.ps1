# Remediation Script (Remediate_OutlookTemplate.ps1)
$SourcePath = "\\server\share\Templates\NormalEmail.dotm"
$DestinationPath = "$env:APPDATA\Microsoft\Templates\NormalEmail.dotm"

if (Test-Path -Path $SourcePath) {
    Copy-Item -Path $SourcePath -Destination $DestinationPath -Force
    Write-Host "NormalEmail.dotm template updated."
} else {
    Write-Host "Template file not found in the central repository."
}