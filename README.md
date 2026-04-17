# Class7.5 Systems Engineering & Identity Responsibility (SEIR-I) Homework by Larvarious C. McDonald aka Loki Stormbringer

**Weekly Directory**

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

<img width="225" height="225" alt="images (1)" src="https://github.com/user-attachments/assets/2fada686-e531-4450-918f-d6607e7b935e" />



## Week 5

## Reading, Videos, and Labs

**GCP**:
Professional Cloud Architect Prep Book (megafile) == Chapters 1-4 & Chapter 8
GCP Terraform Book (megafile) = Chapters 1 & 2\
GCP Masterclass (Udemy) == Videos & Labs #19 - 43 (sections 5 & 6)


**Linux**:
Linux Command Line (megafile) == chapters 1-4
Linux Fundamentals (killercoda.com) == Lessons 1-8 ✅

### Lesson 1



<img width="600" height="600" alt="01-lesson1-listfiles" src="https://github.com/user-attachments/assets/92633b6f-48d1-44f1-8a9b-83f4cc48251e" />

<img width="600" height="600" alt="01 2-lesson1-listfiles-getmoreinfo" src="https://github.com/user-attachments/assets/32cf4e7f-99ea-48b8-9e0e-d9d08443cb21" />

<img width="600" height="600" alt="02-lesson1-listallfiles" src="https://github.com/user-attachments/assets/2df55479-71e9-4458-a719-84d1c5d8d453" />

<img width="600" height="600" alt="03-lesson1-sortingfiles1" src="https://github.com/user-attachments/assets/1a70fe87-6db6-4382-a9be-e154731bcd49" />

<img width="600" height="600" alt="03-lesson1-sortingfiles2" src="https://github.com/user-attachments/assets/950ec665-0fec-43fe-8087-6d36def8d56f" />

<img width="600" height="600" alt="03-lesson1-sortingfiles3" src="https://github.com/user-attachments/assets/3eda1725-b73c-4e3e-81c1-6866fd70ac49" />

<img width="600" height="600" alt="04-lesson1-sortingfilebysize1" src="https://github.com/user-attachments/assets/c2617f17-26e3-4cc9-b518-a03625c3ba0d" />

<img width="600" height="600" alt="05-lesson1-formatting" src="https://github.com/user-attachments/assets/42e397d9-83e5-4cf2-bfc7-401f678d5928" />

<img width="600" height="600" alt="06-lesson1-otherlsoptionsandhelp" src="https://github.com/user-attachments/assets/d6f7c5a8-9b79-463e-8b69-42d113674f7a" />

<img width="600" height="600" alt="06-lesson1-otherlsoptionsandhelp2" src="https://github.com/user-attachments/assets/08c39064-c818-4875-9f2e-d74eacf3a5a2" />

<img width="600" height="600" alt="06-lesson1-otherlsoptionsandhelp3" src="https://github.com/user-attachments/assets/02242a74-4d88-46d1-8b56-657c277b16b3" />

<img width="600" height="600" alt="06-lesson1-otherlsoptionsandhelp4" src="https://github.com/user-attachments/assets/3a92fb5e-f179-4c28-98ee-8ae40d754837" />



### Lesson 1 Quiz

<img width="600" height="600" alt="lesson1quiz" src="https://github.com/user-attachments/assets/f36d2d77-c81f-4c46-b521-a8224d0f5c9c" />

<img width="600" height="600" alt="lesson1quiz2" src="https://github.com/user-attachments/assets/c37e11ea-c522-4564-92d0-7c2085ef30df" />

<img width="600" height="600" alt="lesson1quiz3" src="https://github.com/user-attachments/assets/673570a0-b318-4a18-816c-34f11c782d29" />

### Lesson 2

<img width="600" height="600" alt="02-lesson2-mancommand" src="https://github.com/user-attachments/assets/575447aa-ed0d-42d0-9c3a-ddd701f1d6cd" />

<img width="600" height="600" alt="02-lesson2-manintro" src="https://github.com/user-attachments/assets/10ba35d8-7a5a-44b6-8345-09be1142c51e" />

### Lesson 3

<img width="600" height="600" alt="03-lesson3-createdirectories" src="https://github.com/user-attachments/assets/1fe7d799-8634-4caa-a723-c7fcf4329c87" />

<img width="600" height="600" alt="03-lesson3-createdirectories2" src="https://github.com/user-attachments/assets/f5f4298d-354f-42c4-b006-8d6544a79922" />

<img width="600" height="600" alt="03-lesson3-navigatingdirectories" src="https://github.com/user-attachments/assets/cc323605-0da6-48ba-a5ec-c5249057f58b" />

<img width="600" height="600" alt="03-lesson3-navigatingdirectories2" src="https://github.com/user-attachments/assets/be4d54a5-0a54-4bf2-b5d1-d1fc04d07959" />

<img width="600" height="600" alt="03-lesson3-navigatingtorootdirectory" src="https://github.com/user-attachments/assets/b0afd77f-d2d6-4b07-8ff6-69801379d12c" />

<img width="600" height="600" alt="03-lesson3-deletingdirectories" src="https://github.com/user-attachments/assets/52b9e09a-fbf7-4d3d-b91c-907b1cd60168" />

### Lesson 3 Quiz

<img width="600" height="600" alt="lesson3quiz" src="https://github.com/user-attachments/assets/4eca6e60-1091-4906-b8db-809165bf0c32" />

<img width="600" height="600" alt="lesson3quiz1" src="https://github.com/user-attachments/assets/bc1e17a5-419b-42cb-89a1-6d64a9e6f70b" />

<img width="600" height="600" alt="lesson3quiz2" src="https://github.com/user-attachments/assets/1782c8c7-3746-4f67-bcab-7e8a9bd54550" />

### Lesson 4

<img width="600" height="600" alt="04-lesson4-creatingfiles" src="https://github.com/user-attachments/assets/49db88d0-b7fc-4ff5-81da-5375beace3d1" />

<img width="600" height="600" alt="04-lesson4-deletingfiles" src="https://github.com/user-attachments/assets/d4089857-fa61-41af-b7eb-69df8bee9a61" />

<img width="600" height="600" alt="04-lesson4-vimcreatefile" src="https://github.com/user-attachments/assets/84204702-db6f-4dde-844a-3e7f35e3248e" />

### Lesson 5

<img width="600" height="600" alt="05-lesson5-pipes" src="https://github.com/user-attachments/assets/db92eb59-f624-4e1d-bc39-4d3f709915bf" />

<img width="600" height="600" alt="05-lesson5-pipes-redirectfiles" src="https://github.com/user-attachments/assets/6f5dc4ca-e263-4a38-b82e-abe67fcedcab" />

<img width="600" height="600" alt="05-lesson5-pipes-inputredirection" src="https://github.com/user-attachments/assets/123e97f4-8e5d-4c60-8132-3278de7d246b" />

### Lesson 5 Quiz

<img width="600" height="600" alt="lesson5quiz" src="https://github.com/user-attachments/assets/fe7c796a-d91e-467d-ae5b-b017569082e4" />

<img width="600" height="600" alt="lesson5quiz2" src="https://github.com/user-attachments/assets/c1f4e9be-7e8f-432e-b4a0-992d4c84201a" />

<img width="600" height="600" alt="lesson5quiz3" src="https://github.com/user-attachments/assets/c6820f21-396f-43ca-bdbd-4f5572efc22e" />

### Lesson 6

<img width="600" height="600" alt="06-lesson6-catandvim" src="https://github.com/user-attachments/assets/2b618ea8-3478-40c5-8790-1d1dd75bb0a8" />

<img width="600" height="600" alt="06-lesson6-readlessandmore" src="https://github.com/user-attachments/assets/9031d105-5fb6-48a9-8a9b-3631179f2ba5" />

<img width="600" height="600" alt="06-lesson6-printpartfile" src="https://github.com/user-attachments/assets/83c923d2-c005-41e8-94a2-29ed99b975bf" />

<img width="600" height="600" alt="06-lesson6-printpartfile2" src="https://github.com/user-attachments/assets/0388ac24-5359-40c3-ae0c-8165ab10ab7a" />

### Lesson 6 Quiz

<img width="600" height="600" alt="lesson6quiz" src="https://github.com/user-attachments/assets/6a49f3ea-69b8-40d5-80e1-c7ba6d4c4093" />

<img width="600" height="600" alt="lesson6quiz2" src="https://github.com/user-attachments/assets/faa0f8f0-096b-4e3c-8c07-cf530f6cd958" />

### Lesson 7

<img width="600" height="600" alt="07-lesson7-copyandmovefiles" src="https://github.com/user-attachments/assets/a68872cd-ceb6-400d-a8a7-d52d92f23dfb" />

<img width="600" height="600" alt="07-lesson7-copyandmovefiles2" src="https://github.com/user-attachments/assets/1f8850bf-ce01-4e1c-b8ab-42958a280bc9" />

<img width="600" height="600" alt="07-lesson7-copyandmovefiles3" src="https://github.com/user-attachments/assets/5e24f85b-e213-4b31-b9df-666945248eba" />

<img width="600" height="600" alt="07-lesson7-copyandmovefiles4" src="https://github.com/user-attachments/assets/425df99b-6497-4c3b-a01a-1c88568ba3c1" />

<img width="600" height="600" alt="07-lesson7-copyandmovefiles5" src="https://github.com/user-attachments/assets/c60b3f4d-f41a-489b-9342-0a4e0c21faf1" />

<img width="600" height="600" alt="07-lesson7-copyandmovefiles6" src="https://github.com/user-attachments/assets/ff17980b-32e2-459e-997e-4dcdb165616a" />

### Lesson 8

<img width="600" height="600" alt="08-lesson8-topcommand" src="https://github.com/user-attachments/assets/cafaad44-d128-4e47-bd5c-c0dcf6fa4616" />

<img width="600" height="600" alt="08-lesson8-modifydefaultview" src="https://github.com/user-attachments/assets/8025ed9a-60f7-4d13-b574-a5483de12fba" />



**Git**:
Learning Git (megafile) == Chapters 1-3
Git Fundamentals (killercoda.com) = Lessons 1-4 ✅

### Lesson 1

<img width="600" height="600" alt="01-lesson1-checkpackages" src="https://github.com/user-attachments/assets/58676692-3c4d-4cfb-a0e9-16fe9a07bdf8" />

<img width="600" height="600" alt="01-lesson1-installgit" src="https://github.com/user-attachments/assets/9dc52498-6b1f-4a43-9fe6-a6e37cad095b" />

<img width="600" height="600" alt="01-lesson1-isgitinstalled" src="https://github.com/user-attachments/assets/aadddc74-a06f-43c3-8fdd-21f236c589aa" />

### Lesson 2

<img width="600" height="600" alt="01-lesson2-configuregit" src="https://github.com/user-attachments/assets/1f0f6452-3775-43a5-882e-179b1ddd2594" />

<img width="600" height="600" alt="01-lesson2-gitdirectorystructure" src="https://github.com/user-attachments/assets/2f13e5c0-bff9-4b49-a19e-2f34ffa3eb45" />

<img width="600" height="600" alt="01-lesson2-gitconfigexamples" src="https://github.com/user-attachments/assets/6cb1b5be-f73d-452b-b8e9-af3726370766" />

### Lesson 3

<img width="600" height="600" alt="01-lesson3-initializerepo" src="https://github.com/user-attachments/assets/f7f169cd-4abd-4055-95e1-ac58a7d8a913" />

<img width="600" height="600" alt="01-lesson3-repostatus" src="https://github.com/user-attachments/assets/75fadf5e-5b76-4910-a5aa-16460b00c1e5" />

<img width="600" height="600" alt="01-lesson3-addfiles" src="https://github.com/user-attachments/assets/fe83e3ed-f079-4cbe-9f1b-5bbd99c4d42c" />

<img width="600" height="600" alt="01-lesson3-commitfiles" src="https://github.com/user-attachments/assets/a263308e-4eef-4597-a524-99502b5fffa7" />

<img width="600" height="600" alt="01-lesson3-addandcommitmultiplefiles" src="https://github.com/user-attachments/assets/ea47fb22-44ae-4423-a64e-463840364955" />

### Lesson 4

<img width="600" height="600" alt="01-lesson4-removefilesfromstage" src="https://github.com/user-attachments/assets/913fc4f3-c58b-4a9a-b8cc-a661fa288aee" />

<img width="600" height="600" alt="01-lesson4-previousstate" src="https://github.com/user-attachments/assets/229738b1-867d-4727-b17c-f8cd8501ced5" />

<img width="600" height="600" alt="01-lesson4-removefilefromcommit" src="https://github.com/user-attachments/assets/bfdff8e6-ecfb-4628-82ba-65c3c9b7f753" />














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



