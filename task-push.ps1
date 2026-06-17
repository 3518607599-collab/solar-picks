# Push script - runs on user's machine via scheduled task
# Token is in the git remote URL already configured
$OutputEncoding = [System.Text.Encoding]::UTF8

cd C:\Users\zard\solar-picks
git config http.proxy http://127.0.0.1:7897
git config https.proxy http://127.0.0.1:7897

$output = git push -u origin main 2>&1
$output | Out-File -FilePath "C:\Users\zard\solar-picks\push-result.txt" -Encoding UTF8

# Also log success/failure
if ($LASTEXITCODE -eq 0) {
    "SUCCESS $(Get-Date)" | Out-File -FilePath "C:\Users\zard\solar-picks\push-result.txt" -Encoding UTF8 -Append
} else {
    "FAILED $(Get-Date): $output" | Out-File -FilePath "C:\Users\zard\solar-picks\push-result.txt" -Encoding UTF8 -Append
}
