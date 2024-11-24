# Define the toast notification content
$Group = "System Alerts"
$Title = "Reboot Required"
$Message = "Your system has been running for over 7 days. Please reboot to ensure optimal performance."

# Create the toast notification
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime] | Out-Null
$template = [Windows.UI.Notifications.ToastTemplateType]::ToastText02
$toastXml = [Windows.UI.Notifications.ToastNotificationManager]::GetTemplateContent($template)
$toastTextElements = $toastXml.GetElementsByTagName("text")
$toastTextElements.Item(0).AppendChild($toastXml.CreateTextNode($Title)) | Out-Null
$toastTextElements.Item(1).AppendChild($toastXml.CreateTextNode($Message)) | Out-Null
$toast = [Windows.UI.Notifications.ToastNotification]::new($toastXml)
$notifier = [Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($Group)
$notifier.Show($toast)
