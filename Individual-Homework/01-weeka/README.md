# ☁️ SEIR‑I — Week A (GCP VM Deployment & Grading)

Hands‑on cloud engineering practice using Google Cloud Platform (GCP).
This repository contains the deliverables, verification artifacts, and grading outputs for SEIR‑I Week A, focused on deploying a Compute Engine VM with an automated startup script and validating service correctness.

## Repository Purpose

This project is intended to:

- Deploy a GCP VM using a provided startup script
- Serve a custom homepage, health endpoint, and metadata endpoint
- Validate the deployment using an automated grading script
- Capture required screenshots and outputs for academic submission
- Provide a reproducible reference for future labs

## Lab Overview — Week A

The Week A lab introduces foundational cloud engineering concepts:

- Creating a Compute Engine VM
- Using a startup script to automate configuration
- Serving HTTP endpoints (`/`, `/healthz`, `/metadata`)
- Verifying service health and metadata correctness
- Running an automated grading script
- Producing `badge.txt` and `gate_result.json`

This mirrors real‑world cloud engineering workflows: automation, validation, and reproducibility.

## Prerequisites

- Google Cloud Platform account
- Billing enabled (free tier is sufficient)
- Compute Engine API enabled
- Cloud Shell or local terminal with curl and jq
- Provided startup script
- Provided grading script

## VM Deployment Instructions

Follow these steps to deploy the Week A VM.

### 1. Create the VM

Navigate to Compute Engine → VM Instances → Create Instance.

Use the following configuration:

Name: seir-i-node
Region: us-central1 (or instructor-specified)
Zone: any
Machine type: e2-micro
Boot disk: Debian 12 or Ubuntu 22.04
Firewall: Allow HTTP traffic

### 2. Add Metadata (Optional but Recommended)

Under Metadata → Add item:

Key: student_name
Value: Your Name

### 3. Add the Startup Script

Scroll to:

Automation → Startup script

Paste the full provided script (the one that configures `/`, `/healthz`, `/metadata`, and the dashboard).

### 4. Create the VM

Click Create and wait 20–40 seconds for the startup script to complete.

## Verification Steps

After the VM boots, locate your External IP in the VM list.

### 1. Browser Verification

Open:

http://<EXTERNAL_IP>/

You should see the SEIR‑I Ops Panel.

### 2. Health Endpoint

http://<EXTERNAL_IP>/healthz

Expected output:

ok

### 3. Metadata Endpoint

http://<EXTERNAL_IP>/metadata

Expected: valid JSON containing instance_name and region.

## SSH Verification (Required Screenshots)

Open an SSH session from the GCP console and run:
```
curl localhost
curl -s localhost | head
systemctl status nginx --no-pager
```

Capture screenshots of all three outputs.

## Grading Script Instructions

The grading script validates:

- Homepage reachability
- /healthz correctness
- /metadata JSON validity
- Required metadata fields

### 1. Download the grading script

Provided by the instructor:

gate_gcp_vm_http_ok.sh

### 2. Run the script

Replace <EXTERNAL_IP> with your VM’s IP:

VM_IP=<EXTERNAL_IP> ./gate_gcp_vm_http_ok.sh

Example:

VM_IP=34.82.55.21 ./gate_gcp_vm_http_ok.sh

### 3. Expected PASS Output

Lab 1 Gate Result: PASS

PASS: Homepage reachable (HTTP 200)
PASS: /healthz endpoint returned 'ok'
PASS: /metadata returned valid JSON
PASS: metadata contains instance_name
PASS: metadata contains region

### 4. Files Generated

- badge.txt
- gate_result.json

These must be committed to this repository.

## Repository Layout
```
01-weeka/
├── README.md
│
├── deliverables/
│   ├── badge.txt
│   ├── curl-localhost.png
│   ├── curl-s-localhost-head.png
│   ├── gate_result.json
│   ├── health-check.png
│   ├── seir-1-ops-panel.png
│   ├── seir-i-node-metadata.png
│   └── systemctl-status-nginx.png
│
└── scripts/
    └── gate_gcp_vm_http_ok.sh
```

## Engineering Philosophy

Cloud engineers do not say “it works on my machine.”
They prove:

- The service is reachable
- The health endpoint responds correctly
- Metadata is accurate and machine-readable
- The deployment is automated and reproducible

This lab reinforces those principles.

## Academic Integrity Notice

This repository is provided for educational use within the SEIR‑I program.

- No proprietary or confidential material is included
- All scripts and examples are original or instructor-provided
- Students are responsible for adhering to academic honesty policies
