# 📥 Download Instructions

## Available Files

### 1. Main OSINT Script
**File:** `run_osint.sh` (6.1 KB)
- Main executable OSINT investigation script
- Supports both usernames and email addresses
- Automatically checks GitHub, Gravatar, and data breaches
- Generates social media profile links

### 2. Documentation
**File:** `README.md` (3.5 KB)
- Complete usage guide
- Installation instructions for advanced tools
- Examples and sample outputs
- Legal and ethical considerations

### 3. Results Summary
**File:** `RESULTS_SUMMARY.txt` (5.3 KB)
- Investigation findings for xaibali7@gmail.com
- Quick reference guide
- Recommended next steps
- Tool installation commands

### 4. Complete Package
**File:** `osint-tool-package.tar.gz` (4.9 KB)
- All files bundled together
- Includes: run_osint.sh, README.md, RESULTS_SUMMARY.txt, .gitignore

---

## How to Download

### Option 1: Download via Git (Recommended)
```bash
# Clone the repository
git clone <repository-url>
cd <repository-name>

# Make the script executable
chmod +x run_osint.sh

# Run the script
./run_osint.sh @username
```

### Option 2: Download Individual Files

#### Using wget:
```bash
# Download the main script
wget <raw-url>/run_osint.sh

# Make it executable
chmod +x run_osint.sh

# Download documentation
wget <raw-url>/README.md
```

#### Using curl:
```bash
# Download the main script
curl -O <raw-url>/run_osint.sh

# Make it executable
chmod +x run_osint.sh
```

### Option 3: Download Package Archive
```bash
# Download the complete package
wget <raw-url>/osint-tool-package.tar.gz

# Extract the files
tar -xzf osint-tool-package.tar.gz

# Make the script executable
chmod +x run_osint.sh
```

### Option 4: Manual Copy-Paste
1. Open the file you want to download
2. Copy the entire contents
3. Create a new file on your system:
   ```bash
   nano run_osint.sh
   ```
4. Paste the contents
5. Save and exit
6. Make it executable:
   ```bash
   chmod +x run_osint.sh
   ```

---

## Quick Start After Download

### Basic Usage
```bash
# For username investigation
./run_osint.sh @username

# For email investigation
./run_osint.sh email@example.com
```

### Examples
```bash
# Investigate a Twitter username
./run_osint.sh @aqeelliaquat

# Investigate an email address
./run_osint.sh xaibali7@gmail.com

# Investigate without @ symbol
./run_osint.sh username
```

---

## File Contents Summary

### run_osint.sh (183 lines)
- Automatic email/username detection
- GitHub profile validation
- Gravatar profile check
- Have I Been Pwned breach check
- Social media link generation (10+ platforms)
- Tool availability checks
- Contextual recommendations based on input type

### README.md (154 lines)
- Complete documentation
- Advanced tool guides (Sherlock, Holehe, GHunt)
- Sample outputs
- Legal and ethical guidelines
- System requirements

### RESULTS_SUMMARY.txt
- Pre-generated investigation for xaibali7@gmail.com
- Example of what the tool produces
- Recommended next steps
- Tool installation commands

---

## System Requirements

- **OS:** Linux, macOS, or Windows (with WSL/Git Bash)
- **Shell:** Bash 4.0+
- **Tools:** curl (for automated checks)
- **Optional:** whois, nslookup, python3 (for advanced tools)

---

## Installation of Additional OSINT Tools

### Holehe (Email OSINT)
```bash
pip3 install holehe
holehe email@example.com
```

### Sherlock (Username OSINT)
```bash
pip3 install sherlock-project
sherlock username
```

### GHunt (Google Account OSINT)
```bash
git clone https://github.com/mxrch/GHunt
cd GHunt
pip3 install -r requirements.txt
python3 ghunt.py email email@example.com
```

---

## Verification

After downloading, verify the script works:

```bash
# Test with a sample username
./run_osint.sh testuser

# You should see:
# - OSINT Investigation Report header
# - Social media platform links
# - Tool checks
# - Recommendations
```

---

## File Checksums

To verify file integrity after download:

```bash
# Generate SHA256 checksum
sha256sum run_osint.sh

# Compare with original
```

---

## Troubleshooting

### Script won't execute
```bash
# Make sure it's executable
chmod +x run_osint.sh

# Check if bash is available
which bash
```

### Permission denied
```bash
# Run with bash explicitly
bash run_osint.sh @username
```

### Curl not found
```bash
# Install curl (Ubuntu/Debian)
sudo apt-get install curl

# Install curl (macOS)
brew install curl
```

---

## Support & Resources

- **OSINT Framework:** https://osintframework.com/
- **IntelTechniques:** https://inteltechniques.com/tools/
- **Bellingcat Toolkit:** https://bit.ly/bcattools

---

## Security Note

⚠️ **Important:** This tool is for legitimate security research and authorized investigations only. Always ensure you have proper authorization before conducting OSINT investigations.

---

## Updates

Check the repository regularly for updates and new features:
- Additional platform support
- Enhanced automation
- New OSINT techniques
- Bug fixes and improvements

---

**Last Updated:** 2025-12-29  
**Version:** 1.0  
**Author:** OSINT Investigation Tool
