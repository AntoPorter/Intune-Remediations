## Reporting

Each of the following includes a Detection Script, which only includes an `Exit 0` condition, and an empty Remediation Script, for completeness. You will only be required to upload the Detection script, as the Remediation script is not a dependency.

Most of the following scripts are set to export the results to `c:\temp\` using `Export-Csv` due to the limitations of Intune Remediations currently only being able to Output a sentence and not CSV style content. I have commented out the line with the ability to output direct to Intune, in case this becomes an option in future. Please review the following contents and ensure that the path for `Export-Csv` is to a desired location. 

This path can be a network share by using the following example:

```powershell
$networkPath = "\\ServerName\SharedFolder"
$csvPath = "$networkPath\BitLockerStatus.csv"

$bitLockerStatus | Export-Csv -Path $csvPath -NoTypeInformation

Write-Output "BitLocker status exported to $csvPath"
```


You can also map to a SharePoint location using the `Export-SPWeb` cmdlet if you have the necessary permissions and SharePoint modules installed. Here’s an example:

```powershell
$siteUrl = "https://yoursharepointsite/sites/yoursite"
$exportPath = "C:\temp\BitLockerStatus.csv"

# Export the BitLocker encryption status to a CSV file locally
$bitLockerStatus | Export-Csv -Path $exportPath -NoTypeInformation

# Upload the CSV file to SharePoint
$destinationUrl = "$siteUrl/Shared Documents/BitLockerStatus.csv"
Add-PnPFile -Path $exportPath -Folder "Shared Documents"

Write-Output "BitLocker status exported to SharePoint at $destinationUrl"
```


> [!NOTE]
> For the SharePoint example, make sure you have the PnP PowerShell module installed and connected to your SharePoint site using `Connect-PnPOnline`.


> [!help] 
> The following limitations are associated to the Write-Output function and Intune Remediation script packages.
> 
> **Output Size**: Maximum allowed output size for each remediation script is 2048 characters. Exceeding this limit will cause the script to fail or truncate the output.
> 
> **Data Handling**: Write-Output sends data to the pipeline, which might not be suitable for all scenarios within Intune. (This is why I have included the Export-Csv function)


---

### Get-BitLockerStatusReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-BitLockerStatusReport)
- **Detection**: Gets the Status of BitLocker on all drives present on an Endpoint.

### Get-CertificateExpiryReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-CertificateExpiryReport)
- **Detection**: Checks for any locally installed certificates which have an upcoming expiry on an Endpoint.

### Get-DiskSpaceUsageReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-DiskSpaceUsageReport)
- **Detection**: Gets the disk space usage on all drives present on an Endpoint.

### Get-EndpointProtectionStatusReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-EndpointProtectionStatusReport)
- **Detection**: Checks the **AMServiceEnabled**, **AMServiceVersion**, **AntivirusEnabled**, and **AntivirusSignatureLastUpdated** state on an Endpoint.

### Get-EventLogErrorReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-EventLogErrorReport)
- **Detection**: Gets the newest 100 event log errors present on an Endpoint. The output provides **TimeGenerated**, **Source**, **EventID**, and Message.

### Get-FirewallStatusReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-FirewallStatusReport)
- **Detection**: Checks the firewall status on an Endpoint.

### Get-LocalAdminGroupReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-LocalAdminGroupReport)
- **Detection**: Gets the **Name** and **PrincipalSource** of the Local Administrators Group on an Endpoint.

### Get-PendingRebootReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-PendingRebootReport)
- **Detection**: Gets the **ItemProperty** of **RebootPending** and reports if the endpoint is currently pending a reboot.

### Get-ServiceStatusReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-ServiceStatusReport)
- **Detection**: Gets the current status of a set of services on an Endpoint. Currently includes **wuauserv**, **BITS** and **WinDefend**.

### Get-SoftwareInventoryReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-SoftwareInventoryReport)
- **Detection**: Gets a list of the current Software Inventory report on an endpoint.

### Get-UptimeReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-UptimeReport)
- **Detection**: Gets an output of the current uptime of an endpoint.

### Get-UserActivityReport
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Reporting/Get-UserActivityReport)
- **Detection**: Gets a list of User Login events on an endpoint.
