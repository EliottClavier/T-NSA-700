#!/bin/bash

if [ "$VM_NAME" == "vm1" ]; then

# Update the package index
sudo apt-get update

# Install required packages
sudo apt-get install --yes curl

# Download GitLab Runner
sudo curl -L --output /usr/local/bin/gitlab-runner "https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64"

# Set permissions
sudo chmod +x /usr/local/bin/gitlab-runner

# Create GitLab Runner user
sudo useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install and run as service
sudo gitlab-runner install --user=gitlab-runner --working-directory=/home/gitlab-runner

# Register GitLab Runner
sudo gitlab-runner register \
  --url "PROJECT_GITLAB_SERVER_URL" \
  --registration-token "PROJECT_REGISTRATION_TOKEN" \
  --non-interactive \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --description "deployment-runner" \
  --maintenance-note "Deployment runner" \
  --tag-list "ansible" \
  --run-untagged="false"

# Start GitLab Runner
sudo gitlab-runner start

fi