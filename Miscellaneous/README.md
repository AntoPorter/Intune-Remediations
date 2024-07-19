## Miscellaneous

### Disable-WindowsAI-Registry
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Disable-WindowsAI-Registry)
- **Detection**: Checks the registry keys used by Windows AI.
- **Remediation**: Disables the registry keys if they are enabled.

### Get-CustomScript
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Get-CustomScript)
- **Detection**: Includes only 'Exit 1', which will automatically run the Remediation Script.
- **Remediation**: Include the contents of your PowerShell Script you wish to run on a schedule.

### Get-SoftwareDistributionFolder and Get-SoftwareDistributionFolderPT2
[Link](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Get-SoftwareDistributionFolder)
[Link - PT2](https://github.com/AntoPorter/Intune-Remediations/tree/main/Miscellaneous/Get-SoftwareDistributionFolderPT2)
- **Part 1**: Resets the device's SoftwareDistribution folder by stopping the WUAUSERV service, renaming the 'C:\Windows\SoftwareDistribution' folder to "SoftwareDistribution.old," and then starting the service.
- **Part 2**: Deletes the 'C:\Windows\SoftwareDistribution.old' folder as a cleanup step following the successful deployment of 'Reset-SoftwareDistributionFolder.'