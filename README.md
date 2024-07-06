# Intune Remediations

The **Intune Remediations** collection is a set of script packages designed to detect and fix common support issues on user endpoints. Each script package includes a detection script, a remediation script, and metadata. By deploying these packages through Intune, you can proactively address issues before end-users even notice them, potentially reducing support calls.

## Prerequisites

- **Microsoft Intune**
- **Appropriate permissions** to deploy scripts
## Usage

1. **Download** from my GitHub, then **Upload** the script packages to Intune.
2. **Assign** the scripts to the appropriate device groups.
3. **Monitor** the deployment and remediation status through the Intune console.

## Device Compliance

### Get-BitLocker
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-BitLocker)
- **Detection**: Checks if BitLocker is enabled.
- **Remediation**: Enables BitLocker if it is disabled.

### Get-CredentialGuard
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-CredentialGuard)
- **Detection**: Checks if CredentialGuard is enabled.
- **Remediation**: Enables CredentialGuard if it is disabled.

### Get-DeviceGuard
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-DeviceGuard)
- **Detection**: Checks if DeviceGuard is enabled.
- **Remediation**: Enables DeviceGuard if it is disabled.

### Get-Firewall
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-Firewall)
- **Detection**: Checks if any Firewall profiles are disabled.
- **Remediation**: Enables the Firewall profiles if they are disabled.

### Get-SecureBoot
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-SecureBoot)
- **Detection**: Checks if SecureBoot is enabled.
- **Remediation**: Enables SecureBoot if it is disabled. (This will require a reboot)

## Device Configuration

### Get-DriveMapping
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceConfiguration/Get-DriveMapping)
- **Detection**: Checks for a specific mapped drive (requires modification based on your requirements).
- **Remediation**: Maps the missing drive if it is not located.

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


## Microsoft Defender AV

### Get-PUAProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-PUAProtection)
- **Detection**: Checks if PUA Protection is enabled.
- **Remediation**: Enables PUA Protection if it is disabled.

### Get-QuickScan
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-QuickScan)
- **Detection**: Performs a Quick Scan via Defender AV on the endpoint.
- **Remediation**: Performs a Full Scan if malware is detected during the Quick Scan.

### Get-RealTimeBehaviour
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-RealTimeBehaviour)
- **Detection**: Checks if Real Time Behaviour is enabled.
- **Remediation**: Enables Real Time Behaviour if it is disabled.

### Get-RealTimeProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-RealTimeProtection)
- **Detection**: Checks if Real Time Protection is enabled.
- **Remediation**: Enables Real Time Protection if it is disabled.

## Miscellaneous

### Disable-WindowsAI-Registry
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Disable-WindowsAI-Registry)
- **Detection**: Checks the registry keys used by Windows AI.
- **Remediation**: Disables the registry keys if they are enabled.

### Get-SoftwareDistributionFolder and Get-SoftwareDistributionFolderPT2
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Get-SoftwareDistributionFolder)
[Link - PT2](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Get-SoftwareDistributionFolderPT2)
- **Part 1**: Resets the device's SoftwareDistribution folder by stopping the WUAUSERV service, renaming the 'C:\Windows\SoftwareDistribution' folder to "SoftwareDistribution.old," and then starting the service.
- **Part 2**: Deletes the 'C:\Windows\SoftwareDistribution.old' folder as a cleanup step following the successful deployment of 'Reset-SoftwareDistributionFolder.'

## Contact

For support or questions, please contact me on LinkedIn.
