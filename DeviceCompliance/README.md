## Device Compliance

### Get-BitLocker
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-BitLocker)
- **Detection**: Checks if BitLocker is enabled.
- **Remediation**: Enables BitLocker if it is disabled.

### Get-CredentialGuard
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-CredentialGuard)
- **Detection**: Checks if CredentialGuard is enabled.
- **Remediation**: Enables CredentialGuard if it is disabled.

### Get-CustomCompliance-Registry
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-CustomCompliance-Registry)
- **Detection**: Checks for an existing Registry File, considered required for "Compliance" in your environment.
- **Remediation**: Creates the Registry File specified if the detection cannot find the mentioned registry key.

### Get-CustomCompliance-File
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/DeviceCompliance/Get-CustomCompliance-File)
- **Detection**: Checks for an existing File in a File Path, considered required for "Compliance" in your environment.
- **Remediation**: Creates the File (and Path) specified if the detection cannot find the mentioned file.

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