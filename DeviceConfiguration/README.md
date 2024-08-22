## Device Configuration

### Get-CorporateCertificate
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-CorporateCertificate)
- **Detection**: Checks for a specific certificate is installed (requires modification based on your requirements).
- **Remediation**: Installs the missing certificate from a file path.

### Get-CorporateVPN
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-CorporateVPN)
- **Detection**: Checks for a specific VPN Connection is configured (requires modification based on your requirements).
- **Remediation**: Configures the missing VPN Connection.

### Get-CustomToastNotification
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-CustomToastNotification)
- **Detection**: An Exit 1, Prompting the Remediation.
- **Remediation**: Runs a Toast Notification. Update the Group, Title and Notification in the script and Set the Schedule.

### Get-CustomWallpaper
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-CustomWallpaper)
- **Detection**: Checks for a specific wallpaper is configured (requires modification based on your requirements).
- **Remediation**: Configures the custom wallpaper.

### Get-DriveMapping
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-DriveMapping)
- **Detection**: Checks for a specific mapped drive (requires modification based on your requirements).
- **Remediation**: Maps the missing drive if it is not located.

### Get-LocalDNSSettings
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-LocalDNSSettings)
- **Detection**: Checks for a specific DNS Setting on your Ethernet (requires modification based on your requirements).
- **Remediation**: Configures the Local DNS settings if it is incorrect.

### Get-OfficeTemplates
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-OfficeTemplates)
- **Detection**: Checks the Templates folder for a specific template file within Program Files repo.
- **Remediation**: Will copy a template file from a network share to the Program Files repo.

### Get-OutlookTemplate
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-OutlookTemplate)
- **Detection**: Checks the **NormalEmail.dotm** file within AppData associated to Outlook Emails.
- **Remediation**: Will copy the **NormalEmail.dotm** file from a network share to the AppData repo.

### Get-TimeZone
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-TimeZone)
- **Detection**: Checks for a specific Time Zone (requires modification based on your requirements).
- **Remediation**: Corrects the endpoint's Time Zone if it is incorrect.

### Get-UAC
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-UAC)
- **Detection**: Checks if UAC is enabled.
- **Remediation**: Enables UAC if it is disabled.

### Get-WDAC
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-WDAC)
- **Detection**: Checks for a specific WDAC Policy (requires modification based on your requirements).
- **Remediation**: Corrects the endpoint's WDAC Policy if it is not detected.