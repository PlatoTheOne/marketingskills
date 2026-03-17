param(
  [string]$ProjectRoot = $PSScriptRoot
)

$source = Join-Path $ProjectRoot "README.html"
$target = Join-Path $ProjectRoot "index.html"

if (-not (Test-Path $source)) {
  throw "Source file not found: $source"
}

Copy-Item -Path $source -Destination $target -Force
Write-Host "Synced README.html -> index.html"
Write-Host "Target:" $target
