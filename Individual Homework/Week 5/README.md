# Class: Introduction to Terraform on GCP

**Topic:** Terraform fundamentals — authentication, remote state, and Infrastructure as Code

---

## 1. Why [[Terraform]] Matters

| Concept | Explanation |
|---------|-------------|
| **Infrastructure as Code (IaC)** | Define infrastructure in configuration files, not clicking in console |
| **Declarative** | You describe WHAT you want; Terraform figures out HOW |
| **Immutable infrastructure** | Changes create new resources rather than modifying existing ones |

---

## 2. Prerequisites (Before Any Terraform Commands)

### Step 1: Copy Your GCP Project ID
- Go to GCP Console
- Find your project ID (e.g., `tier-one`, `class7-5-sovereign-man`)
- Copy it to Notepad — you'll need it repeatedly

![GCP Project ID](./screenshots/1_GCP%20Console_Project%20ID.png)

![Notepad Project ID](./Screenshots/2_Notepad_Project%20ID.png)

**Why:** The provider block needs your specific project ID. Using the wrong project means Terraform operates in the wrong place.

### Step 2: Create a Storage Bucket (Manually in Console)
![Find Storage Bucket](./Screenshots/3_GCP%20Console_Find%20Storage%20Bucket.png)

| Setting | Value |
|---------|-------|
| **Name** | Globally unique (e.g., `yourname-tf`, `seir-tf`) |
| **Location type** | Region (choose same as your project) |
| **Storage class** | Standard |
| **Access control** | Uniform or Fine-grained |
![Name Storage Bucket](./Screenshots/4_GCP%20Console_Name%20Storage%20Bucket.png)

**Copy the bucket name** to your Notepad next to project ID.

**Why:** This bucket will store your Terraform state file remotely (best practice).


### Step 3: Verify gcloud SDK is Configured

```bash
gcloud info
```
![gcloud info](./Screenshots/5_gcloud%20info.png)
**What you need to see:**
- `Account:` (your GCP email)
- `Project:` (your default project ID)
- `Billing account:` (set up)

**If you don't have this:** Raise your hand immediately. You cannot proceed without it.

**For Windows users with gcloud issues:** Use **Google Cloud SDK Shell** (search for it) instead of Git Bash for gcloud commands.

---

## 3. Authentication for Terraform (No JSON Key File)

Instead of downloading a JSON service account key, Theo used **Application Default Credentials (ADC)** :

```bash
gcloud auth application-default login
```

**What happens:**
1. Browser opens
2. Select your GCP account
3. Grant permissions
4. Credentials stored locally for Terraform
![gcloud auth login](./Screenshots/6_gcloud%20auth%20application-default%20login.png)

![gcloud authenticated](./Screenshots/7_gcloud%20authenticated.png)
**Why this method:**
| JSON Key Method | ADC Method |
|-----------------|------------|
| Risk of committing key to Git | No file to manage |
| Set environment variable | Automatic |
| Traditional | Modern approach |

---

## 4. Setting Up Your Terraform Folder Structure

### Step 1: Create a New Folder (Fresh Start)

Theo created a new folder `terraform2`

**In Windows Explorer / Mac Finder:**
- Navigate to your class folder (e.g., `Documents/TheoWAF/class7.5/GCP/Terraform`)
- Create new folder: `terraform2`
- Right-click inside folder → **Open Git Bash here** (Windows) or **Open Terminal** (Mac)
![New Terraform Folder](./Screenshots/8_New%20Terraform%20Folder.png)

### Step 2: Open VS Code from Terminal

```bash
code .
```

This opens VS Code in the current folder — ensures you're in the right place.
![Open VS Code in Folder](./Screenshots/9_Open%20File%20VSCode.png)
---

## 5. File 1: `0-authentication.tf` (Provider Configuration)

### Step 1: Create the File

Theo was strict about naming: **Use exactly these names.**

From Theo's repo, copy the **filename**:
- `0-authentication.tf`

In VS Code: Click **New File** → paste name → Enter

### Step 2: Copy the File Content

From Theo's repo, click **Raw** → copy all content → paste into your file.

### Step 3: Edit the Project ID

Find this line:
```hcl
provider "google" {
  project = "Thailand"   # ← REPLACE THIS
  region  = "us-central1"
  zone    = "us-central1-a"
}
```

Replace `"Thailand"` with **your GCP project ID** (from Notepad).

**Critical:** Keep the double quotes. Don't add spaces.


### Step 4: Save the File

- **Windows:** `Ctrl + S`
- **Mac:** `Cmd + S`

**Visual indicator:** White circle on tab disappears when saved.
![Create authentication file](./Screenshots/10_Create%20File_0-authentication.png)
---

## 6. Running Terraform Commands (Authentication Test Only)

### Before First Commands — Verify You Have a `.tf` File

```bash
ls
```
![Verify file](./Screenshots/11_Verify%20tf%20file.png)

You should see `0-authentication.tf`. **If not, Terraform will not initialize.**


### Command 1: Initialize

```bash
terraform init
```
![terraform init](./Screenshots/12_terraform%20init.png)

**What it does:** Downloads provider plugins, creates `.terraform/` folder and `.terraform.lock.hcl`

**Expected output:** `Terraform has been successfully initialized!`

### Command 2: Validate

```bash
terraform validate
```
![terraform validate](./Screenshots/13_terraform%20validate.png)

**What it does:** Checks syntax without making changes

**Expected output:** `Success! The configuration is valid.`

### Command 3: Plan

```bash
terraform plan
```
![terraform plan](./Screenshots/14_terraform%20plan.png)

**What it does:** Shows what resources will be created (should be none yet — just testing authentication)

### Command 4: Apply

```bash
terraform apply
```
![teraform apply](./Screenshots/15_terraform%20apply.png)

**Expected output:** `Apply complete! Resources: 0 added, 0 changed, 0 destroyed.`

**This only tests that Terraform can authenticate to your GCP account.** No resources are created yet.

---

## 7. Files Created by Terraform (DO NOT TOUCH)

After running `terraform init`, these files appear:

| File/Folder | What it is | What happens if you delete |
|-------------|------------|---------------------------|
| `.terraform/` | Provider plugins, modules | Must re-initialize |
| `.terraform.lock.hcl` | Dependency version lock | Dependencies break |
| `terraform.tfstate` | Local state file | **Fired immediately** |
| `terraform.tfstate.backup` | Previous state backup | Lose rollback ability |

**Theo's warning:** *"If you erase these files at the job and your manager finds out, consider yourself fired. You'll get a call from HR within one hour."*

**Aaron:** *"If you erase this at noon, you're gonna get that meeting at 12:30."*

---

## 8. File 2: `1-backend.tf` (Remote State Storage)

### Why Remote State?
- State file contains secrets and resource mappings
- Should not live on your local computer
- Team members need access to same state
- Storing in GCS bucket prevents accidental deletion

### Step 1: Create the File

Copy filename from Theo's repo: `1-backend.tf`

VS Code → New File → paste name → Enter

### Step 2: Copy Content

From Theo's repo → Raw → copy → paste into your file
![Create backend](./Screenshots/16_Create%20File_1-backend.png)

### Step 3: Edit Bucket Name

Find line 7:
```hcl
bucket = "lizzo-love-tf"   # ← REPLACE THIS
```
![Edit Bucket Name](./Screenshots/17_Edit%20Bucket%20Name.png)

Replace with **your bucket name** (from Notepad).

**Keep the double quotes.** No extra spaces.

### Step 4: Save

`Ctrl+S` or `Cmd+S`

### Step 5: Verify Both Files Exist

```bash
ls
```
![verify files](./Screenshots/18_Verify%20Files%20Exist.png)

Should show:
```
0-authentication.tf
1-backend.tf
```

---

## 9. Re-Initialize with Backend

Because you added a backend configuration, run `terraform init` again:

```bash
terraform init
```
![terraform init Backend](./Screenshots/19_terraform%20init_Inititalize%20backend.png)

Terraform will detect the backend configuration and initialize it.

**Then run:**
```bash
terraform validate
terraform plan
terraform apply
```
![terraform validate & plan Backend](./Screenshots/20_terraform%20validate_terraform%20plan.png)
![terraform apply](./Screenshots/21_terraform%20apply_created%20bucket.png)
![statefile in GCP Bucket](./Screenshots/22_GCP%20Console_Bucket_statefile.png)

After `apply`, check your bucket in GCP Console:
- Bucket → `terraform/state/default.tfstate`

The state file is now stored remotely. This is **best practice** and a common interview question.

---

## 10. File 3: `2-vpc.tf` (Creating Infrastructure)

### Step 1: Create the File

Copy filename: `2-vpc.tf` → New File → paste → Enter

### Step 2: Copy Content

From Theo's repo → Raw → copy → paste

### Step 3: Save
![Create VPC](./Screenshots/23_Create%20File_2-vpc.png)
### Step 4: Run Commands

```bash
terraform validate
terraform plan    # Should show "3 to add"
terraform apply   # Type "yes"
```
![terraform validate & plan VPC](./Screenshots/24_vpc_terraform%20validate_terraform%20plan.png)
![terraform apply & VPC created](./Screenshots/25_terraform%20apply_VPC%20created.png)

### Step 5: Verify in Console

Go to **VPC networks** → Refresh → New VPC named `main` appears.

---

## 11. Terraform Workflow Summary

| Step | Command | Purpose |
|------|---------|---------|
| 1 | `terraform init` | Initialize providers and backends |
| 2 | `terraform validate` | Check syntax |
| 3 | `terraform plan` | Preview changes |
| 4 | `terraform apply` | Create/update resources |
| 5 | `terraform destroy` | Delete all resources |

**Theo's methodology:** Do one file at a time.
1. `0-authentication.tf` only → test
2. Add `1-backend.tf` → test
3. Add `2-vpc.tf` → test

**Why:** If you add all files at once and something fails, you won't know which file caused the issue.

---

## 12. Terraform Destroy (Clean Up)

```bash
terraform destroy
```
![terraform destroy](./Screenshots/26_terraform%20destroy1.png)
![VPC Deleted](./Screenshots/27_terraform%20destroy2.png)

**What it does:** Deletes ALL resources created by `terraform apply` in that folder.

**What it does NOT delete:** The storage bucket (created manually in console).

**Theo's demo:** After destroy, the VPC disappeared. After running `apply` again, it reappeared. Terraform is **idempotent** — running `apply` twice in a row makes no changes.
![terraform apply after destroy](./Screenshots/28_terraform%20apply_after%20destroy.png)
---

## 13. Changing Resource Names (Immutable Resources)

Theo demonstrated renaming the VPC from `main` to `waffle-house`:

1. Edit `2-vpc.tf` → change the name
2. Save
3. `terraform plan` → shows **1 to add, 1 to destroy** (not "update")
4. `terraform apply` → destroys old VPC, creates new one

**Why destroy + create instead of update?** Some resource attributes are **immutable** (can't be changed in place). VPC names are immutable — changing them requires recreation.
![terraform plan & VPC name change](./Screenshots/29_vpc%20name%20change_terraform%20plan.png)
![terraform apply & VPC name change](./Screenshots/30_terraform%20apply_VPC%20name%20change.png)
---


## 14. Interview Question Highlight

**Theo:** *"Saving your state file in a bucket in the cloud is a big interview question. In GCP, we do this by default because it's so valuable."*

**How to answer:**
> *"We store Terraform state remotely in a GCS bucket with versioning enabled. This allows team collaboration, prevents state file loss, and avoids committing sensitive data to Git."*

---

## 15. Key Commands Reference

```bash
# GCP Authentication
gcloud info                                    # Verify configuration
gcloud auth application-default login         # ADC for Terraform
gcloud config set account EMAIL               # Switch active account
gcloud storage buckets list                   # List buckets (test auth)

# Terraform Commands (run in order)
terraform init                                 # First command
terraform validate                             # Check syntax
terraform plan                                 # Preview changes
terraform apply                                # Create resources
terraform destroy                              # Delete all resources
terraform state list                           # Show managed resources
terraform force-unlock ID                      # Unlock stuck state

# File System Commands
ls                                            # List files
code .                                        # Open VS Code in current folder
pwd                                           # Show current directory
```

---

**Final note:** Theo's step-by-step methodology — one file at a time, test after each addition — is the key takeaway. This prevents the "spaghetti Terraform" problem where you have 10 resources and no idea which one failed. Start small, validate, then expand. The VPC creation at the end showed how quickly infrastructure can be deployed once the foundation is correct.