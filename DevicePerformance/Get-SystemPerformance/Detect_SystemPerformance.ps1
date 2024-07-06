# Detection Script: Detect_SystemPerformance.ps1
 
# Define thresholds for high usage
$cpuThreshold = 80
$memoryThreshold = 80
$diskThreshold = 80
 
# Get current CPU usage
$cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
 
# Get current memory usage
$memoryUsage = (Get-Counter '\Memory\% Committed Bytes In Use').CounterSamples.CookedValue
 
# Get current disk usage
$diskUsage = Get-Counter '\LogicalDisk(_Total)\% Disk Time' | Select-Object -ExpandProperty CounterSamples | Select-Object -ExpandProperty CookedValue
 
# Check if any usage exceeds the threshold
if ($cpuUsage -gt $cpuThreshold -or $memoryUsage -gt $memoryThreshold -or $diskUsage -gt $diskThreshold) {
    Write-Output "High system resource usage detected: CPU=$cpuUsage%, Memory=$memoryUsage%, Disk=$diskUsage%"
    exit 1
} else {
    Write-Output "System resource usage is within acceptable limits: CPU=$cpuUsage%, Memory=$memoryUsage%, Disk=$diskUsage%"
    exit 0
}