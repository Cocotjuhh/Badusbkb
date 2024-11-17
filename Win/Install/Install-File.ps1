Invoke-WebRequest -Uri "https://releases.ubuntu.com/24.10/ubuntu-24.10-desktop-amd64.iso?_ga=2.51572907.34575919.1731872626-541167693.1731872626" -OutFile "$env:USERPROFILE\Downloads\File.exe"; if (-not (Test-Path "$env:USERPROFILE\Downloads\YourApp")) { New-Item -ItemType Directory -Path "$env:USERPROFILE\Downloads\YourApp" }; Copy-Item -Path "$env:USERPROFILE\Downloads\File.exe" -Destination "$env:USERPROFILE\Downloads\YourApp\File.exe" -Force; Start-Process "$env:USERPROFILE\Downloads\YourApp\File.exe" -Wait


