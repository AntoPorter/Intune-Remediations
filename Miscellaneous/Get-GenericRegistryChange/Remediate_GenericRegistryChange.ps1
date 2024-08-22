# (Remediate_GenericRegistryChange.ps1)
# Modify a registry value

Set-ItemProperty -Path "HKLM:\Software\MyApp" -Name "MySetting" -Value "NewValue"
