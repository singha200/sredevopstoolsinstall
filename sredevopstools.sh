sudo amazon-linux-extras install epel -y
sudo yum install figlet -y
figlet "Downloading the kubectl binary"
figlet -f.small.slant "kubectl"
echo "Downloading the kubectl binary"
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
echo "verifying the download checksum for kubectl binary"
curl -o kubectl.sha256 https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl.sha256
echo "Apply execute permissions to the binary"
chmod +x ./kubectl
echo "Copying the binary to a folder in your PATH"
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo "Verifying the kubectl installation"
kubectl version --short --client
echo "Kubectl installation complete"
sleep 5
echo "Starting the eksctl installation"
echo "Downloading the eksctl binary"
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
echo "Moving the binary to /usr/local/bin"
sudo mv /tmp/eksctl /usr/local/bin
echo "Verifying the eksctl installation"
eksctl version
echo "eksctl installation complete"
sleep 5
echo "Starting the ansible installation"
sudo yum install ansible -y
echo "ansible installation completed"
sleep 5 
echo "Starting the terraform installation and configuration"
wget https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip
unzip terraform_1.1.2_linux_amd64.zip
sudo mv terraform /usr/local/bin
terraform -install-autocomplete
echo "Testing terraform installation"
terraform -help
echo "Terraform installation completed"
sleep 5
echo "Starting the Helm installation"
wget https://get.helm.sh/helm-v3.7.2-linux-amd64.tar.gz
tar -xvf helm-v3.7.2-linux-amd64.tar.gz
sudo mv linux-amd64/helm /usr/local/bin
echo "Helm installation completed"
