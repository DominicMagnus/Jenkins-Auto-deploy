#!/bin/bash
# Update packages
sudo apt update
sudo apt upgrade -y

# Install Java Development Kit (JDK)
sudo apt install -y default-jdk

# Add Jenkins repository and import the key
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update packages and install Jenkins
sudo apt update
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Print Jenkins service status
sudo systemctl status jenkins

# Retrieve initial admin password
password=$(sudo cat /var/lib/jenkins/secrets/initialAdminPassword)

# Output the password
echo "Jenkins initial admin password: $password"
