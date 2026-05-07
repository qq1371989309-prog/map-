$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

foreach ($path in @("build", "dist", "release", "发布成品", "鍙戝竷鎴愬搧")) {
    $target = Join-Path $root $path
    if (Test-Path $target) {
        Remove-Item -Recurse -Force -LiteralPath $target
    }
}

Get-ChildItem -Path $root -Recurse -Directory -Filter "__pycache__" | Remove-Item -Recurse -Force
Get-ChildItem -Path $root -File -Filter "*.spec" | Remove-Item -Force

foreach ($dir in @("logs", "download", "update", "backup", "output_maps", "reports", "input_maps")) {
    $target = Join-Path $root $dir
    if (Test-Path $target) {
        Get-ChildItem -LiteralPath $target -Force |
            Where-Object { $_.Name -ne ".gitkeep" } |
            Remove-Item -Recurse -Force
    }
}

Write-Host "Workspace cleaned."
