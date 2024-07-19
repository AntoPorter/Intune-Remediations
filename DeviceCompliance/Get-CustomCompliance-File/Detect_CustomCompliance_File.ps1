# Check if a specific file exists
$filePath = "C:\Company\Compliance\requiredfile.txt"

if (Test-Path $filePath) {
    Write-Output "Compliance file is present."
} else {
    Write-Output "Compliance file is missing."
}
