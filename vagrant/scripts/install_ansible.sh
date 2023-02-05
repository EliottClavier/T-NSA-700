# Install dependencies
sudo apt-get update
sudo apt-get install --yes software-properties-common

# Add Ansible repository
sudo apt-add-repository --yes ppa:ansible/ansible

# Update package list and install Ansible
sudo apt-get update
sudo apt-get install --yes ansible

