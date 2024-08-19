# PDE
This repository is for the practice of Professional Data Engineering concept via Terraform




Practice 1: Composer with dataproc cluster. 
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


Remember to delete the bucket and the disk after the environment is deleted. 
https://cloud.google.com/composer/docs/delete-environments#:~:text=To%20delete%20an%20environment%20using,of%20the%20environment's%20Redis%20queue.




ALERTING TEST    --THIS DID NOT WORK
set alerts for the quota of the CPU to the email address. 
To test the alerts I have set the  CPU quota alerts to 70%. 
This should send an email if the value is over 70% for 1 minute. 






Practice 2: Labels in bigQuery
This was done to testing the labels in bigQuery. 
You have to mention the labels in both the resouce.
The label parameter is non-authoratative, which means that the it will only take care of the labels mentioned in the tf file.
We have a read-only effective-labels, from which you can see all the labels to the tables, even if they are from any other resource or console. 
The tables got created without providing any schema. 







