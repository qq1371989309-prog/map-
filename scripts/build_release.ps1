$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$releaseRoot = Join-Path $root "release"
$releaseDir = Join-Path $releaseRoot "MapFanSim"

Get-Process MapFanSim -ErrorAction SilentlyContinue | Stop-Process -Force

foreach ($path in @("build", "dist", "release", "发布成品", "鍙戝竷鎴愬搧")) {
    $target = Join-Path $root $path
    if (Test-Path $target) {
        Remove-Item -Recurse -Force -LiteralPath $target
    }
}

python -m PyInstaller `
    --noconfirm `
    --clean `
    --windowed `
    --name MapFanSim `
    --add-data "data;data" `
    --add-data "input_maps;input_maps" `
    --add-data "output_maps;output_maps" `
    --add-data "download;download" `
    --add-data "update;update" `
    --add-data "backup;backup" `
    --add-data "reports;reports" `
    --add-data "logs;logs" `
    --add-data "tools;tools" `
    --add-data "rules;rules" `
    --hidden-import paramiko `
    --hidden-import bcrypt `
    --hidden-import cryptography `
    --hidden-import openpyxl `
    --hidden-import xlrd `
    src\MapFanSim.py

New-Item -ItemType Directory -Force -Path $releaseRoot | Out-Null
Copy-Item -Recurse -Force -LiteralPath (Join-Path $root "dist\MapFanSim") -Destination $releaseDir

foreach ($dir in @("data", "rules")) {
    $src = Join-Path $root $dir
    $dst = Join-Path $releaseDir $dir
    if (Test-Path $src) {
        Copy-Item -Recurse -Force -LiteralPath $src -Destination $dst
    }
}

foreach ($dir in @("input_maps", "output_maps", "download", "update", "backup", "reports", "logs", "tools")) {
    New-Item -ItemType Directory -Force -Path (Join-Path $releaseDir $dir) | Out-Null
}

Write-Host "Release created: $releaseDir"
