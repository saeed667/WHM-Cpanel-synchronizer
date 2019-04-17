# WHM synchronizer 

# Files :
-	Install.sh
-	Bash script files
-	Base rsyncd.lua file 
-	Service file  whmsync.service

# Installation guide :
	We need to use epel-release repository for install lsyncd package .
-	Run Install.sh file with +x chmod permission 
-	Steps :
-	      Cd /root
-	      Wget  file
-	      Unzip file
-	      Execute install.sh file

# Enable and Start :

    systemctl enable whmsync
    systemctl start whmsync
    
# Log files :
	/var/log/lsyncd.log
	/var/log/lsyncd-status.log
	
# Config file :
    /etc/rsyncd.lua

# Readme :
In this script we used lsyncd to synchronize between servers.
By executing the installation file, all the steps are followed and you can enter the main and secondary server information .this script needs to be run on both servers.
With scripts for the change files for different ips , some files are executed, and for this case, some files are temporarily stored on the original server and then transferred to the other server after the IP changes.





