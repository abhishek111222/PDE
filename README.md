# PDE
This repository is for the practice of Professional Data Engineering concept via Terraform




Steps:
1. Install gcloud and enable APIs







1. Install gcloud and enable libraries
        gcloud auth login    // This is used to authenticate google cloud SDK with the google account. This stores the credentials locally on the machine. 
        gcloud config configurations list
        gcloud config configurations create  


        CREATE enable_apis.sh and use gcloud services enable command
        Make the script executable: chmod +x enable_apis.sh   //chmod - change mode, This is an option to add the execute (x) permission to the file.
                                                              // This means that the file can be executed as a program/script. 

        ./enable_apis.sh         //When we run this command, the script calls 'gcloud servies enable ...' and these commands will automatically apply to the                      //project we have set with 'gcloud config set project PROJECT_ID'






