#! /bin/bash

# Install Java
yum install java-1.8.0-openjdk.x86_64 -y
sudo amazon-linux-extras install java-openjdk11 -y

# Download and Install Jenkins
yum update –y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo
rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key
yum install jenkins -y

# Make sure Jenkins comes up/on when reboot
chkconfig jenkins on

yum install -y git                                                       
mkdir /var/lib/jenkins/.ssh                                              
touch /var/lib/jenkins/.ssh/known_hosts                                  
chown -R jenkins:jenkins /var/lib/jenkins/.ssh                           
chmod 700 /var/lib/jenkins/.ssh                                          
mv /tmp/id_rsa /var/lib/jenkins/.ssh/id_rsa                              
chmod 600 /var/lib/jenkins/.ssh/id_rsa                                   
chown -R jenkins:jenkins /var/lib/jenkins/.ssh/id_rsa                    
 
mkdir -p /var/lib/jenkins/init.groovy.d                                  
mv /tmp/*.groovy /var/lib/jenkins/init.groovy.d/                         
mv /tmp/jenkins /etc/sysconfig/jenkins
chmod +x /tmp/install-plugins.sh 
# Start Jenkins
systemctl start jenkins

# Enable Jenkins with systemctl
systemctl enable jenkins

# Make sure Jenkins comes up/on when reboot
chkconfig jenkins on

yum install -y docker 
usermod -aG docker ec2-user
systemctl enable docker