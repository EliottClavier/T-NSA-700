# If ansible's folder exists, remove it
if [ "$(ls -A /etc/ansible)" ]; then
  sudo rm -rf /etc/ansible
fi

# Copy ansible folder from /tmp/ansible to /etc/
sudo mv /tmp/ansible /etc/