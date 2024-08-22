# Detection Script (Detect_OfficeTemplates.ps1)
$TemplatePath = "C:\Program Files\Microsoft Office\root\Templates\1033\CompanyLetter.dotx"
if (Test-Path -Path $TemplatePath) {
    Write-Host "Template file exists: $TemplatePath"
    exit 0
} else {
    Write-Host "Template file not found: $TemplatePath"
    exit 1
}