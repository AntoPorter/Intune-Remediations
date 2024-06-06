##Enter the path to the registry key
$regpath = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WindowsAI"
##Enter the name of the registry key
$regname = "DisableAIDataAnalysis"
##Enter the value of the registry key
$regvalue = "1"
##Enter the type of the registry key
$regtype = "DWord"

New-ItemProperty -Path $regpath -Name $regname -Value $regvalue -PropertyType $regtype -Force