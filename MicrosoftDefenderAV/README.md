## Microsoft Defender AV

### Get-CloudDeliveredProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-CloudDeliveredProtection)
- **Detection**: Checks if Cloud-Delivered Protection is enabled.
- **Remediation**: Enables Cloud-Delivered Protection if it is disabled.

### Get-ExploitProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-ExploitProtection)
- **Detection**: Checks if Exploit Protection is enabled.
- **Remediation**: Enables Exploit Protection if it is disabled.

### Get-NetworkProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-NetworkProtection)
- **Detection**: Checks if Network Protection is enabled.
- **Remediation**: Enables Network Protection if it is disabled.

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

### Get-ScheduledScan
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-ScheduledScan)
- **Detection**: Checks if a Scheduled AV Scan is present on the Endpoint.
- **Remediation**: Configures a Daily Quick Scan and Weekly Full Scan if no scan is present on the Endpoint.

### Get-SecurityIntelligenceUpdates
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-SecurityIntelligenceUpdates)
- **Detection**: Checks if Security Intelligence Updates are current on the Endpoint.
- **Remediation**: Runs a Security Intelligence Updates if the device is found not to be running a recent version of Security Intelligence Updates.

### Get-TamperProtection
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/MicrosoftDefenderAV/Get-TamperProtection)
- **Detection**: Checks if Tamper Protection is enabled.
- **Remediation**: Enables Tamper Protection if it is disabled.