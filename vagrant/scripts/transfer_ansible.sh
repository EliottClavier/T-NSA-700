# If ansible's folder exists, remove it
if [ "$(ls -A /etc/ansible)" ]; then
  rm -rf /etc/ansible
fi

# Copy ansible folder from /tmp/ansible to /etc/
mv /tmp/ansible /etc/