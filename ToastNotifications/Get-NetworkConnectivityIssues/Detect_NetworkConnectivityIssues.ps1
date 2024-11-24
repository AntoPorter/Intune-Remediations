$pingResult = Test-Connection -ComputerName google.com -Count 2 -Quiet
if (-not $pingResult) {
    Write-Output "Network connectivity issues"
    exit 1
} else {
    exit 0
}
