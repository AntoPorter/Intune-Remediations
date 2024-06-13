# Intune-Remediations
The Intune Remediations collection is a set of script packages designed to detect and fix common support issues on user devices. Each script package includes a detection script, a remediation script, and metadata. By deploying these packages through Intune, you can proactively address issues before end-users even notice them, potentially reducing support calls.

## Disable-WindowsAI-Registry
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Disable-WindowsAI-Registry)

Used for disabling the KCLM and HKCU registry keys associated with Recall AI for Copilot+ devices.

## Get-PUA-Protection
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-PUA-Protection)

Used for confirming that PUA Protection is enabled.

## Get-RealTimeBehaviour
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-RealTimeBehaviour)

Used for confirming that Behavior Monitoring is enabled.

## Get-RealTimeProtection
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-RealTimeProtection)

Used for confirming that Real-Time Monitoring is enabled.

## Reset-SoftwareDistributionFolder
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Reset-SoftwareDistributionFolder)

Used for resetting the device's SoftwareDistribution folder by stopping the WUAUSERV service, renaming the 'C:\Windows\SoftwareDistribution' folder to "SoftwareDistribution.old," and then starting the service.

## Reset-SoftwareDistributionFolder-PT2
[Link to script](https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Reset-SoftwareDistributionFolder-PT2)

Considered a cleanup step following the successful deployment of 'Reset-SoftwareDistributionFolder,' this script deletes the 'C:\Windows\SoftwareDistribution.old' folder.

# Disclaimer
These scripts are a collection of community-created and my own. Credit to the Microsoft Intune MVPs who have contributed to building and sharing knowledge within the community.
