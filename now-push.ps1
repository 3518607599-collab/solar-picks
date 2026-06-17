# Immediate push script
cd C:\Users\zard\solar-picks
git config http.proxy http://127.0.0.1:7897
git config https.proxy http://127.0.0.1:7897
git add -A
git commit -m "Professional redesign with affiliate links" 2>$null
git push -u origin main
