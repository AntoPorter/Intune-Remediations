# Remediation Script: Remediate_WDAC.ps1
 
# Define the path to the WDAC policy binary file
$policyBinaryPath = "C:\Path\To\Your\Policy.cip"
 
# Copy the policy binary to the correct location
$destinationFolder = "$env:windir\System32\CodeIntegrity\CIPolicies\Active\"
Copy-Item -Path $policyBinaryPath -Destination $destinationFolder
 
# Enable WDAC policy
Start-Process -FilePath "powershell.exe" -ArgumentList "-Command", "ciTool.exe --update-policy $policyBinaryPath" -NoNewWindow -Wait

Write-Output "WDAC policy has been applied. A system reboot is required for changes to take effect."