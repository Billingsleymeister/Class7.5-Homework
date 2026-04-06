# SEIR-I Lab 2 — Terraform VM Deployment (Iowa)

Yo! This lab was all about leveling up from clicking around in the cloud console to actually acting like a cloud engineer. Instead of manually spinning things up, I used Terraform to deploy everything in a clean, repeatable way.

## What I Built

Using Terraform, I deployed:

- **A Google Compute Engine VM**
- **A firewall rule** to allow HTTP traffic (port 80)
- **A startup script** that:
  - Installs `nginx`
  - Serves a mini ops panel:
    - `/` → homepage
    - `/healthz` → health check
    - `/metadata` → instance metadata
- **Region/Zone:** `us-central1-a` (Iowa)

## How I Did It

### Setup

1. Created a project folder
2. Added Terraform files (`main.tf`, etc.)
3. Dropped in my GCP credentials JSON (not committed)

### Terraform Commands

Ran everything from the CLI:

```bash
terraform init
terraform validate
terraform plan -out tfplan
terraform apply tfplan
```
Then grabbed the VM URL:
```
terraform output vm_url
```

###Testing the Deployment

Got the external IP and ran the gate script:

VM_IP=$(terraform output -raw vm_external_ip)
VM_IP="$VM_IP" ./gate_lab2_http.sh

Also manually opened the URL in my browser to confirm everything worked on port 80.

###Deliverables Included
- main.tf (Terraform config)
- plan.txt (saved output from terraform plan)
- Screenshot / terminal output from terraform apply
- gate_result.json + badge.txt (from gate script)
- Proof that VM URL loads correctly in browser

###Result

The deployed VM successfully serves:

- Homepage → works
- /healthz → returns OK
- /metadata → shows instance info

Everything is live via the VM's external IP on port 80.

###Takeaways
Terraform makes infrastructure repeatable and version-controlled
Way easier to track changes vs manual setup
Startup scripts are useful for auto-configuring servers
This is basically the foundation of real DevOps workflows

###Gate Script

Used this to verify everything: https://github.com/BalericaAI/SEIR-1/blob/main/weekly_lessons/weekb/python/gate_lab2_http.sh

###Final Thoughts

This lab felt like a big jump from just “using the cloud” to actually engineering in the cloud. Definitely starting to see how this scales in real-world environments.
