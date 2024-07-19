# Check if the corporate wallpaper is set
$wallpaperPath = "C:\Path\To\CorporateWallpaper.jpg"
$currentWallpaper = Get-ItemProperty -Path "HKCU:\Control Panel\Desktop\" -Name Wallpaper
if ($currentWallpaper.Wallpaper -ne $wallpaperPath) {
    Write-Output "Wallpaper needs to be set"
    exit 1
} else {
    Write-Output "Wallpaper is already set"
    exit 0
}
