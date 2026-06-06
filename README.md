# HERMES AGENT Landing Page

Site web de présentation de HERMES AGENT - Agent IA autonome pour développement full-stack.

## Structure du projet

```
.
├── index.html          # Page d'accueil
├── docs.html           # Documentation
├── api.html            # Référence API
├── blog.html           # Blog
├── 404.html            # Page 404
├── styles/
│   └── shared.css      # Styles partagés (OKLCH, animations)
├── CNAME               # Configuration domaine (optionnel)
└── README.md           # Ce fichier
```

## Technologies

- **CSS OKLCH** - Couleurs modernes avec support perceptuel
- **CSS Layers** - Architecture CSS moderne
- **View Transitions API** - Transitions fluides entre pages
- **Canvas API** - Animation de particules en arrière-plan
- **Scroll-Driven Animations** - Barre de progression scroll

## Déploiement

### GitHub Pages

1. Fork ou clonez ce dépôt
2. Activez GitHub Pages dans les paramètres du dépôt
3. Sélectionnez la branche `main` et le dossier `/` (root)

### Déploiement local

```bash
# Clonez le dépôt
git clone https://github.com/your-org/hermes-agent-landing.git
cd hermes-agent-landing

# Serveur local simple
python -m http.server 8000
# ou
npx serve .
```

## Personnalisation

### Modification des couleurs

Les couleurs sont définies dans `styles/shared.css` sous la couche `settings` :

```css
@layer settings {
    :root {
        --accent: oklch(63% 0.19 220); /* Bleu principal */
        --bg-primary: oklch(8% 0.003 265); /* Fond sombre */
    }
}
```

### Modification du domaine

Pour utiliser un domaine personnalisé, créez un fichier `CNAME` à la racine :

```
votre-domaine.com
```

## Licence

MIT License - Voir le fichier LICENSE pour plus de détails