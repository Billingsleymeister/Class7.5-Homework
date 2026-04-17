## **SEIR-I Class 7.5 - Week A: GCP Foundation [[Lab]]**
---

## Prerequisites & Setup

### Account Requirements
- **Google/Gmail Account** - Can create a dedicated one for the class (instructor made "Balerica SEIR-I" for this purpose)
- **Billing Account** - Credit/debit card required, but you get **$300 free credit** for the first 90 days
- **No prior experience needed** - This lab is designed for complete beginners

### The "First Project" Trap
```
⚠️ CRITICAL WARNING ⚠️
DO NOT work in the default "My First Project" that GCP creates.
It marks you as a novice. Always create a NEW project for your work.
```
#### ==I already completed Step 1 and 2 during Software Installs and Delivierables==
---

## Step 1: Create Your GCP Project

### Navigation Path
1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Click on the project dropdown at the top of the page (next to "Google Cloud Platform")
3. Click **"New Project"**

### Project Configuration
| Field | Action | Notes |
|-------|--------|-------|
| Project Name | Choose anything | Instructor examples: "Netherlands Voyage", "tier one", "cr one" |
| Location | Leave default | Parent organization/organization not needed |
| Billing Account | Ensure it's attached | Created during account setup |

**Key Concept:** Projects are isolated environments for your infrastructure. Think of them as separate workspaces.

---

## Step 2: Enable Required APIs

### The "Enable API" Roadblock
Before creating any resources, you must enable the Compute Engine API.

**How to check:**
1. In the search bar (top of console), type "VM instances"
2. Click on "VM instances" in the results
3. If you see **"Enable API"** - CLICK IT and wait for completion
4. If you see the VM creation screen, you're already good to go

---

## Step 3: Create Your First VM Instance

### Navigation
- **Method 1:** From main dashboard, click "Create a VM" in the quick access section
- **Method 2:** Use navigation menu (☰) → Compute Engine → VM instances → "Create Instance"
- **Method 3:** Search bar → type "VM instances"

### Configuration Settings

#### Basic Settings
| Setting | Action | Why |
|---------|--------|-----|
| **Name** | Optional - can leave default or customize | Instructor used "basic-a", "basic-b" for demos |
| **Region** | Leave default (Iowa/us-central1) | Cheapest region, used in all class examples |
| **Zone** | Leave default | Any zone works for learning |

**Instructor Note:** *"For the purposes of the class, I usually do Iowa because it's a pretty cheap environment."*

#### Machine Configuration
- **Series:** Keep default (E2)
- **Machine type:** Keep default (e2-micro)
- **Monthly estimate:** ~$12.41 (covered by free credits)

**Cost Awareness:** *"This is a monthly estimate, not an hourly estimate. If you don't tear this down, this is gonna cost you... It's about 4¢ hourly. You don't get billed unless you use the resource for at least one hour."*

#### OS and Storage
- Click to expand this section
- **Operating System:** Debian (already default)
- **Version:** Debian GNU/Linux 12 (bookworm) - default is fine
- **Boot disk type:** Keep default
- **Size:** Keep default (10GB)

**Note:** We use Debian for EVERY lab in GCP. No Ubuntu, no Windows.

#### Data Protection
- Click to expand
- **Delete boot disk when instance is deleted:** ☑️ Checked
- **Backups:** Keep default (disabled)

**Instructor Note:** *"Just do no backups right here. We don't need a backup. This is just a lab."*

#### Networking
- Click to expand
- **Network tags:** Leave blank
- **Allow HTTP traffic:** ☑️ **CHECK THIS**
- **Allow HTTPS traffic:** ❌ Leave unchecked

#### Observability
- Leave defaults - not needed for basic lab

#### Security
- **DO NOT CLICK/EXPAND**
- Nothing to configure here for this lab

---

## Step 4: The Startup Script (The "Magic")

### Access the Class Repository
1. Go to instructor's GitHub repo (link provided in class)
2. Navigate to: **weekly-lessons/ → week-a/**
3. Click on **"user-scripts"** folder

### Get Your Script
1. Click on the script you want (instructor used "basic.sh" for demo)
2. Look for the **"Raw"** button at the top of the code view
3. Click the **"Copy raw file"** icon (next to Raw button)

**Why this method?** *"The reason why you do this is it's perfect copy. There's no possibility of copying a white space... If you just click here, you don't have to think."*

### Apply the Script
1. Go back to VM creation screen
2. Scroll down to **Advanced** section (expand it)
3. Find **"Automation"** → **"Startup script"**
4. **PASTE** the copied script
5. Verify it pasted completely

### Sample Script Content (basic.sh)
```bash
#!/bin/bash

#Chewbacca: A node awakens in the cloud.

apt update -y
apt install -y nginx

HOSTNAME=$(hostname)
DATE=$(date)
OS=$(lsb_release -d | cut -f2)
UPTIME=$(uptime -p)

cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>SEIR-I Cloud Node</title>
<style>
body {
    background-color:#0b0c10;
    color:#66fcf1;
    font-family: monospace;
    text-align:center;
    padding-top:50px;
}
.box {
    border:2px solid #45a29e;
    width:600px;
    margin:auto;
    padding:20px;
}
</style>
</head>

<body>

<h1>⚡ SEIR-I Cloud Node Online ⚡</h1>

<div class="box">

<p><b>Hostname:</b> $HOSTNAME</p>
<p><b>OS:</b> $OS</p>
<p><b>Uptime:</b> $UPTIME</p>
<p><b>Startup Time:</b> $DATE</p>

<br>

<p>If you see this page, you have successfully deployed infrastructure.</p>

<p><b>Welcome to Cloud Engineering.</b></p>

</div>

</body>
</html>
EOF

systemctl restart nginx
```

---

## Step 5: Create and Deploy

### Launch the Instance
1. Scroll to bottom of page
2. Click blue **"Create"** button
3. Wait for instance status to show green checkmark ✓ and "Running"

### Find Your Public IP
1. In VM instances list, find your new VM
2. Look for **"External IP"** column
3. Hover over the IP address
4. Click the **"copy to clipboard"** icon (double square)

---

## Step 6: Access Your Website

### Method 1: Direct Browser Access
1. Open new browser tab
2. Type: `http://` + [YOUR_EXTERNAL_IP]
3. Example: `http://34.68.149.64`
4. Press Enter

### Method 2: Copy/Paste
1. Copy the external IP
2. Type `http://` in address bar
3. Paste the IP
4. Press Enter

### What You Should See
A webpage showing:
- "Welcome to Cloud Engineering"
- Your hostname
- Your instance name
- Uptime information

---

## Step 7: SSH and Verification

### Connect via SSH
1. In VM instances list, find your VM
2. Look for **"SSH"** button in the "Connect" column
3. Click it - this opens a browser-based SSH session
4. Wait for connection to establish

### Run Verification Commands

```bash
# Check the web server is running
sudo systemctl status apache2

# View the webpage content locally
curl localhost

# View just the HTTP headers
curl -I localhost

# Check system information
hostname
uptime
whoami

# View the startup script logs
sudo journalctl -u google-startup-scripts --no-pager
```

### What These Commands Mean
| Command | Purpose |
|---------|---------|
| `curl localhost` | Requests the webpage from the server itself |
| `curl -I localhost` | Shows only the HTTP headers (server type, date, etc.) |
| `systemctl status` | Checks if the web service is running |
| `journalctl` | Views logs from the startup script |

---

## Step 8: CLEAN UP - TEAR DOWN

### ABSOLUTELY CRITICAL
You MUST delete your resources to avoid charges.

### Deletion Steps
1. In VM instances list, **select the checkbox** next to your VM(s)
2. Click the **"Delete"** button (top of list, looks like trash can)
3. Confirm deletion in popup
4. **Wait until the instance disappears from the list**



### The "One Hour" Rule
- You are billed in **minimum 1-hour increments**
- If you run an instance for 5 minutes and delete it, you're charged for 1 hour
- Plan your labs to maximize the hour

---

## Key Concepts & Terminology

### Cloud Fundamentals
| Term | Definition | Class Context |
|------|------------|---------------|
| **Region** | Geographic area containing multiple data centers | Iowa, São Paulo, Tokyo |
| **Zone** | Individual data center within a region | us-central1-a, us-central1-b |
| **VM Instance** | Virtual machine (virtual server) | What we built today |
| **External IP** | Public internet address | Used to access your website |
| **Startup Script** | Code that runs when VM boots | Automated the web server setup |

### Linux Commands Introduced
```bash
curl        # Transfer data from/to servers
systemctl   # Control system services
sudo        # Superuser do (run as admin)
journalctl  # View system logs
hostname    # Display system name
uptime      # Show how long system has been running
whoami      # Display current username
```

### HTTP/Web Concepts
| Term | Port | Purpose |
|------|------|---------|
| **HTTP** | 80 | Unencrypted web traffic (learning/debugging) |
| **HTTPS** | 443 | Encrypted web traffic (production) |

---

## Common Issues & Troubleshooting

### "The Website Won't Load"
**Checklist:**
- [ ] Did you allow HTTP traffic (port 80) during creation?
- [ ] Is the instance status "Running"?
- [ ] Are you using `http://` NOT `https://`?
- [ ] Did you copy the correct IP (External, not Internal)?
- [ ] Wait 1-2 minutes for startup script to complete

### "My SSH Button is Missing/Grayed Out"
**Potential Causes:**
- VM still provisioning (wait)
- Browser zoom level too high
- Using incompatible browser
- OS Login metadata setting enabled
- Project policy restrictions (create new project to test)

---

## Quick Reference Card

### One-Line Summary
Create VM → Allow HTTP → Add startup script → Copy external IP → View website → SSH verify → **DELETE EVERYTHING**

### Essential Commands
```bash
# After SSH into VM
curl localhost
curl -I localhost
sudo systemctl status apache2
hostname
uptime
```

### The Golden Rules
1. **Never** work in "My First Project"
2. **Always** allow HTTP (port 80), never HTTPS (for now)
3. **Always** copy scripts from GitHub "Raw" button
4. **Always** tear down when done

---

**End of Week A Lab Notes**