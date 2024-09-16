# Check endpoint protection status
$protectionStatus = Get-MpComputerStatus | Select-Object AMServiceEnabled, AMServiceVersion, AntivirusEnabled, AntivirusSignatureLastUpdated

# Output the endpoint protection status
# Write-Output $protectionStatus

$csvPath = "C:\temp\EndpointProtectionStatus.csv"

$protectionStatus | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Endpoint Protection status exported to $csvPath"

Exit 0
