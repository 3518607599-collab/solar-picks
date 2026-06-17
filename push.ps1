# SolarPicks Auto-Push Script
# Token from GitHub screenshot

$token = "ghp_95WT2NT7iEre87k06QtPNL8R200Agh1MLqHS"
$repo = "3518607599-collab/solar-picks"

cd C:\Users\zard\solar-picks
git add -A
git commit -m "Auto-update $(Get-Date -Format 'yyyy-MM-dd HH:mm')" 2>$null
git remote set-url origin "https://3518607599-collab:${token}@github.com/${repo}.git"
$result = git push -u origin main 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "Push successful!" -ForegroundColor Green
} else {
    Write-Host "Push failed: $result" -ForegroundColor Red
}
