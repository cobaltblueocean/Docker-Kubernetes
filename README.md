# Docker-Kubernetes

To install this solution, please follow the steps stated below.

1. Create a couple of Ubuntu Virtual Machine on VMWare Workstation (if you don't have them)

2. Make sure the names will be unique, such as masterNode, workNode1, workNode2, ...

3. Install Docker for each Ubuntu VM using docker-install.sh

4. Then, install Kubernetes using kubernetes-install.sh
   This script will also install flannel to give a virtual network subnet.
   * Before execute this script, need to update the IPAddress, token and hash)

6. build Docker image using Dockerfile in this solution.

$ docker build -t hello-world


7. execute deployment file (alpine-deploy.yaml)

$ kubectl create -f alpine-deploy.yaml

8. execute service file (apline-service.yaml)

$ kubectl create -f alpine-service.yaml


9. when complete this process, from other machie can access masterNode IP address and port to run the web app result.

To enhance the maxmize availability, add workNodes to the node cluster, and setup load balancer to enable this command.

$ sudo kubeadm init --control-panel-endpoint "LOAD_BALANCER_DNS:LOAD_BALANCER_PORT" --upload-certs

For the security, write a security-cotext.yaml to enable user/group level access control.
For logging and operation, we also can use Dashboard.

also, we can see the log using this command.
$ kubectl logs
 
