# Check for errors in the event log
$eventErrors = Get-EventLog -LogName System -EntryType Error -Newest 100 | Select-Object TimeGenerated, Source, EventID, Message

# Output the event log errors
# Write-Output $eventErrors

$csvPath = "C:\temp\EventLogErrorStatus.csv"

$eventErrors | Export-Csv -Path $csvPath -NoTypeInformation
Write-Output "Event Log Error status exported to $csvPath"

Exit 0
