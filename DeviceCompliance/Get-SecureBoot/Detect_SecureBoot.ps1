# Detection Script: Detect_SecureBoot.ps1
 
# Check if Secure Boot is enabled
if (Confirm-SecureBootUEFI) {
    Write-Output "Secure Boot is enabled."
    exit 0
} else {
    Write-Output "Secure Boot is not enabled."
    exit 1
}