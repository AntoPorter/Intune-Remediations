# Detection Script: Detect_TimeZone.ps1
 
# Define the required time zone
$requiredTimeZone = "Pacific Standard Time"
 
# Get the current time zone
$currentTimeZone = (Get-TimeZone).Id
 
if ($currentTimeZone -ne $requiredTimeZone) {
    Write-Output "Incorrect time zone: $currentTimeZone"
    exit 1
} else {
    Write-Output "Time zone is correct: $currentTimeZone"
    exit 0
}