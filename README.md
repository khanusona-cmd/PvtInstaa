# OSINT Investigation Tool

A bash script for conducting Open Source Intelligence (OSINT) investigations on usernames and targets.

## 🚀 Quick Start

### Basic Usage

```bash
# Make the script executable (already done)
chmod +x run_osint.sh

# Run investigation on a username
./run_osint.sh @aqeelliaquat

# Or without the @ symbol
./run_osint.sh aqeelliaquat
```

## 📋 What This Script Does

The script will:

1. **Generate Social Media Links** - Provides direct links to check profiles on:
   - Twitter/X
   - Instagram
   - GitHub
   - LinkedIn
   - Facebook
   - Reddit
   - TikTok
   - YouTube
   - Medium
   - Telegram

2. **Check Tool Availability** - Verifies if OSINT tools are installed on your system

3. **Validate GitHub Profile** - Automatically checks if the GitHub profile exists

4. **Recommend Advanced Tools** - Suggests professional OSINT tools for deeper investigation

## 💡 Examples

### Investigate a Twitter username
```bash
./run_osint.sh @aqeelliaquat
```

### Investigate any username
```bash
./run_osint.sh john_doe
```

### Use with environment variable
```bash
TARGET_ID="@aqeelliaquat" ./run_osint.sh $TARGET_ID
```

## 🛠️ Advanced OSINT Tools (Recommended)

### 1. Sherlock - Username Search Across 300+ Sites
```bash
# Install
pip3 install sherlock-project

# Usage
sherlock aqeelliaquat
```

### 2. Social Analyzer - Comprehensive Profile Analysis
```bash
# Clone and install
git clone https://github.com/qeeqbox/social-analyzer.git
cd social-analyzer
pip3 install -r requirements.txt

# Usage
python3 app.py --username "aqeelliaquat" --metadata
```

### 3. Holehe - Email to Account Finder
```bash
# Install
pip3 install holehe

# Usage (if you have an email)
holehe email@example.com
```

### 4. theHarvester - Email & Domain Intelligence
```bash
# Install
sudo apt-get install theharvester

# Usage
theHarvester -d example.com -b google
```

### 5. Maltego - Visual Link Analysis
- Professional OSINT platform
- Download from: https://www.maltego.com/

## 📊 Sample Output

```
============================================
OSINT Investigation Report
============================================
Target: @aqeelliaquat
Username: aqeelliaquat
Timestamp: Mon Dec 29 07:14:42 UTC 2025
============================================

📱 Social Media Platform Links:
--------------------------------------------
Twitter/X:      https://twitter.com/aqeelliaquat
Instagram:      https://instagram.com/aqeelliaquat
GitHub:         https://github.com/aqeelliaquat
...
```

## ⚠️ Legal & Ethical Considerations

**IMPORTANT:** 
- Always ensure you have proper authorization before conducting OSINT investigations
- Respect privacy laws and terms of service of platforms
- Use this tool responsibly and ethically
- This tool is for educational and legitimate security research purposes only

## 🔧 System Requirements

- Bash shell (Linux, macOS, WSL on Windows)
- `curl` (for checking profiles)
- Internet connection

## 📝 Notes

- The script generates links based on common username patterns
- Not all generated links will lead to valid profiles
- Some platforms may require manual verification
- For comprehensive results, use additional OSINT tools listed above

## 🤝 Contributing

Feel free to enhance this script with additional features:
- More social media platforms
- Automated profile validation
- Export results to file
- Integration with other OSINT tools

## 📄 License

This tool is provided as-is for educational purposes.
