if (Test-Path C:\Windows\SoftwareDistribution.old)
{Write-Output "Folder Exist"
    exit 1
} else {
    Write-Output "Folder Doesnt Exists"
    exit 0
}