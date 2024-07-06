# Remediation Script: Remediate_UAC.ps1
 
# Check if UAC is enabled
$uacStatus = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -ErrorAction SilentlyContinue
 
if ($null -eq $uacStatus -or $uacStatus -eq 0) {
    # Enable UAC
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -Value 1
    Write-Output "UAC has been enabled."
} else {
    Write-Output "UAC is already enabled."
}