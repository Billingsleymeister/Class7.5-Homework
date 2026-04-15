# 🧪 Lab 69: VPC IP's Distribution (GCP)

## 📌 Objective
Learn how to reserve and manage static IP addresses (regional and global) in Google Cloud Platform (GCP), and associate them with a virtual machine.

---

## Step 1: Navigate to External IP Reservation

1. Open your **GCP Console**
2. Select a **project** (⚠️ *avoid using the default project*)
3. Navigate to:
<img width="1143" height="226" alt="image" src="https://github.com/user-attachments/assets/79486ff5-3158-42cf-860b-c9a383fa7250" />


4. Click **"Reserve External IP Address"**
<img width="1398" height="516" alt="image" src="https://github.com/user-attachments/assets/1de4c426-40c6-4511-a8c6-e389f291b90d" />  

---

## ⚙️ Step 2: Reserve a Regional Static IP

Fill out the following fields:

- **Name**: (Use your preferred naming convention)
- **Network Service Tier**: Premium  
- **IP Version**: IPv4  
- **Type**: Regional
<img width="758" height="727" alt="image" src="https://github.com/user-attachments/assets/ed8a45d1-31b8-445f-816e-996157590932" />


✅ Click **Reserve**  
<img width="694" height="202" alt="image" src="https://github.com/user-attachments/assets/6d2fd5f4-5f5c-426e-ab2b-4539d5204178" />


---

## Step 2.5: Verify IP Creation

- Confirm that your **static IP address** appears in the list
- Ensure it is marked as **Reserved**
<img width="1430" height="243" alt="image" src="https://github.com/user-attachments/assets/11e36c9f-6a8d-414f-944c-5a9ed642eaf1" />


---

## Step 3: Reserve a Global Static IP

1. Click **Reserve External IP Address** again
2. Configure:

- **Type**: Global  
- (Other fields remain similar)

⚠️ **Important**: Click **Reserve**  
<img width="715" height="702" alt="image" src="https://github.com/user-attachments/assets/7570ac30-216a-4f38-8d30-0695ff8ede7e" />


---

## Step 3.5: Observe Global IP Behavior

- Notice the **Global IP**:
  - Does **not** have a region assigned
  - Is available across regions
  <img width="1195" height="331" alt="image" src="https://github.com/user-attachments/assets/ed95d5f7-b46a-4715-ac75-bc1493611f85" />

  

---

## 🖥️ Step 4: Create a VM Instance

1. Navigate to:
<img width="653" height="280" alt="image" src="https://github.com/user-attachments/assets/bfe06b2d-c017-4760-93fb-0e65b40048be" />


2. Click **Create Instance**

3. Configure:
   - **Name**: `instance-1`

4. Go to **Networking Section**:
   - Assign one of your reserved **External IPs**
   - Set **Primary Internal IPv4 Address** to:
     - `Ephemeral (Automatic)`
<img width="592" height="88" alt="image" src="https://github.com/user-attachments/assets/5a629884-ff96-48e7-bbcf-6653e6f50c4d" />
<img width="952" height="503" alt="image" src="https://github.com/user-attachments/assets/45f7628c-742b-4cdc-842f-cd8961250caa" />
<img width="683" height="548" alt="image" src="https://github.com/user-attachments/assets/e1717847-8f60-47b9-ab1f-81a4e4e99e47" />
<img width="746" height="243" alt="image" src="https://github.com/user-attachments/assets/7f85a060-77e5-475e-9cff-e3c4c77ec40c" />
<img width="702" height="456" alt="image" src="https://github.com/user-attachments/assets/6bdd1f6f-91c3-4039-a2e9-916d93c50662" />


5. Click **Create**

---

## Step 5: Review & Modify IP Assignment

1. Open your newly created VM
2. Review:
   - Associated **External IP**
   - Assigned **Internal IP**

3. Update configuration:
   - Convert an **Ephemeral IP** → **Static IP**
<img width="1350" height="355" alt="image" src="https://github.com/user-attachments/assets/3173e886-54b6-4994-99f0-402d232aae6d" />

<img width="1471" height="412" alt="image" src="https://github.com/user-attachments/assets/4ac8424f-25f9-4c25-9e76-722b7158480b" />

<img width="403" height="377" alt="image" src="https://github.com/user-attachments/assets/982707f5-fa17-4b4c-80d3-9381c436c120" />  

<img width="1292" height="437" alt="image" src="https://github.com/user-attachments/assets/e1ad0f00-a2f0-43f6-af54-d816b1e1625a" />  

<img width="596" height="306" alt="image" src="https://github.com/user-attachments/assets/e9f4b955-d78b-440b-b09f-f0523910e483" />  

<img width="427" height="68" alt="image" src="https://github.com/user-attachments/assets/e6c3944a-5712-449a-ba76-a3f01c4ab508" />  

<img width="482" height="362" alt="image" src="https://github.com/user-attachments/assets/a51a07a3-60d9-4268-a0d9-0008cdd1171a" /> 

<img width="1193" height="580" alt="image" src="https://github.com/user-attachments/assets/11ad13c4-3fc5-4959-89a7-7f6a92db2c6b" />  



---

## Key Takeaways

- **Regional IPs** are tied to a specific region
- **Global IPs** are region-independent
- **Ephemeral IPs** are temporary and can change
- **Static IPs** persist and are manually reserved

---

## Pro Tips

- Always use a **consistent naming convention** (e.g., `env-service-type`)
- Reserve static IPs **before** production deployment
- Avoid unnecessary global IP usage unless required




