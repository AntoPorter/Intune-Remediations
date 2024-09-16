# Check user login times
$userLogins = Get-EventLog -LogName Security -InstanceId 4624 | Select-Object TimeGenerated, ReplacementStrings

# Output the user login times
# Write-Output $userLogins

$csvPath = "C:\temp\UserLoginsStatus.csv"

$userLogins | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "User Logins status exported to $csvPath"

Exit 0
