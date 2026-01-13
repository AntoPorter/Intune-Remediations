#Requires -Version 5.1
# Configuration file path
$ConfigPath = "$($env:APPDATA)\ToastNotificationConfig.json"

function Initialize-Configuration {
    $script:SavedConfig = @{
        LastOutputPath = [Environment]::GetFolderPath("Desktop")
        LastTitle      = "Action Required"
        LastMessage    = "Please review and acknowledge this notification"
        LastAppId      = "IT Administrator"
    }
}

function Load-Configuration {
    if (Test-Path $ConfigPath) {
        try {
            $script:SavedConfig = Get-Content -Path $ConfigPath -Raw | ConvertFrom-Json
        }
        catch {
            Initialize-Configuration
        }
    }
    else {
        Initialize-Configuration
    }
}

function Save-Configuration {
    try {
        $script:SavedConfig | ConvertTo-Json | Set-Content -Path $ConfigPath -Force
    }
    catch {
        Write-Warning "Failed to save configuration: $_"
    }
}

function New-ToastNotification {
    param(
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][string]$Message,
        [string]$ActionButtonText = "",
        [string]$ActionButtonUrl = "",
        [int]$DurationSeconds = 30,
        [bool]$ShowDismissButton = $false,
        [string]$AppId = "Windows.UI.Core.CoreWindow"
    )

    try {
        [Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
        [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

        $Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AppId)
        $ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::new()
        
        $durationAttr = if ($DurationSeconds -gt 60) { 'duration="long"' } else { 'duration="short"' }
        $scenarioAttr = if ($DurationSeconds -gt 60) { 'scenario="reminder"' } else { '' }
        
        $xmlContent = "<toast $durationAttr $scenarioAttr><visual><binding template='ToastText02' hint-attribution='$AppId'><text id='1'>$Title</text><text id='2'>$Message</text></binding></visual>"
        
        $actionsXml = ""
        if ($ActionButtonText -and $ActionButtonUrl) {
            $actionsXml += "<action activationType='protocol' arguments='$ActionButtonUrl' content='$ActionButtonText'/>"
        }
        
        if ($ShowDismissButton) {
            $actionsXml += "<action activationType='system' arguments='dismiss' content='Dismiss'/>"
        }
        
        if ($actionsXml) {
            $xmlContent += "<actions>$actionsXml</actions>"
        }
        
        $xmlContent += "</toast>"

        $ToastXml.LoadXml($xmlContent)
        $Toast = [Windows.UI.Notifications.ToastNotification]::new($ToastXml)
        $Notifier.Show($Toast)
        Write-Host "Toast notification displayed." -ForegroundColor Green
    }
    catch {
        Write-Error "Failed: $_"
    }
}

Load-Configuration

Write-Host "`n" -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "                   TOAST NOTIFICATION CREATOR FOR INTUNE V1                " -ForegroundColor Cyan
Write-Host "  Create and Export Windows Toast Notifications for Microsoft Intune Remediations      " -ForegroundColor Cyan
Write-Host "                         Created by: Anthony Porter                        " -ForegroundColor Cyan
Write-Host "" -ForegroundColor Cyan
Write-Host "`n" -ForegroundColor Cyan

function Export-IntuneRemediationScript {
    param(
        [Parameter(Mandatory = $true)][string]$OutputPath,
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][string]$Message,
        [string]$ActionButtonText = "",
        [string]$ActionButtonUrl = "",
        [int]$DurationSeconds = 30,
        [bool]$ShowDismissButton = $false,
        [string]$AppId = "Windows.UI.Core.CoreWindow"
    )

    try {
        $scriptContent = @"
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

`$AppId = "$AppId"
`$Title = "$Title"
`$Message = "$Message"
`$ActionButtonText = "$ActionButtonText"
`$ActionButtonUrl = "$ActionButtonUrl"
`$DurationSeconds = $DurationSeconds
`$ShowDismissButton = `$$ShowDismissButton

try {
    `$Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier(`$AppId)
    `$ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::new()
    
    `$durationAttr = if (`$DurationSeconds -gt 60) { 'duration="long"' } else { 'duration="short"' }
    `$scenarioAttr = if (`$DurationSeconds -gt 60) { 'scenario="reminder"' } else { '' }
    `$xmlContent = "<toast `$durationAttr `$scenarioAttr><visual><binding template='ToastText02' hint-attribution='`$AppId'><text id='1'>`$Title</text><text id='2'>`$Message</text></binding></visual>"
    
    `$actionsXml = ""
    if (`$ActionButtonText -and `$ActionButtonUrl) {
        `$actionsXml += "<action activationType='protocol' arguments='`$ActionButtonUrl' content='`$ActionButtonText'/>"
    }
    
    if (`$ShowDismissButton) {
        `$actionsXml += "<action activationType='system' arguments='dismiss' content='Dismiss'/>"
    }
    
    if (`$actionsXml) {
        `$xmlContent += "<actions>`$actionsXml</actions>"
    }
    
    `$xmlContent += "</toast>"
    
    `$ToastXml.LoadXml(`$xmlContent)
    `$Toast = [Windows.UI.Notifications.ToastNotification]::new(`$ToastXml)
    `$Notifier.Show(`$Toast)
    exit 0
} catch {
    Write-Error "Failed: `$_"
    exit 1
}
"@

        $outputDir = Split-Path $OutputPath -Parent
        if (-not (Test-Path $outputDir)) {
            New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
        }

        Set-Content -Path $OutputPath -Value $scriptContent -Encoding UTF8 -Force
        Write-Host "Remediation script exported to: $OutputPath" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to export: $_"
    }
}

function Export-DetectionRemediationPair {
    param(
        [Parameter(Mandatory = $true)][string]$DetectPath,
        [Parameter(Mandatory = $true)][string]$RemediatePath,
        [Parameter(Mandatory = $true)][string]$Title,
        [Parameter(Mandatory = $true)][string]$Message,
        [string]$ActionButtonText = "",
        [string]$ActionButtonUrl = "",
        [int]$DurationSeconds = 30,
        [bool]$ShowDismissButton = $false,
        [string]$AppId = "Windows.UI.Core.CoreWindow"
    )

    try {
        $detectionContent = "exit 1"

        $remediationContent = @"
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null

`$AppId = "$AppId"
`$Title = "$Title"
`$Message = "$Message"
`$ActionButtonText = "$ActionButtonText"
`$ActionButtonUrl = "$ActionButtonUrl"
`$DurationSeconds = $DurationSeconds
`$ShowDismissButton = `$$ShowDismissButton

try {
    `$Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier(`$AppId)
    `$ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::new()
    
    `$durationAttr = if (`$DurationSeconds -gt 60) { 'duration="long"' } else { 'duration="short"' }
    `$scenarioAttr = if (`$DurationSeconds -gt 60) { 'scenario="reminder"' } else { '' }
    `$xmlContent = "<toast `$durationAttr `$scenarioAttr><visual><binding template='ToastText02' hint-attribution='`$AppId'><text id='1'>`$Title</text><text id='2'>`$Message</text></binding></visual>"
    
    `$actionsXml = ""
    if (`$ActionButtonText -and `$ActionButtonUrl) {
        `$actionsXml += "<action activationType='protocol' arguments='`$ActionButtonUrl' content='`$ActionButtonText'/>"
    }
    
    if (`$ShowDismissButton) {
        `$actionsXml += "<action activationType='system' arguments='dismiss' content='Dismiss'/>"
    }
    
    if (`$actionsXml) {
        `$xmlContent += "<actions>`$actionsXml</actions>"
    }
    
    `$xmlContent += "</toast>"
    
    `$ToastXml.LoadXml(`$xmlContent)
    `$Toast = [Windows.UI.Notifications.ToastNotification]::new(`$ToastXml)
    `$Notifier.Show(`$Toast)
    exit 0
} catch {
    Write-Error "Failed: `$_"
    exit 1
}
"@

        $detectDir = Split-Path $DetectPath -Parent
        $remediateDir = Split-Path $RemediatePath -Parent

        if (-not (Test-Path $detectDir)) {
            New-Item -ItemType Directory -Path $detectDir -Force | Out-Null
        }
        if (-not (Test-Path $remediateDir)) {
            New-Item -ItemType Directory -Path $remediateDir -Force | Out-Null
        }

        Set-Content -Path $DetectPath -Value $detectionContent -Encoding UTF8 -Force
        Set-Content -Path $RemediatePath -Value $remediationContent -Encoding UTF8 -Force

        Write-Host "Detection script exported to: $DetectPath" -ForegroundColor Green
        Write-Host "Remediation script exported to: $RemediatePath" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to export: $_"
    }
}

$continueLoop = $true
while ($continueLoop) {
    Write-Host "`n========================================" -ForegroundColor Cyan
    Write-Host "  Toast Notification Creator for Intune  " -ForegroundColor Cyan
    Write-Host "========================================`n" -ForegroundColor Cyan

    Write-Host "Enter Notification Details:" -ForegroundColor Yellow
    
    $defaultTitle = $script:SavedConfig.LastTitle
    Write-Host "Title (default: $defaultTitle): " -NoNewline
    $title = Read-Host
    if ([string]::IsNullOrWhiteSpace($title)) { $title = $defaultTitle }

    $defaultMessage = $script:SavedConfig.LastMessage
    Write-Host "Message (default: $defaultMessage): " -NoNewline
    $message = Read-Host
    if ([string]::IsNullOrWhiteSpace($message)) { $message = $defaultMessage }

    $defaultAppId = $script:SavedConfig.LastAppId
    Write-Host "App Source/Identifier (default: $defaultAppId): " -NoNewline
    $appId = Read-Host
    if ([string]::IsNullOrWhiteSpace($appId)) { $appId = $defaultAppId }
    $script:SavedConfig.LastAppId = $appId

    Write-Host "Add Action Button? (y/N): " -NoNewline
    $needsActionButton = Read-Host
    
    $actionButtonText = ""
    $actionButtonUrl = ""
    $requireAck = $false
    
    if ($needsActionButton -eq 'y' -or $needsActionButton -eq 'Y') {
        Write-Host "Action Button Text (default: 'Open'): " -NoNewline
        $actionButtonText = Read-Host
        if ([string]::IsNullOrWhiteSpace($actionButtonText)) { $actionButtonText = "Open" }

        Write-Host "Action Button URL (default: 'https://www.microsoft.com'): " -NoNewline
        $actionButtonUrl = Read-Host
        if ([string]::IsNullOrWhiteSpace($actionButtonUrl)) { $actionButtonUrl = "https://www.microsoft.com" }
        
        # If action button is enabled, automatically require acknowledgement
        $requireAck = $true
    } else {
        # Only ask for acknowledgement if there's no action button
        Write-Host "Require Acknowledgement? (y/N): " -NoNewline
        $ackResponse = Read-Host
        $requireAck = $ackResponse -eq 'y' -or $ackResponse -eq 'Y'
    }
    
    $duration = if ($requireAck -eq $true) { 600 } else { 30 }
    $showDismissButton = if (-not ($needsActionButton -eq 'y' -or $needsActionButton -eq 'Y') -and $requireAck) { $true } else { $false }

    # Inner loop for actions after notification is created
    $actionLoop = $true
    while ($actionLoop) {
        Write-Host "`n========================================" -ForegroundColor Cyan
        Write-Host "  What would you like to do?" -ForegroundColor Cyan
        Write-Host "========================================`n" -ForegroundColor Cyan

        Write-Host "1. Test notification (display now)" -ForegroundColor White
        Write-Host "2. Export Detection + Remediation Scripts" -ForegroundColor White
        Write-Host "3. Export Remediation Script Only" -ForegroundColor White
        Write-Host "4. Create Another Notification" -ForegroundColor White
        Write-Host "5. Exit`n" -ForegroundColor White

        $choice = Read-Host "Select an option (1-5)"

        switch ($choice) {
            "1" {
                Write-Host "`nTesting notification..." -ForegroundColor Yellow
                New-ToastNotification -Title $title -Message $message -ActionButtonText $actionButtonText -ActionButtonUrl $actionButtonUrl -DurationSeconds $duration -ShowDismissButton $showDismissButton -AppId $appId
            }
            "2" {
                $defaultOutput = $script:SavedConfig.LastOutputPath
                $baseName = "Toast"
                $timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

                Write-Host "`nCurrent output directory: $defaultOutput" -ForegroundColor Gray
                $userDir = Read-Host "Enter output directory [press Enter to use default]"
                if ([string]::IsNullOrWhiteSpace($userDir)) { $userDir = $defaultOutput }

                $detectPath = Join-Path $userDir "${baseName}Detection_${timestamp}.ps1"
                $remediatePath = Join-Path $userDir "${baseName}Remediation_${timestamp}.ps1"

                if (-not (Test-Path $userDir)) {
                    New-Item -ItemType Directory -Path $userDir -Force | Out-Null
                }

                Export-DetectionRemediationPair -DetectPath $detectPath -RemediatePath $remediatePath -Title $title -Message $message -ActionButtonText $actionButtonText -ActionButtonUrl $actionButtonUrl -DurationSeconds $duration -ShowDismissButton $showDismissButton -AppId $appId
            }
            "3" {
                $defaultOutput = $script:SavedConfig.LastOutputPath
                $baseName = "Toast"
                $timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'

                Write-Host "`nCurrent output directory: $defaultOutput" -ForegroundColor Gray
                $userDir = Read-Host "Enter output directory [press Enter to use default]"
                if ([string]::IsNullOrWhiteSpace($userDir)) { $userDir = $defaultOutput }

                $remediationFile = "${baseName}Remediation_${timestamp}.ps1"
                $remediatePath = Join-Path $userDir $remediationFile

                if (-not (Test-Path $userDir)) {
                    New-Item -ItemType Directory -Path $userDir -Force | Out-Null
                }

                Export-IntuneRemediationScript -OutputPath $remediatePath -Title $title -Message $message -ActionButtonText $actionButtonText -ActionButtonUrl $actionButtonUrl -DurationSeconds $duration -ShowDismissButton $showDismissButton -AppId $appId
            }
            "4" {
                $actionLoop = $false
            }
            "5" { 
                Save-Configuration
                $continueLoop = $false
                $actionLoop = $false
            }
            default { 
                Write-Warning "Invalid option selected."
            }
        }

        if ($choice -ne "4" -and $choice -ne "5") {
            Write-Host "`nPress Enter to continue..." -NoNewline
            Read-Host
        }
    }
}
