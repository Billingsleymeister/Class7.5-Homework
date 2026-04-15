# Class7.5 SIER-Homework

**Directory of Homework**

[Week 1](https://github.com/Melanated-Cyber-Kings/Class7.5-Homework/blob/Larvarious-McDonald-Homework-Branch-7.5/README.md#week-1)<br/>
[Week 2](https://github.com/Melanated-Cyber-Kings/Class7.5-Homework/blob/Larvarious-McDonald-Homework-Branch-7.5/README.md#week-2)<br/>
[Week 3](https://github.com/Melanated-Cyber-Kings/Class7.5-Homework/blob/Larvarious-McDonald-Homework-Branch-7.5/README.md#week-3)<br/>
[Week 4](https://github.com/Melanated-Cyber-Kings/Class7.5-Homework/blob/Larvarious-McDonald-Homework-Branch-7.5/README.md#week-4)<br/>
[Week 5](https://github.com/Melanated-Cyber-Kings/Class7.5-Homework/blob/Larvarious-McDonald-Homework-Branch-7.5/README.md#week-5)<br/>

## Week 1 

**Installed Choco List on My PC** ✅

<img width="500" height="1000" alt="choco list" src="https://github.com/user-attachments/assets/6270e523-4767-4639-811d-98a3b923f613" />



## Week 2 

<ins>**Deploy a VM instance with supera.sh script and check the success of your deployment with the “gate” script given**</ins>

Script Result Proof<br/>

<img width="800" height="800" alt="Script Result Proof" src="https://github.com/user-attachments/assets/4076063c-9c94-45d6-8049-8ffd212efe66" />


Virtual Machine Creation Proof<br/>

<img width="800" height="800" alt="VM Proof" src="https://github.com/user-attachments/assets/8a1d68b4-0406-4f0f-83b1-6838c07197fd" />

badge.txt<br/>

<img width="500" height="500" alt="badge txt" src="https://github.com/user-attachments/assets/3d5db433-572c-4eac-b226-a64c1876df72" />

[gate_gcp_vm_http_ok.sh ](week1/gate_gcp_vm_http_ok.sh)

[gate_result.json](week1/gate_result.json)



## Week 3

### "Udemy GCP MasterClass: Section 10"

**LAB: VPC IPs Distribution**

I've created two external static IP addresses, one is regional and the other is a global static IP address.<br/>

<img width="600" height="600" alt="01-externalstaticips" src="https://github.com/user-attachments/assets/66c96162-11ce-42a5-9d72-94a0e2dc0548" />

In this diagram, I've created three VM instances. One has no external IP address, one has an external IP address, and the third one has a static IP address assigned to it.

<img width="600" height="600" alt="02-staticipsassignedtovm" src="https://github.com/user-attachments/assets/6a6aa09c-0599-443b-a539-128f2896a361" />


**LAB: Network Firewalls in GCP**

I created a VPC named "demo-vpc", with three custom subents in us-central1(Iowa).<br/>

<img width="600" height="600" alt="03-vpcnetworkwithsubnets" src="https://github.com/user-attachments/assets/57af38ae-a8c1-4280-b047-168a70a746a6" />

After creating the "demo-vpc", I tried to SSH into the myinstance-webserver and it was unsuccessful, because the firewall in my VPC is blocking SSH by default. So, I have to manually create a firewall rule that allows SSH (Port 22) into my VM instances.

<img width="600" height="600" alt="04 5 unabletosshtovminstance" src="https://github.com/user-attachments/assets/981a946a-3169-4983-a5fe-280807240447" />

In the VPC Network Tab, I created a firewall rule named "demo-vpc-ssh". I chose my VPC network "demo-vpc", and I chose the Target as "Specified Target Tags".<br/>

<img width="600" height="600" alt="05-createfirewallrule" src="https://github.com/user-attachments/assets/7d35c254-2c89-454f-85b7-b0baa6c756cc" />

Under specified ports and protocols, I chose TCP with a port of 22, and the other protocol of ICMP. 

<img width="600" height="600" alt="06 5-otherfirewallprotocols" src="https://github.com/user-attachments/assets/78f2671b-199b-4ad8-a5c0-272cf9c06c5c" />

After I created the network firewall rule, I went back to my VM Instances and edited the networking section, and added the appropriate network tags so that I could SSH into each of them.<br/>

**myinstance-db**

<img width="600" height="600" alt="07-editvminstancewithfirewalltags" src="https://github.com/user-attachments/assets/cc604582-b678-47fd-aebb-ed817968c1e4" />

**myinstance-service**

<img width="600" height="600" alt="08-editvminstancewithfirewalltags2" src="https://github.com/user-attachments/assets/f58c5060-8282-4c50-9a80-de7326cc6947" />

**myinstance-webserver**

<img width="600" height="600" alt="09-editvminstancewithfirewalltags3" src="https://github.com/user-attachments/assets/e0580571-b084-4bc5-a8b7-ebc81aab8b98" />

Once, I edited the VMs with the correct network tags, I was able to successfully SSH into my VM instances.<br/>

<img width="600" height="600" alt="10-successfulsshvminstance" src="https://github.com/user-attachments/assets/e31c8b74-7e00-451b-9e80-06521a9044d8" />


**LAB: VPC Network in GCP**

**LAB: Cloud VPN & VPN Tunnels**

**LAB: Cloud Routers for Routing in GCP**




### "Udemy GCP Security Engineer: Section 13"

**HANDS-ON: Explore Default VPC**

**HANDS-ON: Create Auto Mode VPC**

**HANDS-ON: Create Custom Mode VPC**

**HANDS-ON: Create Virtual Machine w/ all subnets**

**HANDS-ON: Create Firewall Rule - SSH**

**HANDS-ON: Internal vs External IP Address**

**HANDS-ON: Static vs Ephermeral IP Address**



## Week 4

N/A - Theo gave us time off (Birthday week & Illinois in NCAA Final Four) 🥳🎉

![yoda-star-wars](https://github.com/user-attachments/assets/26820918-e6b0-4927-9ec6-75cba95ed4d6)


![IlliniFan](https://github.com/user-attachments/assets/bfb9a831-9a37-4d93-b7e0-944df19448be)


## Week 5

## Reading, Videos, and Labs

**GCP**:
Professional Cloud Architect Prep Book (megafile) == Chapters 1-4 & Chapter 8
GCP Terraform Book (megafile) = Chapters 1 & 2\
GCP Masterclass (Udemy) == Videos & Labs #19 - 43 (sections 5 & 6)


**Linux**:
Linux Command Line (megafile) == chapters 1-4
Linux Fundamentals (killercoda.com) == Lessons 1-8 ✅



**Git**:
Learning Git (megafile) == Chapters 1-3
Git Fundamentals (killercoda.com) = Lessons 1-4 ✅


### "Class Practice"

Re-run the in-class lab from Friday and Saturday’s recordings, taking screenshots along the way. Take a screenshot of every step in the Terraform IVPAD sequence, showing the resulting output of each command. After running terraform destroy, and confirming resources have been torn down in GCP, run the following command within quotation marks in Git Bash for Windows, or Terminal for Mac/Linux: “date && hostename && whoami”


### Deliverables

Screenshots:

**Terraform init**



**Terraform validate**



**Terraform plan**



**Terraform apply**



**Terraform destroy**



**“Date && hostename && whoami”**




### Be A Man Extra Credit:

Using the Terraform files from this week's classes, export what's described when "Terraform plan" is run into a file. Then, create a new folder in Terminal/Git Bash titled "<insertDateHere>_weekB_hw", go into that folder, and move the Terraform Plan output into that folder. Finally, use Git to push the Terraform plan output to GitHub. Your group leader will share/show how to create a GitHub repository. The GitHub repository must start with “TheoU_7.5_BaM_weekB”.


### Deliverables:
Screenshots
Above screenshots
**Terraform Plan output, in a .txt or .json format**


[Student’s GitHub repo link](url)



