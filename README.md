# Singlenode-Kubernetes-on-Vagrant-VM
 setting up a single-node Kubernetes cluster on a Vagrant VM managed by Terraform


## folder structure
![image](https://github.com/user-attachments/assets/4400417e-6710-4bcd-8980-86d971ca7048)


## Test steps

 Provision the Vagrant VM with Terraform


1. **Navigate to the terraform/ directory, Initialize Terraform, apply config:**
   ```bash
   terraform init
   terraform apply

2. Once the VM is provisioned, Terraform will output the SSH command to connect to the VM.

3. **Verify Kubernetes Installation**
   
   SSH into the VM using the command provided by Terraform:
   
   ```bash
   vagrant ssh k8s-vm

4. **Verify that Kubernetes is running:**
   ```bash
   kubectl get nodes

5. **You should see a single node with status Ready.**


6. **Deploy the "Hello World" Application**
   
   Run the deploy_app.sh script inside the VM:

   ```bash
   /vagrant/scripts/deploy_app.sh

  
7. **Verify the deployment:**
   ```bash
   kubectl get pods
   kubectl get svc

   You should see the hello-world pod running and a service exposing it on port 30007

8. **Access the Application:**

   Open the browser and navigate to:
   ```bash
   http://<VM_IP>:30007
   

10. **Replace <VM_IP> with the IP address of the Vagrant VM.:**

11. **You should see the default Nginx "Welcome" page.**
    

## Expected Output
    A single-node Kubernetes cluster is provisioned on the Vagrant VM.

    The hello-world application is deployed and accessible via the browser.

    Kubernetes resources (nodes, pods, services) are verified using kubectl.

