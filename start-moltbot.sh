#!/bin/bash
set -e

echo "🚀 Starting Moltbot..."

# Check if .env exists
if [ ! -f .env ]; then
    echo "❌ Error: .env file not found!"
    echo "📝 Please copy .env.template to .env and configure your API keys:"
    echo "   cp .env.template .env"
    echo "   Then edit .env with your Google API key and other settings."
    exit 1
fi

# Load environment variables
set -a
source .env
set +a

# Check for API key
if [ -z "$GOOGLE_API_KEY" ] && [ -z "$ANTHROPIC_API_KEY" ] && [ -z "$OPENAI_API_KEY" ]; then
    echo "❌ Error: No AI API key configured!"
    echo "📝 Please set at least one of the following in your .env file:"
    echo "   - GOOGLE_API_KEY (recommended)"
    echo "   - ANTHROPIC_API_KEY"
    echo "   - OPENAI_API_KEY"
    exit 1
fi

# Check if already configured
if [ ! -d "$HOME/.clawdbot" ]; then
    echo "⚙️  First time setup detected. Running onboarding wizard..."
    echo ""
    echo "📌 IMPORTANT NOTES:"
    echo "   1. Choose 'Local Gateway' when asked"
    echo "   2. Select Google/Gemini as your AI provider"
    echo "   3. The wizard will ask for your API key (from .env)"
    echo "   4. Choose your preferred chat platform (Telegram recommended for beginners)"
    echo ""
    read -p "Press Enter to continue..."
    
    moltbot onboard --install-daemon
else
    echo "✅ Moltbot already configured"
fi

# Start the gateway
echo ""
echo "🌟 Starting Moltbot Gateway..."
echo "📡 Gateway will be available on port ${MOLTBOT_PORT:-3000}"
echo ""
echo "🛑 To stop: Press Ctrl+C"
echo "📖 For help: Check MOLTBOT_SETUP.md"
echo ""

# Start moltbot
moltbot start
