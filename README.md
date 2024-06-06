# Intune-Remediations
A collection of active Intune Remediation scripts

# Disable-WindowsAI-Registry
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Disable-WindowsAI-Registry)
Used for Disabling the KCLM and HKCU registry keys associated with Recall AI for Copilot+ Devices

# Get-PUA-Protection
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-PUA-Protection)
Used for Confirming that PUA Protection is Enabled

# Get-RealTimeBehaviour
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-RealTimeBehaviour)
Used for Confirming that Behaviour Monitoring is Enabled

# Get-RealTimeProtection
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Get-RealTimeProtection)
Used for Confirming that Real Time Monitoring is Enabled

# Reset-SoftwareDistributionFolder
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Reset-SoftwareDistributionFolder)
Used for resetting the devices SoftwareDistribution folder via stopping the WUAUSERV Service, Renaming the 'C:\Windows\SoftwareDistribution' folder to "SoftwareDistribution.old", then starting the WUAUSERV Service.

# Reset-SoftwareDistributionFolder-PT2
(https://github.com/AntoPorter/Intune-Remediations/tree/96619173eea211f678fe360c207b7328f9a47928/Reset-SoftwareDistributionFolder-PT2)
Considered a Cleanup for the Successful deployment of 'Reset-SoftwareDistributionFolder', Deletes 'C:\Windows\SoftwareDistribution.old'
