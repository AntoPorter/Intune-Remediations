# Detection Script (Detect_OutlookTemplate.ps1)
$TemplatePath = "$env:APPDATA\Microsoft\Templates\NormalEmail.dotm"
if (Test-Path -Path $TemplatePath) {
    Write-Host "NormalEmail.dotm template exists: $TemplatePath"
    exit 0
} else {
    Write-Host "NormalEmail.dotm template not found: $TemplatePath"
    exit 1
}