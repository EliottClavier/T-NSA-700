#!/bin/bash

# Update the package index
sudo apt-get update

# Uninstall old versions of Docker
sudo apt-get remove --yes docker docker-engine docker.io containerd runc

# Install required packages
sudo apt-get install --yes apt-transport-https ca-certificates curl gnupg-agent software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository --yes "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

# Update package index with Docker repository
sudo apt-get update

# Install Docker CE
sudo apt-get install --yes docker-ce docker-ce-cli containerd.io

# Start and enable Docker service
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl enable docker