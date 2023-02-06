#if [ -z "$(ls -A /home/vagrant/.ssh)" ]; then

#   sudo mkdir -p /home/vagrant/.ssh
#   sudo touch /home/vagrant/.ssh/known_hosts
#   sudo chmod 700 /home/vagrant/.ssh

#fi

# add web/database hosts to known_hosts (IP is defined in Vagrantfile)
#sudo ssh-keyscan -H 192.168.153.48 >> /home/vagrant/.ssh/known_hosts
#sudo ssh-keyscan -H 192.168.153.49 >> /home/vagrant/.ssh/known_hosts
#sudo ssh-keyscan -H 192.168.153.78 >> /home/vagrant/.ssh/known_hosts
#sudo chown vagrant:vagrant /home/vagrant/.ssh/known_hosts

# reload ssh in order to load the known hosts
#/etc/init.d/ssh reload

# Activate Password Authentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# Activate PermitRootLogin
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config  
#Uncomment PermitRootLogin 
sudo sed '/PermitRootLogin yes/s/^#//' -i /etc/ssh/sshd_config 
# Restart SSH    
sudo systemctl restart sshd.service
sudo service ssh restart