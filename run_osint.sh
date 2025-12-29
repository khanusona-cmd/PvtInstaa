#!/bin/bash

# OSINT (Open Source Intelligence) script
# Usage: ./run_osint.sh TARGET_ID
# Example: ./run_osint.sh @username
# Example: ./run_osint.sh email@example.com

set -e

TARGET_ID="${1:-}"

if [ -z "$TARGET_ID" ]; then
    echo "Error: TARGET_ID is required"
    echo "Usage: $0 <TARGET_ID>"
    echo "Examples:"
    echo "  $0 @username"
    echo "  $0 email@example.com"
    exit 1
fi

# Detect if input is an email address
IS_EMAIL=false
if [[ "$TARGET_ID" == *@*.*  ]]; then
    IS_EMAIL=true
    EMAIL="$TARGET_ID"
    # Extract username from email (part before @)
    USERNAME="${TARGET_ID%%@*}"
else
    # Remove @ symbol if present for cleaner username handling
    USERNAME="${TARGET_ID#@}"
fi

echo "============================================"
echo "OSINT Investigation Report"
echo "============================================"
echo "Target: $TARGET_ID"
if [ "$IS_EMAIL" = true ]; then
    echo "Type: Email Address"
    echo "Email: $EMAIL"
    echo "Username (from email): $USERNAME"
else
    echo "Type: Username"
    echo "Username: $USERNAME"
fi
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

# Email-specific checks
if [ "$IS_EMAIL" = true ]; then
    echo ""
    echo "📧 Email-Specific Checks:"
    echo "--------------------------------------------"
    
    # Check Have I Been Pwned
    if command -v curl &> /dev/null; then
        echo "Checking data breaches (Have I Been Pwned)..."
        HIBP_RESPONSE=$(curl -s -w "\n%{http_code}" "https://haveibeenpwned.com/api/v3/breachedaccount/$EMAIL" -H "User-Agent: OSINT-Script" 2>/dev/null || echo "000")
        HTTP_CODE=$(echo "$HIBP_RESPONSE" | tail -n1)
        
        if [ "$HTTP_CODE" = "200" ]; then
            echo "⚠️  Email found in data breaches!"
            echo "   Check details at: https://haveibeenpwned.com/account/$EMAIL"
        elif [ "$HTTP_CODE" = "404" ]; then
            echo "✓ No breaches found in Have I Been Pwned database"
        else
            echo "ℹ️  Could not check breaches (Status: $HTTP_CODE)"
            echo "   Manually check: https://haveibeenpwned.com/"
        fi
        
        # Gravatar check
        echo ""
        echo "Checking Gravatar profile..."
        EMAIL_HASH=$(echo -n "$EMAIL" | tr '[:upper:]' '[:lower:]' | md5sum | awk '{print $1}')
        GRAVATAR_STATUS=$(curl -s -o /dev/null -w "%{http_code}" "https://www.gravatar.com/$EMAIL_HASH.json" 2>/dev/null || echo "000")
        
        if [ "$GRAVATAR_STATUS" = "200" ]; then
            echo "✓ Gravatar profile found: https://www.gravatar.com/$EMAIL_HASH"
        else
            echo "✗ No Gravatar profile found"
        fi
    fi
    
    # Google search suggestion
    echo ""
    echo "🔍 Additional Email Searches:"
    echo "--------------------------------------------"
    ENCODED_EMAIL=$(echo "$EMAIL" | sed 's/@/%40/g')
    echo "• Google Search: https://www.google.com/search?q=%22$ENCODED_EMAIL%22"
    echo "• GitHub Search: https://github.com/search?q=$ENCODED_EMAIL&type=users"
    echo "• LinkedIn Search: https://www.linkedin.com/search/results/all/?keywords=$ENCODED_EMAIL"
fi

echo ""
echo "📋 Recommended OSINT Tools:"
echo "--------------------------------------------"

if [ "$IS_EMAIL" = true ]; then
    echo "• Holehe - Find accounts associated with email"
    echo "  Install: pip3 install holehe"
    echo "  Usage: holehe $EMAIL"
    echo ""
    echo "• Emailrep.io - Email reputation check"
    echo "  Website: https://emailrep.io/$EMAIL"
    echo ""
    echo "• Hunter.io - Email finder and verifier"
    echo "  Website: https://hunter.io/email-verifier"
    echo ""
    echo "• theHarvester - Email gathering from public sources"
    echo "  Install: sudo apt-get install theharvester"
    echo ""
else
    echo "• Sherlock - Username search across social networks"
    echo "  Install: pip3 install sherlock-project"
    echo "  Usage: sherlock $USERNAME"
    echo ""
    echo "• Social Analyzer - Profile analysis tool"
    echo "  GitHub: https://github.com/qeeqbox/social-analyzer"
    echo ""
fi

echo "• Maltego - Visual link analysis (works for both)"
echo "  Website: https://www.maltego.com/"
echo ""

echo "============================================"
echo "✓ OSINT investigation for $TARGET_ID completed"
echo "============================================"
echo ""
echo "⚠️  Note: Always ensure you have proper authorization"
echo "    before conducting OSINT investigations."
echo "============================================"
