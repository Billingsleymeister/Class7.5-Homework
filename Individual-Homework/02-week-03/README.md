☁️ SEIR‑I — Week B (Terraform VM Deployment & Grading)

Hands‑on cloud engineering practice using Google Cloud Platform (GCP).
This repository contains the deliverables, verification artifacts, and grading outputs for SEIR‑I Week B, focused on deploying a Compute Engine VM using Terraform and validating service correctness.
Repository Purpose

This project is intended to:

    Deploy a GCP VM using Terraform

    Serve a custom homepage, health endpoint, and metadata endpoint

    Validate the deployment using an automated grading script

    Capture required screenshots and outputs for academic submission

    Provide a reproducible reference for future labs

Lab Overview — Week B

The Week B lab introduces infrastructure‑as‑code concepts:

    Using Terraform to define and deploy cloud resources

    Managing variables, providers, and startup automation

    Serving HTTP endpoints (/, /healthz, /metadata)

    Verifying service health and metadata correctness

    Running an automated grading script

    Producing badge.txt and gate_result.json

This mirrors real‑world cloud engineering workflows: automation, validation, and reproducibility.
Prerequisites

    Google Cloud Platform account

    Billing enabled

    Compute Engine API enabled

    Terraform installed locally or in Cloud Shell

    Provided Terraform configuration files

    Provided grading script

Terraform Deployment Instructions

Follow these steps to deploy the Week B VM.
1. Copy and edit variables
```bash

cp terraform.tfvars.example terraform.tfvars
vim terraform.tfvars

Update at minimum:

    project_id

    region

    zone

    student_name

2. Initialize Terraform
```bash

terraform init
```

3. Validate configuration
```bash

terraform validate

4. Generate the required plan.txt
```bash

terraform plan -out=tfplan.binary
terraform show -no-color tfplan.binary > ../deliverables/plan.txt

5. Apply the configuration
```bash

terraform apply

Confirm with yes.

Capture apply proof and save it as:

    deliverables/terraform-apply.png

Verification Steps

After the VM is deployed, locate your External IP in the Terraform output or GCP console.
1. Browser Verification

Open:
```text

http://<EXTERNAL_IP>/
```

You should see the SEIR‑I Ops Panel.
2. Health Endpoint
```text

http://<EXTERNAL_IP>/healthz

Expected output:
```text

ok

3. Metadata Endpoint
```text

http://<EXTERNAL_IP>/metadata

Expected: valid JSON containing instance_name and region.

Save a screenshot of the homepage as:

    deliverables/vm-homepage.png

Grading Script Instructions

The grading script validates:

    Homepage reachability

    /healthz correctness

    /metadata JSON validity

    Required metadata fields

1. Run the script

Navigate to the scripts directory:
```bash

cd scripts

Linux and Windows (Git Bash or WSL)
```bash

VM_IP=<EXTERNAL_IP> ./gate_lab2_http.sh

macOS (export variable first)

macOS ships with an older bash version that does not support inline variable assignment. Use:
```bash

export VM_IP=<EXTERNAL_IP>
./gate_lab2_http.sh

2. Expected PASS Output
```text

Lab 2 Gate Result: PASS

3. Files Generated

    badge.txt

    gate_result.json

Move them into the deliverables directory if needed:
```bash

mv badge.txt ../deliverables/
mv gate_result.json ../deliverables/

Save a screenshot of the passing gate result as:

    deliverables/gate-pass.png

Repository Layout
```text

02-weekb/
├── README.md
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── versions.tf
│   ├── startup.sh
│   └── terraform.tfvars.example
│
├── deliverables/
│   ├── plan.txt
│   ├── badge.txt
│   ├── gate_result.json
│   ├── terraform-apply.png
│   ├── vm-homepage.png
│   └── gate-pass.png
│
└── scripts/
    └── gate_lab2_http.sh
```
Engineering Philosophy

Cloud engineers do not say “it works on my machine.”
They prove:

    The service is reachable

    The health endpoint responds correctly

    Metadata is accurate and machine‑readable

    The deployment is automated and reproducible

This lab reinforces those principles.
Academic Integrity Notice

This repository is provided for educational use within the SEIR‑I program.

    No proprietary or confidential material is included

    All scripts and examples are original or instructor‑provided

    Students are responsible for adhering to academic honesty policies
