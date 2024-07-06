# Detection Script: Detect_UAC.ps1
 
# Check if UAC is enabled
$uacStatus = Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -Name 'EnableLUA' -ErrorAction SilentlyContinue
 
if ($null -eq $uacStatus) {
    Write-Output "UAC status: NotConfigured"
    exit 1
} elseif ($uacStatus -eq 0) {
    Write-Output "UAC status: Disabled"
    exit 1
} else {
    Write-Output "UAC status: Enabled"
    exit 0
}