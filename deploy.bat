@echo off
chcp 65001 >nul
echo ========================================
echo   SolarPicks 一键部署工具
echo ========================================
echo.

cd /d C:\Users\zard\solar-picks

echo [1/3] 配置 Git 代理...
git config http.proxy http://127.0.0.1:7897
git config https.proxy http://127.0.0.1:7897

echo [2/3] 提交更改...
git add -A
git commit -m "Update website design - professional version"

echo [3/3] 推送到 GitHub...
git push -u origin main

echo.
echo ========================================
echo   部署完成！等待 2 分钟后访问：
echo   https://3518607599-collab.github.io/solar-picks/
echo ========================================
pause
