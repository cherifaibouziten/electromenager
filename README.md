# ⚡ ElectroShop — E-Commerce Algérien

Application e-commerce complète avec 4 types d'utilisateurs, simulation de paiement par carte, prédiction ML des ventes, et dashboard avancé.

---

## 🚀 Démarrage rapide

### Prérequis
- Node.js 18+
- MongoDB (local ou Atlas)
- npm ou yarn

### Installation

```bash
# 1. Backend
cd server
npm install
npm run seed    # Initialiser la base de données
npm start       # Démarre sur http://localhost:4000

# 2. Frontend (nouveau terminal)
cd client
npm install
npm run dev     # Démarre sur http://localhost:5173
```

---

## 👥 Les 4 Types d'utilisateurs

### 🔓 1. Visiteur (non connecté)
- Parcourir le catalogue
- Voir les produits et avis
- Rechercher et filtrer
- Voir les catégories

### 👤 2. Client (compte requis)
- Tout ce que peut faire le visiteur +
- Créer un compte / se connecter
- Ajouter au panier et gérer le panier
- Passer des commandes (livraison ou en ligne)
- Simulation paiement par carte bancaire
- Suivre ses commandes
- Laisser des avis et notes
- Gérer son profil et adresses
- Annuler commande / demander remboursement
- Utiliser des codes promo

### 🏪 3. Vendeur / vendor@electroshop.dz / Vendor@123
- Dashboard avec statistiques
- Ajouter / Modifier / Supprimer produits
- Gérer les catégories et promotions
- Voir et gérer les commandes
- Prédiction des ventes (IA / ML)

### 👑 4. Admin / admin@electroshop.dz / Admin@123
- Tout du vendeur +
- Gérer les utilisateurs (rôles, statuts)
- Supprimer utilisateurs
- Accès complet au système

---

## 💳 Simulation de Paiement

La page `/payment` simule un vrai terminal de paiement :
- Saisie de carte bancaire avec validation
- Affichage visuel de la carte (VISA/MC selon le numéro)
- Étapes animées : Saisie → Vérification → Autorisation → Confirmation
- Taux de succès simulé 95%
- Redirect automatique vers les commandes

---

## 🤖 Prédiction des Ventes (ML)

Algorithme de régression linéaire appliqué sur :
- Revenus des 12 derniers mois
- Nombre de commandes par mois
- Prévision des 3 prochains mois
- Score de confiance R²

---

## 🎁 Codes Promo

| Code | Réduction | Montant min |
|------|-----------|-------------|
| BIENVENUE10 | 10% | 5 000 DA |
| ETE25 | 25% | 20 000 DA |
| TECH15 | 15% | 10 000 DA |

---

## 🗂️ Structure du projet

```
electroshop/
├── client/               # React + Vite + Tailwind
│   └── src/
│       ├── pages/        # Toutes les pages
│       │   ├── Home.jsx
│       │   ├── AllProducts.jsx
│       │   ├── ProductDetails.jsx
│       │   ├── Cart.jsx
│       │   ├── Payment.jsx        ← Simulation paiement
│       │   ├── MyOrders.jsx
│       │   ├── Profile.jsx
│       │   └── seller/
│       │       ├── Dashboard.jsx
│       │       ├── SalesPrediction.jsx  ← ML
│       │       └── ManageUsers.jsx
│       └── components/   # Composants réutilisables
└── server/               # Node.js + Express + MongoDB
    ├── models/           # Schémas Mongoose
    ├── controllers/      # Logique métier
    ├── routes/           # Routes API
    └── middleware/       # Auth (4 rôles)
```

---

## 📡 API Endpoints

| Méthode | Route | Accès |
|---------|-------|-------|
| POST | /api/user/register | Public |
| POST | /api/user/login | Public |
| GET | /api/product/list | Public |
| POST | /api/order/cod | Client |
| POST | /api/order/online | Client |
| POST | /api/order/confirm-payment | Public |
| PUT | /api/user/:id/role | Admin |
| GET | /api/order/dashboard | Admin/Vendeur |
| GET | /api/order/all | Admin/Vendeur |

