# Toast Notification Creator for Intune

A powerful PowerShell tool for creating and deploying Windows Toast Notifications through Microsoft Intune. This script enables enterprise IT teams to deliver system-level notifications with customizable content, actions, and deployment options.

## Overview

Toast Notifications are native Windows alerts that appear in the user's notification center and desktop corner. They're ideal for enterprise communications requiring user acknowledgment or action. This tool provides an interactive interface to create notifications and export them as ready-to-deploy Intune remediation scripts.

**Key Capabilities:**
- Interactive notification builder with real-time preview
- Customizable action buttons with URL routing
- Conditional acknowledgement requirements with automatic timing
- Multiple export formats (single script or detection/remediation pair)

---

## Features

### 1. Interactive Notification Builder
- Enter notification title and message
- Configure optional action button with URL
- Set acknowledgement requirements
- Custom app source/identifier (appears as notification source)
- Automatic configuration caching for repeated use

### 2. Real-Time Testing
- Test notifications locally before deployment
- Verify appearance and behavior on your device
- Confirm action buttons work correctly
- Validate timing and persistence settings

### 3. Flexible Export Options

#### Option A: Remediation Script Only
- Single PowerShell script for direct deployment
- Executes on all assigned devices
- Ideal for informational notifications
- Timestamped automatic naming

#### Option B: Detection + Remediation Pair
- Conditional deployment based on detection logic
- Display notification only if conditions are met
- Perfect for policy compliance and issue remediation
- Enables sophisticated targeting scenarios
- Timestamped automatic naming for both scripts

### 4. Customization
- **Title**: Notification headline (e.g., "Security Update Required")
- **Message**: Detailed notification content
- **App Source**: Custom branding (e.g., "IT Administration", "Security Team")
- **Action Button**: Optional clickable button with URL destination
- **Duration**: 
  - 30 seconds for standard notifications
  - 10 minutes for acknowledgement-required notifications
- **Dismiss Button**: Available when acknowledgement is required but no action button

### 5. Smart Defaults
- Saves last used settings automatically
- Persistent configuration stored in `%APPDATA%\ToastNotificationConfig.json`
- Quick access to previous values with Enter key
- Reduces repetitive data entry

---

## Installation & Prerequisites

### System Requirements
- **Windows**: Windows 10 or later
- **PowerShell**: Version 5.1 or later
- **Execution Policy**: RemoteSigned or Unrestricted
- **Intune**: Microsoft Endpoint Manager administrative access (for deployment)

### Setup
1. Clone or download the repository
2. Extract `ToastNotification.ps1` to your desired location
3. Run the script:
   ```powershell
   powershell -ExecutionPolicy Bypass -File ".\ToastNotification.ps1"
   ```

---

## Usage Guide

### Starting the Script
```powershell
.\ToastNotification.ps1
```

The script displays:
- ASCII art banner with creator attribution
- Main menu for notification configuration
- Interactive prompts for each notification property

### Step-by-Step Workflow

#### 1. Enter Notification Details

**Title**
- Displayed prominently in the notification
- Example: "Security Update Required"
- Default: Previously entered value (saved in configuration)

**Message**
- Body text explaining the notification
- Example: "A critical security patch is available. Please restart your system by EOD Friday."
- Default: Previously entered value

**App Source/Identifier**
- Shows who sent the notification (IT Attribution)
- Example: "IT Administration", "Security Team", "Company Support"
- Default: "IT.Administrator"
- Appears in notification center and logs

#### 2. Configure Action Button (Optional)

**Add Action Button? (y/N)**
- Press `y` to add an interactive button
- Press `N` to skip (or just press Enter for default)

If YES:
- **Button Text**: Label for the button (default: "Open")
- **Button URL**: Destination when clicked (default: "https://www.microsoft.com")
- **Important**: Action button automatically enables 10-minute persistent display
- A "Dismiss" button is also added for user acknowledgement

If NO:
- Proceeds to acknowledgement question
- Action button is omitted
- Only "Dismiss" button available if acknowledgement required

#### 3. Acknowledgement Requirement (If No Action Button)

**Require Acknowledgement? (y/N)**
- Press `y` for persistent 10-minute display
- Press `N` for auto-dismiss after 30 seconds
- **Only shown** if no action button is configured
- Action buttons automatically enforce acknowledgement

#### 4. Action Menu

After configuration, choose your next action:

**1. Test Notification**
- Displays the notification immediately on your device
- Verifies appearance and functionality before deployment
- Tests action button routing and dismiss behavior
- **Outcome**: Visual confirmation notification works correctly

**2. Export Detection + Remediation Scripts**
- Creates two paired PowerShell scripts
- Asks for output directory (auto-creates if needed)
- Files auto-named with timestamp: `Toast[Detection|Remediation]_yyyyMMdd_HHmmss.ps1`
- Generates accompanying README.md
- **Outcome**: Ready for Intune conditional deployment
- **Use When**: You need to detect a condition before showing notification

**3. Export Remediation Script Only**
- Creates single standalone PowerShell script
- Asks for output directory (auto-creates if needed)
- File auto-named with timestamp: `ToastRemediation_yyyyMMdd_HHmmss.ps1`
- Generates accompanying README.md
- **Outcome**: Ready for Intune remediation assignment
- **Use When**: Notification should display on all targeted devices

**4. Create Another Notification**
- Loops back to notification details entry
- Keeps current settings in memory for modification
- Useful for creating multiple similar notifications

**5. Exit**
- Saves all configuration changes
- Closes application
- Configuration persists for next run

---

## Technical Architecture

### How It Works

#### 1. WinRT Assembly Loading
```powershell
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
[Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime] | Out-Null
```
Loads Windows Runtime APIs needed for Toast Notification display.

#### 2. Toast XML Construction
The notification is defined using Windows Toast XML schema:
```xml
<toast duration="short|long" scenario="reminder|standard">
    <visual>
        <binding template="ToastText02" hint-attribution="Source">
            <text id="1">Title</text>
            <text id="2">Message</text>
        </binding>
    </visual>
    <actions>
        <action activationType="protocol" arguments="URL" content="Button Text"/>
        <action activationType="system" arguments="dismiss" content="Dismiss"/>
    </actions>
</toast>
```

**Key Elements:**
- `duration="short"`: 30-second auto-dismiss
- `duration="long"`: 10-minute persistent display
- `scenario="reminder"`: Forces prominent display
- `hint-attribution`: Source/sender identification
- `<action>` elements: User-interactive buttons

#### 3. Notifier Creation
```powershell
$Notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AppId)
```
Creates the notification delivery mechanism with specified app context.

#### 4. Notification Display
```powershell
$Notifier.Show($Toast)
```
Renders the notification on the user's device.

#### 5. User Interaction
- Action button clicks trigger URL navigation
- Dismiss button closes notification and logs dismissal
- Auto-expiration after duration expires

### Key Functions

#### New-ToastNotification
Displays a notification immediately on the local device for testing.

**Parameters:**
- `Title`: Notification headline
- `Message`: Notification body
- `ActionButtonText`: Custom button label
- `ActionButtonUrl`: URL for button click
- `DurationSeconds`: 30 or 600 (affects timing and persistence)
- `ShowDismissButton`: Includes dismiss button
- `AppId`: Source attribution

**Outcome**: Toast appears in notification center and system tray

#### Export-IntuneRemediationScript
Creates a standalone remediation script for Intune deployment.

**Generates:**
- Single `.ps1` file with embedded notification logic
- README.md with deployment instructions
- Automatic timestamp-based naming

**Deployment Use:**
- Assign to device groups in Intune
- Executes on target devices
- All devices receive notification

#### Export-DetectionRemediationPair
Creates conditional deployment scripts.

**Generates:**
- Detection script: `ToastDetection_yyyyMMdd_HHmmss.ps1`
  - Returns exit code 1 if condition NOT met
  - Returns exit code 0 if condition IS met
- Remediation script: `ToastRemediation_yyyyMMdd_HHmmss.ps1`
  - Executes only if detection returns 1
  - Displays the notification
- README.md with deployment instructions

**Deployment Use:**
- Pair scripts in Intune
- Detection runs first
- Remediation only runs if detection detects issue
- Enables targeted, conditional notifications

---

## Enterprise Use Cases & Examples

### Example 1: Mandatory Security Update Notification

**Business Scenario:**
IT needs to notify all users of a critical security patch requiring restart within 48 hours.

**Configuration:**
```
Title: Critical Security Update
Message: A security update is required. Your computer will restart at 11 PM. Please save work.
App Source: IT Security Team
Action Button: Yes, continue (https://company.com/security-info)
Duration: 10 minutes (persistent)
Export: Remediation Script Only
```

**Deployment:**
- Export script
- Create Intune remediation assignment
- Target: All Windows 10+ devices
- Run frequency: Daily

**Outcome:**
- Users see persistent notification
- Can click to learn more
- Can dismiss but notification returns daily
- IT has deployment confirmation in Intune

---

### Example 2: Conditional Password Expiration Warning

**Business Scenario:**
Notify only users whose passwords expire within 7 days, reducing false alerts.

**Configuration:**
```
Title: Password Expiration Warning
Message: Your domain password expires in 7 days. Reset it now at [portal].
App Source: IT Administration
Action Button: Reset Password (https://company.com/password-reset)
Duration: 10 minutes
Export: Detection + Remediation Pair
```

**Detection Script Logic:**
```powershell
# Query Active Directory password expiration
# Return exit 1 if expiration is within 7 days (run remediation)
# Return exit 0 if expiration is > 7 days (skip remediation)
```

**Outcome:**
- Only affected users receive notification
- Others don't see unnecessary alerts
- Reduces notification fatigue
- Targeted, efficient communication

---

### Example 3: Maintenance Window Notification

**Business Scenario:**
Notify users 24 hours before scheduled maintenance, encouraging graceful shutdown.

**Configuration:**
```
Title: Scheduled System Maintenance
Message: Your computer will restart for maintenance at 2 AM. Please shut down gracefully by 1:30 AM.
App Source: IT Operations
Action Button: Shut Down Now (ms-shutdown:)
Duration: 10 minutes
Export: Remediation Script Only
```

**Deployment:**
- Export script
- Schedule Intune assignment for 24 hours before maintenance
- Deploy at 2 PM day before maintenance
- Remove assignment after maintenance window

**Outcome:**
- Users receive advance notice
- Can proactively prepare
- Reduces unplanned reboots
- Improves user experience

---

### Example 4: Compliance Training Due

**Business Scenario:**
Remind users that annual security training is due, with persistent reminders until completed.

**Configuration:**
```
Title: Security Awareness Training Due
Message: Complete your annual security training by month-end. Training is required.
App Source: Compliance Office
Action Button: Start Training (https://company.com/training)
Duration: 10 minutes
Export: Detection + Remediation Pair
```

**Detection Script Logic:**
```powershell
# Query SCCM/Intune compliance data
# Return exit 1 if training NOT completed (show notification)
# Return exit 0 if training completed (skip notification)
```

**Outcome:**
- Non-compliant users see daily reminders
- Can quickly access training
- Persists until compliance achieved
- Drives training completion

---

### Example 5: Software Deployment Ready

**Business Scenario:**
Notify users that optional software is available, with link to request installation.

**Configuration:**
```
Title: New Software Available
Message: Microsoft Office 2024 is available for installation. Click below to request.
App Source: IT Service Desk
Action Button: Request Installation (https://company.com/software-catalog)
Duration: 10 minutes
Export: Remediation Script Only
```

**Deployment:**
- Export script
- Deploy to device group
- Users see notification for 10 minutes
- Can click to request at their convenience

**Outcome:**
- Increases awareness of available software
- Direct path to request
- Reduces support tickets for "how do I get X?"

---

## Deployment to Intune

### Prerequisites
- Microsoft Endpoint Manager admin access
- Target devices running Windows 10+
- Devices enrolled in Intune
- Device Groups or dynamic membership rules defined

### Method 1: Remediation Script Only

**Step-by-Step:**

1. **Export from Toast Creator**
   - Run Toast Creator tool
   - Configure notification
   - Select "Export Remediation Script Only"
   - Note the output directory

2. **In Endpoint Manager Admin Center**
   - Navigate to **Devices** → **Scripts and remediations** → **Remediation scripts**
   - Select **Create** → **Create script**

3. **Upload Script**
   - Name: `Toast Notification - [Your Notification Name]`
   - Description: Brief description of notification purpose
   - Script Settings:
     - Run this script using the logged-in credentials: **No** (runs as System)
     - Enforce script signature check: **No**
     - Run script in 64-bit PowerShell Host: **Yes**
   - Upload your exported `.ps1` file

4. **Detection Script**
   - For "Remediation Script Only" exports, detection should return success/compliance
   - Simple option: `exit 0` (always compliant, always runs remediation)
   - Or use provided template if available

5. **Assign to Devices**
   - Select **Assignments**
   - Add Groups: Select device groups to target
   - Schedule (optional):
     - Run on schedule: Set daily/weekly frequency
     - Or: Run immediately

6. **Review and Deploy**
   - Review all settings
   - Select **Create**
   - Monitor: **Devices** → **Scripts and remediations** → View results

### Method 2: Detection + Remediation Pair

**Step-by-Step:**

1. **Export from Toast Creator**
   - Run Toast Creator tool
   - Configure notification
   - Select "Export Detection + Remediation Scripts"
   - Note output directory (contains both scripts)

2. **In Endpoint Manager Admin Center**
   - Navigate to **Devices** → **Scripts and remediations** → **Remediation scripts**
   - Select **Create** → **Create script**

3. **Upload Detection Script**
   - Same settings as above
   - Upload `ToastDetection_[timestamp].ps1`

4. **Upload Remediation Script**
   - Upload `ToastRemediation_[timestamp].ps1`
   - This runs only if detection indicates non-compliance

5. **Configure Behavior**
   - Run remediation if the detection script finds an issue: **Yes**
   - Run remediation on devices with no detection script result: **No** (optional)

6. **Assign to Devices**
   - Select target device groups
   - Set run frequency (recommended: Daily or Weekly)

7. **Review and Deploy**
   - Create script
   - Monitor deployment in Intune dashboards

### Monitoring Deployment

**Check Status:**
1. Endpoint Manager → **Devices** → **Scripts and remediations** → Select script
2. View **Device status** tab
3. Check success/failure counts:
   - **Compliant**: Script deployed successfully
   - **Remediated**: Detection found issue, remediation ran
   - **Not Applicable**: Device didn't meet targeting criteria
   - **Error**: Script failed to execute

**Verify on Device:**
1. Open Notification Center on target device
2. Look for toast notification (should appear shortly after script runs)
3. Check Windows Event Viewer:
   - **Event Viewer** → **Windows Logs** → **System**
   - Look for PowerShell script execution events
4. Check Intune device details:
   - **Devices** → **All devices** → Select device
   - **Device compliance** → View remediation script history

---

## Configuration & Storage

### Configuration File
The script stores configuration in:
```
%APPDATA%\ToastNotificationConfig.json
```

**Contents:**
```json
{
  "LastTitle": "Action Required",
  "LastMessage": "Please review and acknowledge this notification",
  "LastAppId": "IT.Administrator",
  "LastOutputPath": "C:\\Users\\[User]\\Desktop",
  "LastGroup": "IT Administration",
  "LastUpdated": "2024-01-08T14:30:00"
}
```

**Location Examples:**
- Windows: `C:\Users\[YourUsername]\AppData\Roaming\ToastNotificationConfig.json`
- Network profile: `\\[Profile Server]\AppData\Roaming\ToastNotificationConfig.json`

### Editing Configuration Manually
You can directly edit the JSON file to set defaults:
```powershell
# Open config
notepad $env:APPDATA\ToastNotificationConfig.json

# Modify values and save
# Config will be read on next script run
```

---

## Advanced Topics

### Custom Detection Logic

For Detection + Remediation pairs, you can create sophisticated detection scripts:

**Example: Detect Outdated Software**
```powershell
$softwarePath = "C:\Program Files\MyApp\version.txt"
if (Test-Path $softwarePath) {
    $version = Get-Content $softwarePath
    if ([version]$version -lt [version]"2.0.0") {
        exit 1  # Non-compliant, run remediation (show notification)
    }
}
exit 0  # Compliant, skip remediation
```

**Example: Detect Security Policy Status**
```powershell
$regPath = "HKLM:\Software\Policies\Security"
$value = Get-ItemProperty -Path $regPath -Name "UpdatesEnabled" -ErrorAction SilentlyContinue

if ($null -eq $value.UpdatesEnabled -or $value.UpdatesEnabled -eq 0) {
    exit 1  # Not compliant, show notification
}
exit 0  # Compliant
```

### URL Schemes & Actions

Action button URLs can use various schemes:

**HTTP/HTTPS**
```
https://company.com/support
https://portal.azure.com
```

**Email**
```
mailto:support@company.com?subject=Help%20Needed
```

**Microsoft Specific**
```
ms-settings:  (Windows Settings)
ms-shutdown:  (Shutdown dialog)
rdp://  (Remote Desktop)
```

---

## Troubleshooting

### Notification Not Appearing

**Issue**: Notification doesn't display after script runs

**Solutions:**
1. Check Do Not Disturb (Focus Assist) is OFF
   - Settings → System → Focus Assist → Off

2. Verify notification settings
   - Settings → System → Notifications & actions
   - Ensure "Get notifications from apps and other senders" is ON

3. Check notification permissions
   - Settings → Privacy & Security → Notifications
   - Verify app (AppId) isn't blocked

4. Review script execution
   - Check Event Viewer for script errors
   - Run script manually to test: `powershell -ExecutionPolicy Bypass -File "script.ps1"`

### Action Button Not Working

**Issue**: Clicking button doesn't navigate to URL

**Solutions:**
1. Verify URL is valid and accessible from user context
2. Check if URL requires authentication
3. Test URL in browser first
4. Ensure no firewall/proxy blocking the URL
5. Try HTTP instead of HTTPS if behind corporate proxy

### Script Fails in Intune

**Issue**: Script shows error in Intune device status

**Solutions:**
1. Check script execution policy
   - Intune runs scripts as System with RemoteSigned
   - Ensure script isn't blocked

2. Review WinRT assembly loading
   - May fail on non-Windows devices
   - Verify target is Windows 10+

3. Check device logs
   - Event Viewer → Windows Logs → System
   - Look for PowerShell errors

4. Test locally first
   - Run exported script on test device manually
   - Verify notification appears

---

## Best Practices

### Notification Content
- **Keep it Brief**: Limit title to ~50 characters, message to ~200 characters
- **Be Specific**: State exactly what action is needed
- **Include Timeline**: "by Friday EOD", "within 7 days", "today"
- **Avoid Jargon**: Use language end-users understand

### Deployment Strategy
- **Test First**: Always use "Test Notification" before exporting
- **Pilot Group**: Deploy to small test group first
- **Off-Peak Hours**: Schedule for non-working hours when possible
- **Monitor Results**: Check deployment success in Intune

### Frequency Management
- **Avoid Overuse**: Daily notifications cause fatigue
- **Use Detection**: Only notify when actually needed
- **Set Expiration**: Remove stale deployments
- **Consolidate**: Combine multiple notifications when possible

### Compliance & Security
- **Trustworthy URLs**: Only link to official company resources
- **Audit Trail**: All deployments logged in Intune
- **No Sensitive Data**: Never include passwords/PII in notifications
- **Accessibility**: Use clear, inclusive messaging

---

## Security Considerations

### Script Execution
- Scripts execute in **System context** by default (administrator privileges)
- All executions are logged in Windows Event Viewer
- Intune tracks all script deployments and results

### URL Safety
- Verify all URLs in action buttons
- Ensure they point to legitimate company resources
- Avoid redirects or URL shorteners
- Test URLs before deployment

### Data Privacy
- Notifications are visible in Windows logs
- Messages should not contain sensitive data
- All deployments auditable in Intune
- No notification data stored in script

---

## Limitations & Considerations

### Device Requirements
- **OS**: Windows 10 or later only
- **PowerShell**: 5.1 or later required
- **Enrollment**: Device must be Intune enrolled for remediation deployment
- **WinRT**: Requires Windows Runtime libraries (standard on modern Windows)

### Notification Limitations
- **Text Only**: No custom images or rich formatting
- **Two-Line**: Title + Message format (no custom layouts)
- **No Audio**: Toasts don't play sounds by default
- **Transient**: Notifications disappear after timeout (or manual dismiss)

### Intune Constraints
- **Script Size**: 500 KB limit per script
- **Execution Timeout**: Default 30 minutes
- **Network**: Requires device internet connectivity
- **Frequency**: Minimum 1-hour intervals between detection runs

---

## Roadmap & Future Enhancements

Potential future additions:
- [ ] Custom notification templates
- [ ] Batch import from CSV
- [ ] Notification scheduling UI
- [ ] Multi-language support
- [ ] Custom icon/branding
- [ ] Notification logging & analytics
- [ ] Deployment history tracking
- [ ] A/B testing framework

---

## Support & Contribution

### Issues or Questions?
- Open an issue in the repository
- Include notification configuration details
- Attach error messages/logs

### Contributing
- Fork the repository
- Make improvements
- Submit pull request with description

---

## License & Attribution

**Created by**: Anthony Porter

This tool is provided as-is for use with Microsoft Intune and enterprise Windows device management.

---

## Additional Resources

- [Windows Toast Notifications Documentation](https://docs.microsoft.com/en-us/windows/apps/design/shell/tiles-and-notifications/send-local-toast-desktop)
- [Intune Remediation Scripts Guide](https://docs.microsoft.com/en-us/mem/intune/remote-actions/remediate-detected-issues)
- [Windows Runtime (WinRT) Overview](https://docs.microsoft.com/en-us/windows/uwp/get-started/universal-application-platform-guide)
- [PowerShell 5.1 Reference](https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/overview)

---

**Last Updated**: January 8, 2026
