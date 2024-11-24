$memoryUsage = Get-Counter '\Memory\% Committed Bytes In Use'
$averageMemoryUsage = [math]::round($memoryUsage.CounterSamples.CookedValue, 2)
if ($averageMemoryUsage -gt 80) {
    Write-Output "High memory usage"
    exit 1
} else {
    exit 0
}
