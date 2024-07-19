# Set the corporate wallpaper
$wallpaperPath = "C:\Path\To\CorporateWallpaper.jpg"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name Wallpaper -Value $wallpaperPath
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
Write-Output "Wallpaper set"
