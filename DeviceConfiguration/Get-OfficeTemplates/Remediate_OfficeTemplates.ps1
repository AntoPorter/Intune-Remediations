# Remediation Script (Remediate_OfficeTemplates.ps1)
$SourcePath = "\\server\share\Templates\CompanyLetter.dotx"
$DestinationPath = "C:\Program Files\Microsoft Office\root\Templates\1033\CompanyLetter.dotx"

if (Test-Path -Path $SourcePath) {
    Copy-Item -Path $SourcePath -Destination $DestinationPath -Force
    Write-Host "Template file copied to: $DestinationPath"
} else {
    Write-Host "Template file not found in the central repository."
}