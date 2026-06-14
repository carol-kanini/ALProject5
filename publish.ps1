# Auto bump version and publish
$appJsonPath = "app.json"
$json = Get-Content $appJsonPath | ConvertFrom-Json

# Bump build number
$version = [Version]$json.version
$newVersion = "{0}.{1}.{2}.{3}" -f $version.Major, $version.Minor, ($version.Build + 1), $version.Revision
$json.version = $newVersion

# Save
$json | ConvertTo-Json -Depth 10 | Set-Content $appJsonPath
Write-Host "Version bumped to $newVersion" -ForegroundColor Green