## Toast Notifications

### Get-AntivirusStatus
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-AntivirusStatus)
- **Detection**: Checks MpComputerStaus for if Antivirus is Disabled.
- **Remediation**: Runs a Security Alert related Toast Notification. 

### Get-BatteryHealthWarning
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-BatteryHealthWarning)
- **Detection**: Checks Battery Health for Estimated Charge Remaining.
- **Remediation**: Runs a Battery Alert related Toast Notification. 

### Get-CustomToastNotification
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-CustomToastNotification)
- **Detection**: An Exit 1, Prompting the Remediation.
- **Remediation**: Runs a Toast Notification. Update the Group, Title and Notification in the script and Set the Schedule.

### Get-FirewallStatus
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-FirewallStatus)
- **Detection**: Checks if all Firewall Profiles are currently Enabled, Prompts for Remediation if any are found Disabled.
- **Remediation**: Runs a Security Alert related Toast Notification. 

### Get-HighCPUUsage
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-HighCPUUsage)
- **Detection**: Checks if the average CPU usage is greater than 80%.
- **Remediation**: Runs a Performance Alert related Toast Notification. 

### Get-HighMemoryUsage
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-HighMemoryUsage)
- **Detection**: Checks if the average Memory usage is greater than 80%.
- **Remediation**: Runs a Performance Alert related Toast Notification. 

### Get-LowDiskSpace
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-LowDiskSpace)
- **Detection**: Checks if the C: Drive disk space is less than 10GB.
- **Remediation**: Runs a System Alert related Toast Notification. 


### Get-NetworkConnectivityIssues
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-NetworkConnectivityIssues)
- **Detection**: Checks if google.com receives a ping response.
- **Remediation**: Runs a Network Alert related Toast Notification. 


### Get-PendingWindowsUpdate
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-PendingWindowsUpdate)
- **Detection**: Checks if there is any outstanding Windows Updates pending on the endpoint.
- **Remediation**: Runs a Update Alert related Toast Notification. 


### Get-PrinterIssues
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-PrinterIssues)
- **Detection**: Checks if there is any outstanding printing issues.
- **Remediation**: Runs a Printer Alert related Toast Notification. 

### Get-RebootRequired
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/ToastNotifications/Get-RebootRequired)
- **Detection**: Checks the Endpoints last boot up time, If greater than 7 days, prompts for Remediation.
- **Remediation**: Runs a System Alert related Toast Notification. 