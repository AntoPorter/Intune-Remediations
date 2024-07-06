## Device Performance

### Get-InactiveUsers
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DevicePerformance/Get-InactiveUsers)
- **Detection**: Checks for any inactive profiles based on a specified time period (requires modification based on your requirements).
- **Remediation**: Removes inactive profiles if detected.

### Get-LowDiskSpace
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DevicePerformance/Get-LowDiskSpace)
- **Detection**: Checks for low disk space on C: (requires modification based on your requirements).
- **Remediation**: Clears notable Temp locations if low disk space is detected.

### Get-SystemPerformance
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DevicePerformance/Get-SystemPerformance)
- **Detection**: Checks the % usage of CPU/Memory/Disk (requires modification based on your requirements).
- **Remediation**: Clears notable Temp locations and performs optimization tasks if usage is above the specified threshold.

### Get-UserProfiles
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DevicePerformance/Get-UserProfiles)
- **Detection**: Checks for large user profile sizes (requires modification based on your requirements).
- **Remediation**: Clears notable Temp locations if large profiles are detected. Also reports and clears corrupted profiles as required.

