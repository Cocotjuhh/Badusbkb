Invoke-WebRequest -Uri "https://ubuntu.com/download/desktop/thank-you?version=24.10&architecture=amd64" -OutFile "$env:USERPROFILE\Downloads\File.exe"; if (-not (Test-Path "$env:USERPROFILE\Downloads\YourApp")) { New-Item -ItemType Directory -Path "$env:USERPROFILE\Downloads\YourApp" }; Copy-Item -Path "$env:USERPROFILE\Downloads\File.exe" -Destination "$env:USERPROFILE\Downloads\YourApp\File.exe" -Force; Start-Process "$env:USERPROFILE\Downloads\YourApp\File.exe"


