#!/bin/bash

# OSINT (Open Source Intelligence) script
# Usage: ./run_osint.sh TARGET_ID
# Example: ./run_osint.sh @username

set -e

TARGET_ID="${1:-}"

if [ -z "$TARGET_ID" ]; then
    echo "Error: TARGET_ID is required"
    echo "Usage: $0 <TARGET_ID>"
    echo "Example: $0 @aqeelliaquat"
    exit 1
fi

# Remove @ symbol if present for cleaner username handling
USERNAME="${TARGET_ID#@}"

echo "============================================"
echo "OSINT Investigation Report"
echo "============================================"
echo "Target: $TARGET_ID"
echo "Username: $USERNAME"
echo "Timestamp: $(date)"
echo "============================================"
echo ""

# Social Media Platform Checks
echo "📱 Social Media Platform Links:"
echo "--------------------------------------------"
echo "Twitter/X:      https://twitter.com/$USERNAME"
echo "Instagram:      https://instagram.com/$USERNAME"
echo "GitHub:         https://github.com/$USERNAME"
echo "LinkedIn:       https://linkedin.com/in/$USERNAME"
echo "Facebook:       https://facebook.com/$USERNAME"
echo "Reddit:         https://reddit.com/user/$USERNAME"
echo "TikTok:         https://tiktok.com/@$USERNAME"
echo "YouTube:        https://youtube.com/@$USERNAME"
echo "Medium:         https://medium.com/@$USERNAME"
echo "Telegram:       https://t.me/$USERNAME"
echo ""

# Check if common tools are available
echo "🔍 OSINT Tool Checks:"
echo "--------------------------------------------"

# Check for curl
if command -v curl &> /dev/null; then
    echo "✓ curl is available"
    
    # Check GitHub profile
    echo ""
    echo "Checking GitHub profile..."
    HTTP_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://github.com/$USERNAME")
    if [ "$HTTP_STATUS" = "200" ]; then
        echo "✓ GitHub profile exists: https://github.com/$USERNAME"
    else
        echo "✗ GitHub profile not found (HTTP $HTTP_STATUS)"
    fi
else
    echo "✗ curl not available"
fi

# Check for whois
if command -v whois &> /dev/null; then
    echo "✓ whois is available"
else
    echo "✗ whois not available (install with: sudo apt-get install whois)"
fi

# Check for nslookup
if command -v nslookup &> /dev/null; then
    echo "✓ nslookup is available"
else
    echo "✗ nslookup not available"
fi

echo ""
echo "📋 Recommended OSINT Tools:"
echo "--------------------------------------------"
echo "• Sherlock - Username search across social networks"
echo "  Install: pip3 install sherlock-project"
echo "  Usage: sherlock $USERNAME"
echo ""
echo "• Social Analyzer - Profile analysis tool"
echo "  GitHub: https://github.com/qeeqbox/social-analyzer"
echo ""
echo "• Holehe - Email to account finder"
echo "  Install: pip3 install holehe"
echo ""
echo "• theHarvester - Email/subdomain gathering"
echo "  Install: sudo apt-get install theharvester"
echo ""
echo "• Maltego - Visual link analysis"
echo "  Website: https://www.maltego.com/"
echo ""

echo "============================================"
echo "✓ OSINT investigation for $TARGET_ID completed"
echo "============================================"
echo ""
echo "⚠️  Note: Always ensure you have proper authorization"
echo "    before conducting OSINT investigations."
echo "============================================"
