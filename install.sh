#!/bin/bash
RE='\033[0;31m' ; NC='\033[0m' ; Ye='\033[0;33m' ; Cy='\033[0;36m' ;
sudo -n true ;
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script" ;
ls /etc | grep rsyncd.lua > /dev/null
if [ $? -eq 0 ]
then
        echo -e "${RE}It appears that the script is already installed.${NC}"
		echo -e "${Ye}If you want to reinstall , type ${Cy}"Yes" ${NC}"
        read Answer
        if [ "$Answer" = "Yes" ]
        then
				echo -e "${Ye}Insert your ${Cy}Master ${Ye}server ip address:${NC} "
				read Master ;
				echo -e "${Ye}Insert your ${Cy}Slave ${Ye}server ip address:${NC} "
				read Slave ;
				echo -e "${Ye}Insert your ${Cy}Slave ${Ye}server port number:${NC} "
				read Port ;
                rm -rf /root/sh_files ; rm -f /etc/rsyncd.lua ;
                curl -L http://dl.redhat.bz/whm-sync-master.zip -o lsync.zip ;
                unzip lsync.zip && rm lsync.zip ;
                cd whm-sync-master ;
				grep -rl 'MasterIp' /root/whm-sync-master | xargs sed -i 's/MasterIp/'$Master'/g' ;
				grep -rl 'SlaveIp' /root/whm-sync-master | xargs sed -i 's/SlaveIp/'$Slave'/g' ;
				grep -rl 'SlavePort' /root/whm-sync-master | xargs sed -i 's/SlavePort/'$Port'/g' ;
				cp rsyncd.lua /etc ; 
				cp whmsync.service /etc/systemd/system/ ;
                cp -R /root/whm-sync-master/sh_files /root ; chmod +x /root/sh_files/*.sh ;
                rm -rf /root/whm-sync-master ;
        else
                echo -e "OK , Bye !"
                exit 0 ;
        fi
else	
		echo -e "${Ye}Installing... please wait${Cy} "
		sleep 2 ;
		cd /root ;
		yum update -y ; echo -e "${NC}"
		yum install epel-release -y ; 
		yum install lsyncd -y ;
		echo -e "  " ; echo -e "  " ; echo -e "  " ; echo -e "  " ;
		echo -e "${Ye}Insert your ${Cy}Master ${Ye}server ip address:${NC} "
		read Master ;
		echo -e "${Ye}Insert your ${Cy}Slave ${Ye}server ip address:${NC} "
		read Slave ;
		echo -e "${Ye}Insert your ${Cy}Slave ${Ye}server port number:${NC} "
		read Port ;
		ssh-keygen -t rsa -N "" ;
		ssh-copy-id root@$Slave ; 
		ssh-copy-id root@$Master ;
		grep -l 'fs.inotify.max_user_watches' /etc/sysctl.conf | xargs sed -i 'd/fs.inotify.max_user_watches/';
		echo -e "${Ye}Insert your ${Cy}Server Max file numbers:${NC} "
		read Number ;
		echo fs.inotify.max_user_watches=$Number | sudo tee -a /etc/sysctl.conf ;
		mkdir -p /tmp/sync/etc/
		mkdir -p /tmp/sync/etc/apache2/conf
		mkdir -p /tmp/sync/etc/cpanel/ea4/profiles/cpanel/
		mkdir -p /tmp/sync/usr/local/cpanel/3rdparty/mailman
		mkdir -p /tmp/sync/var/cpanel
		mkdir -p /tmp/sync/usr/local/cpanel
		mkdir -p /tmp/sync/var/named
		mkdir -p /tmp/sync/usr/local/apache/conf
		mkdir -p /tmp/sync/var/cpanel/users
		mkdir -p /tmp/sync/var/cpanel/userdata
		mkdir -p /tmp/sync/var/cpanel/conf/apache
        curl -L http://dl.redhat.bz/whm-sync-master.zip -o lsync.zip ;
        unzip lsync.zip && rm lsync.zip ;
		grep -rl 'MasterIp' /root/whm-sync-master | xargs sed -i 's/MasterIp/'$Master'/g' ;
		grep -rl 'SlaveIp' /root/whm-sync-master | xargs sed -i 's/SlaveIp/'$Slave'/g' ;
		grep -rl 'SlavePort' /root/whm-sync-master | xargs sed -i 's/SlavePort/'$Port'/g' ;
        cd whm-sync-master ; cp rsyncd.lua /etc ; cp whmsync.service /etc/systemd/system/ ;
        cp -R /root/whm-sync-master/sh_files/* /bin ; chmod +x /bin/*.sh ;		
        rm -rf /root/whm-sync-master ;
fi
