
# Activate Password Authentication
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
# Activate PermitRootLogin
sudo sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config  
#Uncomment PermitRootLogin 
sudo sed '/PermitRootLogin yes/s/^#//' -i /etc/ssh/sshd_config 
# Restart SSH    
sudo systemctl restart sshd.service
sudo service ssh restart