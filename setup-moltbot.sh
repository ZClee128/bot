#!/bin/bash
set -e

echo "🔧 Manual Moltbot Setup Script"
echo "This script helps you set up Moltbot on any system"
echo ""

# Check Node.js version
echo "📋 Checking Node.js version..."
NODE_VERSION=$(node -v | cut -d 'v' -f 2 | cut -d '.' -f 1)
if [ "$NODE_VERSION" -lt 22 ]; then
    echo "❌ Node.js version must be >= 22"
    echo "Current version: $(node -v)"
    echo "Please upgrade Node.js: https://nodejs.org/"
    exit 1
fi
echo "✅ Node.js $(node -v) detected"

# Install Moltbot
echo ""
echo "📦 Installing Moltbot globally..."
npm install -g moltbot@latest

# Verify installation
echo ""
echo "✅ Verifying installation..."
moltbot --version

# Create .env if it doesn't exist
if [ ! -f .env ]; then
    echo ""
    echo "📝 Creating .env file from template..."
    cp .env.template .env
    echo "⚠️  Please edit .env and add your API keys!"
fi

# Make scripts executable
chmod +x start-moltbot.sh

echo ""
echo "✨ Setup complete!"
echo ""
echo "📋 Next steps:"
echo "   1. Edit .env and add your Google API key"
echo "   2. Run: ./start-moltbot.sh"
echo "   3. Follow the onboarding wizard"
echo ""
echo "📖 For detailed instructions, see MOLTBOT_SETUP.md"
