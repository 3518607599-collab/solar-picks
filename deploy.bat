@echo off
chcp 65001 >nul
echo ========================================
echo   SolarPicks 一键部署工具 v2
echo ========================================
echo.

cd /d C:\Users\zard\solar-picks

echo [1/4] 自动检测代理端口...
set PROXY_PORT=

REM Try common Clash ports
for %%p in (7890 7891 7892 7893 7897 1080 8080) do (
    curl -s --connect-timeout 2 -x http://127.0.0.1:%%p https://github.com >nul 2>&1
    if !errorlevel! equ 0 (
        set PROXY_PORT=%%p
        goto :found
    )
)

echo [错误] 未找到可用的代理端口！
echo 请确保 Clash Verge 正在运行并已开启系统代理。
pause
exit /b 1

:found
echo [√] 找到代理端口: %PROXY_PORT%

echo [2/4] 配置 Git 代理...
git config http.proxy http://127.0.0.1:%PROXY_PORT%
git config https.proxy http://127.0.0.1:%PROXY_PORT%

echo [3/4] 提交更改...
git add -A
git commit -m "Professional website redesign" 2>nul

echo [4/4] 推送到 GitHub...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   部署成功！
    echo   等待 2 分钟后访问：
    echo   https://3518607599-collab.github.io/solar-picks/
    echo ========================================
) else (
    echo.
    echo [错误] 推送失败！
    echo 请检查 Clash Verge 是否正常运行。
)

pause
