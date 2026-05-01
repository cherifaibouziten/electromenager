#!/bin/bash
echo "⚡ ElectroShop — Démarrage..."
echo ""

# Check Node
if ! command -v node &> /dev/null; then
    echo "❌ Node.js non trouvé. Installez Node.js 18+"
    exit 1
fi

# Check MongoDB
if ! command -v mongod &> /dev/null && ! pgrep -x "mongod" > /dev/null; then
    echo "⚠️  MongoDB non détecté. Démarrage manuel requis."
fi

# Install and seed server
echo "📦 Installation des dépendances serveur..."
cd server && npm install --silent
echo "🌱 Initialisation de la base de données..."
npm run seed
echo ""

# Start server in background
echo "🚀 Démarrage du serveur backend (port 4000)..."
npm start &
SERVER_PID=$!
sleep 2

# Install and start client
cd ../client
echo "📦 Installation des dépendances client..."
npm install --silent
echo "🎨 Démarrage du frontend (port 5173)..."
echo ""
echo "╔════════════════════════════════════════╗"
echo "║  ⚡ ElectroShop est prêt !             ║"
echo "║                                        ║"
echo "║  🌐 Frontend: http://localhost:5173    ║"
echo "║  🔧 Backend:  http://localhost:4000    ║"
echo "║                                        ║"
echo "║  👑 Admin:  admin@electroshop.dz       ║"
echo "║             Admin@123                  ║"
echo "║  🏪 Vendeur: vendor@electroshop.dz     ║"
echo "║             Vendor@123                 ║"
echo "╚════════════════════════════════════════╝"
echo ""
npm run dev
