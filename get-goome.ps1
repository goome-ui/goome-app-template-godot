param([string]$Version = $(if ($env:GOOME_VERSION) { $env:GOOME_VERSION } else { "0.5.3" }))
$ErrorActionPreference = "Stop"
Set-Location $PSScriptRoot
$zip = Join-Path $PSScriptRoot "goome-addon.zip"
Invoke-WebRequest -UseBasicParsing -Uri "https://github.com/goome-ui/godot-goome/releases/download/v$Version/godot-goome-$Version.zip" -OutFile $zip
if (Test-Path addons/goome) { Remove-Item -Recurse -Force addons/goome }
Expand-Archive -Force $zip -DestinationPath $PSScriptRoot
Remove-Item $zip
Write-Host "got goome $Version into addons/goome"
