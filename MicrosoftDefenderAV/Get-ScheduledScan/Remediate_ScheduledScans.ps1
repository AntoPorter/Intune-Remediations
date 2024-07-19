# Schedule quick scans daily and full scans weekly
Set-MpPreference -ScanScheduleQuickScanTime (Get-Date).AddDays(1).TimeOfDay
Set-MpPreference -ScanScheduleFullScanTime (Get-Date).AddDays(7).TimeOfDay
exit 0
