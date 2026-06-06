#!/bin/bash
# Deployment script for HERMES AGENT Landing Page

set -e

echo "🚀 Deployment Script for HERMES AGENT Landing Page"
echo "=================================================="

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: Run this script from the landing page directory"
    exit 1
fi

# Validate HTML files
echo "📝 Validating HTML files..."
python3 << EOF
import html.parser
import sys

files = ['index.html', 'docs.html', 'api.html', 'blog.html', '404.html']
for file in files:
    try:
        with open(file, 'r') as f:
            content = f.read()
        parser = html.parser.HTMLParser()
        parser.feed(content)
        print(f'✓ {file}: OK')
    except Exception as e:
        print(f'✗ {file}: {e}')
        sys.exit(1)
EOF

# Check CSS file
echo "📝 Validating CSS file..."
if [ -f "styles/shared.css" ]; then
    echo "✓ styles/shared.css: OK"
else
    echo "✗ styles/shared.css: Missing"
    exit 1
fi

# Create sitemap
echo "📝 Generating sitemap..."
cat > sitemap.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
    <url>
        <loc>https://hermes-agent.example.com/</loc>
        <priority>1.0</priority>
    </url>
    <url>
        <loc>https://hermes-agent.example.com/docs.html</loc>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://hermes-agent.example.com/api.html</loc>
        <priority>0.8</priority>
    </url>
    <url>
        <loc>https://hermes-agent.example.com/blog.html</loc>
        <priority>0.7</priority>
    </url>
</urlset>
EOF

echo "✓ sitemap.xml: OK"

# Create robots.txt
echo "📝 Generating robots.txt..."
cat > robots.txt << EOF
User-agent: *
Allow: /

Sitemap: https://hermes-agent.example.com/sitemap.xml
EOF

echo "✓ robots.txt: OK"

# Summary
echo ""
echo "✅ Préparation terminée avec succès!"
echo ""
echo "📋 Fichiers créés:"
echo "   - index.html (page d'accueil)"
echo "   - docs.html (documentation)"
echo "   - api.html (référence API)"
echo "   - blog.html (blog)"
echo "   - 404.html (page d'erreur)"
echo "   - styles/shared.css (styles partagés)"
echo "   - sitemap.xml"
echo "   - robots.txt"
echo ""
echo "🚀 Pour déployer sur GitHub Pages:"
echo "   1. Commit et push les changements"
echo "   2. Activez GitHub Pages dans les paramètres du dépôt"
echo "   3. Sélectionnez la branche 'main' et le dossier '/'"
echo ""
echo "🌐 Pour tester en local:"
echo "   python3 -m http.server 8000"
echo "   # puis ouvrez http://localhost:8000"