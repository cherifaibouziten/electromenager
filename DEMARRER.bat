@echo off
echo.
echo  ==========================================
echo   ⚡ ElectroShop - Demarrage Windows
echo  ==========================================
echo.

echo [1/3] Verification de Node.js...
node --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
  echo  ❌ Node.js non installe ! Telecharge depuis nodejs.org
  pause
  exit
)
echo  ✅ Node.js OK

echo.
echo [2/3] Installation des dependances backend...
cd server
call npm install
echo.
echo  Initialisation de la base de donnees...
call node config/seed.js
echo.

echo [3/3] Lancement du serveur backend...
start "ElectroShop Backend :4000" cmd /k "npm run dev"

echo.
echo  Lancement du frontend...
cd ../client
call npm install
start "ElectroShop Frontend :5173" cmd /k "npm run dev"

echo.
echo  ==========================================
echo   ✅ ElectroShop demarre !
echo   🌐 http://localhost:5173
echo   ⚙️  Admin: /seller/login
echo   📧 admin@electroshop.dz / Admin@123
echo  ==========================================
echo.
pause
