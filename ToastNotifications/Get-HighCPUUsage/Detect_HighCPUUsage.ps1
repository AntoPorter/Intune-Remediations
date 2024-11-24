$cpuUsage = Get-Counter '\Processor(_Total)\% Processor Time'
$averageCpuUsage = [math]::round($cpuUsage.CounterSamples.CookedValue, 2)
if ($averageCpuUsage -gt 80) {
    Write-Output "High CPU usage"
    exit 1
} else {
    exit 0
}
