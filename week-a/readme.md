# SEIR-I Lab 1 — VM Homepage + Gate Proof (GCP)

This repo/lab is basically: **spin up a VM, host a homepage, prove it’s reachable, and prove the service is actually running** (not just “it loads on my laptop”).

The “gate philosophy” is simple:

- Don’t say **“it works on my screen.”**
- Do prove:
  - The homepage is reachable from the internet
  - `/healthz` returns `ok`
  - `/metadata` returns valid JSON
  - The VM identifies itself in that metadata (instance name, region)

---

## What I built

- A GCP Compute Engine VM
- NGINX serving a simple homepage on port 80
- Two endpoints:
  - `GET /healthz` → returns `ok`
  - `GET /metadata` → returns JSON about the instance (instance name, region, etc.)
- Proof steps + screenshots + gate script output (`badge.txt` + `gate_result.json`)

---
# GCP VM HTTP Server Setup & Verification

This guide walks you through creating a VM on Google Cloud, deploying a startup script, and verifying that your HTTP server is working correctly.

---

## Step 1: Create a VM (Compute Engine)

You can use either the GCP Console or CLI. The console method is recommended.

### Console Method

1. Navigate to: 
   **Compute Engine → VM Instances → Create Instance**

2. Configure your instance:
   - Enable **Allow HTTP traffic**

3. Add the startup script:
   - Go to: **Advanced → Management → Startup script**
   - Paste the contents of: 
     https://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weeka/userscripts/supera.sh

4. Click **Create**

---

## Step 2: Proof Checklist ("Show Your Work")

### A) Browser Proof

1. Locate your VM’s **External IP**:
   - **Compute Engine → VM Instances → External IP**

2. Open in browser:
   ```
   http://<EXTERNAL_IP>/
   ```

3. Take a screenshot of the homepage loading.

---

### B) SSH Proof

SSH into your VM and run:

```
curl localhost
curl -s localhost | head
```

This confirms the server responds locally.

---

## Step 3: Run the Gate Script (Verification)

### Download Script

https://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weeka/script/gate_gcp_vm_http_ok.sh

---

### Make Executable

```
chmod +x gate_gcp_vm_http_ok.sh
```

---

### Run the Script

IMPORTANT: Use your VM’s external IP address

```
VM_IP=<YOUR_EXTERNAL_IP> ./gate_gcp_vm_http_ok.sh
```

#### Example

```
VM_IP=34.82.55.21 ./gate_gcp_vm_http_ok.sh
```

---

## Expected Output

If everything is configured correctly:

```
PASS homepage reachable
PASS /healthz returned ok
PASS /metadata returned valid JSON
PASS metadata contains instance_name
PASS metadata contains region
```

---

## Output Files

The script will generate:

```
gate_result.json
badge.txt
```

---

## Troubleshooting Tips

- Ensure **HTTP traffic is allowed** in firewall settings  
- Confirm the startup script was pasted correctly  
- Wait 1–2 minutes after VM creation before testing  
- Verify the correct external IP is being used  

---

## Summary

By completing this guide, you have:

- Created a GCP VM  
- Deployed a startup script  
- Verified HTTP access externally and locally  
- Passed automated validation checks
