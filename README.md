# ComfyUI on Google Cloud

<hr>

## Install Guide

### 1. Creating a Linux VM with GPU Support and Authenticating Your Local Machine

- Create a Google Cloud Platform account and activate the compute engine.
- Upgrading to a paid account.
  - Search `billing accounts`.
- Increase GPU quota from 0 to 1 via `IAM & Admin`.
  - Search `GPUs (all regions)` inside the Quotas & System Limits.
- Create an Ubuntu 20.04 VM with T4 GPU and add a TCP firewall rule for port 8188.
  - Name your instance `comfyvm`.
  - Choose zone as `europe-central2-b` or `europe-central2-c`.
  - Add your firewall `port8188` tag in the network section.
- Authenticate using gcloud on your local machine:
    ```
    gcloud init
    ```
  
- Generate new SSH key pairs on your local machine:
    ```
    ssh-keygen -t rsa -b 2048 -C "comfy_vm_key" -f ~/.ssh/comfy_vm_key
    ```
  
- Authenticate the VM with your SSH key pairs and log in from your local machine to the VM:
    ```
    cd ~/.ssh
    gcloud compute os-login ssh-keys add --key-file=comfy_vm_key.pub
    gcloud compute ssh comfyvm --zone europe-central2-b
    ```

### 2.Setting up ComfyUI Server

- Log in to the VM:
    ```
    gcloud compute ssh comfyvm --zone europe-central2-b
    ```
  
- Clone the repo for ComfyUI installation scripts and execute them:
    ```
    git clone https://github.com/SaseQ/comfyui-gcloud
    chmod +x ./comfyui-gcloud/src/install.sh
    chmod +x ./comfyui-gcloud/src/virgin_vm.sh
    ```
  
- Install miniconda, ubuntu-drivers and Nvidia T4 GPU drivers:
    ```
    ./comfyui-gcloud/src/virgin_vm.sh
    ```
  
- Wait for the VM to restart, reconnect to the VM, and verify that the drivers have been installed correctly:
    ```
    gcloud compute ssh comfyvm --zone europe-central2-b
    ```
    ```
    sudo nvidia-smi
    ```

- Install ComfyUI, sample models and extensions:
    ```
    source ~/.bashrc 
    ./comfyui-gcloud/src/install.sh
    ```

## Download New Models

- Option 1: You can use ComfyUI Nanager to download them. Just open the Manager and click `install models`.
- Option 2: Find a model you like in CivitAI and download this using wget command:
    ```
    wget "https://civitai.com/api/download/models/134084" --content-disposition -P ./models/checkpoints/
    ```

## Upload New Models/Loras your local machine to the VM
```
gcloud compute scp [path to your local file] comfyvm:~/ComfyUI/models/loras/
```

<hr>
