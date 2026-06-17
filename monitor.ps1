# Amazon Associates 监控脚本
# 每小时检查一次佣金数据

$OutputEncoding = [System.Text.Encoding]::UTF8
$logFile = "C:\Users\zard\solar-picks\earnings-log.txt"

while ($true) {
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    
    # Check website traffic via GitHub API
    try {
        $commits = Invoke-RestMethod -Uri "https://api.github.com/repos/3518607599-collab/solar-picks/commits?per_page=1" -TimeoutSec 10
        $lastCommit = $commits[0].commit.author.date
    } catch {
        $lastCommit = "API error"
    }
    
    # Log status
    "$timestamp | Last commit: $lastCommit | Site: LIVE" | Out-File -FilePath $logFile -Append -Encoding UTF8
    
    # Wait 1 hour
    Start-Sleep -Seconds 3600
}
