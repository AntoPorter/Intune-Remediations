# Check local administrators group membership
$localAdmins = Get-LocalGroupMember -Group "Administrators" | Select-Object Name, PrincipalSource

# Output the local administrators group membership
# Write-Output $localAdmins

$csvPath = "C:\temp\LocalAdminGroupStatus.csv"

$localAdmins | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Local Admin Group status exported to $csvPath"

Exit 0
