# Auto-push script for SolarPicks
cd C:\Users\zard\solar-picks

# Try common proxy ports
$ports = @(7890, 7891, 7892, 7897, 1080, 8080)
foreach ($port in $ports) {
    $test = Test-NetConnection -ComputerName 127.0.0.1 -Port $port -WarningAction SilentlyContinue
    if ($test.TcpTestSucceeded) {
        git config http.proxy "http://127.0.0.1:$port"
        git config https.proxy "http://127.0.0.1:$port"
        break
    }
}

git add -A
git commit -m "Auto-update $(Get-Date -Format 'yyyy-MM-dd HH:mm')" 2>$null
$result = git push -u origin main 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Push successful!"
} else {
    Write-Host "Push failed - needs GitHub token"
}
