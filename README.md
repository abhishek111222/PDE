# PDE
This repository is for the practice of Professional Data Engineering concept via Terraform

gcp/
├── dataproc-composer/
│   ├── enable_apis.sh
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── provider.tf     
    └── sa.json       # Credentials file



Steps:
1. Install gcloud and enable APIs with command chmod +x enable_apis.sh and ./enable_apis.sh 
2. Create terraform files.
3. Create SA with relevant roles to peform composer related task.
4. Create a VPC and subnet
5. Create a composer environment and provide roles to the tf SA used for all the operations. 




//After the 5th step, the composer environment got created but the quota of CPU becaume 22 out of 24. The composer takes a lot of CPU. 
















