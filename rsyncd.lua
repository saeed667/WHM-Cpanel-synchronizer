settings {
 logfile = "/var/log/lsyncd.log",
 statusFile = "/var/log/lsyncd-status.log",
 insist = true
}
sync{
 default.rsyncssh,
 delete = true,
 source="/home",
 host="SlaveIp",
 targetdir="/home",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 30,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/etc/proftpd",
 host="SlaveIp",
 targetdir="/etc/proftpd",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 3,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/etc/valiases",
 host="SlaveIp",
 targetdir="/etc/valiases",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 4,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/var/cpanel/ssl/apache_tls",
 host="SlaveIp",
 targetdir="/var/cpanel/ssl/apache_tls",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 2,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/etc/vfilters",
 host="SlaveIp",
 targetdir="/etc/vfilters",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 1,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/var/cpanel/packages",
 host="SlaveIp",
 targetdir="/var/cpanel/packages",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 1,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsync,
 delete = false,
 source="/var/cpanel/configs.cache",
 target="/tmp/sync/var/cpanel/configs.cache",
 rsync = {
  binary = "/bin/confcache.sh",
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 10,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/cpanel/configs.cache",
 host="SlaveIp",
 targetdir="/var/cpanel/configs.cache",
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 5,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsync,
 delete = false,
 source="/var/cpanel",
 target="/tmp/sync/var/cpanel",
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=root.accts",
   "--include=repquota.datastore",
   "--exclude=*",
  },
 },
 delay = 12,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/cpanel",
 host="SlaveIp",
 targetdir="/var/cpanel",
 rsync = {
  binary = "/bin/rootacc.sh",
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=root.accts",
   "--include=repquota.datastore",
   "--exclude=*",
  },
 },
 delay = 2,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/var/cpanel/databases",
 host="SlaveIp",
 targetdir="/var/cpanel/databases",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 14,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/var/spool/cron",
 host="SlaveIp",
 targetdir="/var/spool/cron",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 30,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsyncssh,
 delete = true,
 source="/var/cpanel/bandwidth",
 host="SlaveIp",
 targetdir="/var/cpanel/bandwidth",
 exclude = { '.tmp*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 40,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
sync{
 default.rsync,
 delete = false,
 source="/etc",
 target="/tmp/sync/etc",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  binary = "/bin/handler-etc.sh",
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=secondarymx",
   "--include=domainalias",
   "--include=valiases",
   "--include=vfilters",
   "--include=exim*",
   "--include=proftpd",
   "--include=pure-ftpd*",
   "--include=passwd*",
   "--include=group*",
   "--include=*domain*",
   "--include=*named*",
   "--include=wwwacct.conf",
   "--include=cpupdate.conf",
   "--include=quota.conf",
   "--include=shadow*",
   "--include=email_send_limits",
   "--include=*rndc*",
   "--include=ips*",
   "--include=ipaddrpool*",
   "--include=ssl",
   "--include=hosts",
   "--include=my.cnf",
   "--include=csf",
   "--include=cxs",
   "--include=ssh",
   "--include=hosts.*",
   "--exclude=*"
  },
 },
 delay = 5,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/etc",
 host="SlaveIp",
 targetdir="/etc",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=secondarymx",
   "--include=domainalias",
   "--include=valiases",
   "--include=vfilters",
   "--include=exim*",
   "--include=proftpd",
   "--include=pure-ftpd*",
   "--include=passwd*",
   "--include=group*",
   "--include=*domain*",
   "--include=*named*",
   "--include=wwwacct.conf",
   "--include=cpupdate.conf",
   "--include=quota.conf",
   "--include=shadow*",
   "--include=email_send_limits",
   "--include=*rndc*",
   "--include=ips*",
   "--include=ipaddrpool*",
   "--include=ssl",
   "--include=hosts",
   "--include=my.cnf",
   "--include=csf",
   "--include=cxs",
   "--include=ssh",
   "--include=hosts.*",
   "--exclude=*"
  },
 },
 delay = 10,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
-------------------------------------------------- 
sync{
 default.rsync,
 delete = false,
 source="/etc/apache2/conf",
 target="/tmp/sync/etc/apache2/conf",
 rsync = {
  binary = "/bin/conf.sh",
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=httpd.conf",
   "--include=httpd.conf.datastore",
   "--exclude=*",
  },
 },
 delay = 5,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/etc/apache2/conf",
 host="SlaveIp",
 targetdir="/etc/apache2/conf",
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {
   "--include=httpd.conf",
   "--include=httpd.conf.datastore",
   "--exclude=*",
  },
 },
 delay = 2,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
--------------------------------------------------  
sync{
 default.rsync,
 delete = false,
 source="/etc/cpanel/ea4/profiles/cpanel",
 target="/tmp/sync/etc/cpanel/ea4/profiles/cpanel",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 2,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/etc/cpanel/ea4/profiles/cpanel",
 host="SlaveIp",
 targetdir="/etc/cpanel/ea4/profiles/cpanel",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 30,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
-------------------------------------------------- 
sync{
 default.rsync,
 delete = false,
 source="/usr/local/cpanel/3rdparty/mailman",
 target="/tmp/sync/usr/local/cpanel/3rdparty/mailman",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 35,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/usr/local/cpanel/3rdparty/mailman",
 host="SlaveIp",
 targetdir="/usr/local/cpanel/3rdparty/mailman",
 exclude = { '*.lock' , '*.log' , '*.cache' , '*_log' , '*.lock*' , '*sessions*' },
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 40,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
-------------------------------------------------- 
sync{
 default.rsync,
 delete = false,
 source="/var/named",
 target="/tmp/sync/var/named",
 exclude = { 'cache' },
 rsync = {
  binary = "/bin/handler-named.sh",
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 5,
 maxProcesses = 1
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/named",
 exclude = { 'cache' },
 host="SlaveIp",
 targetdir="/var/named",
 rsync = {
  archive = true,
  perms = true,
  owner = true,
  update = true,
  whole_file = true,
  _extra = {"-a"},
 },
 delay = 10,
 maxProcesses = 1,
 ssh = {
  port = SlavePort
 }
}
------------------------------------------------
sync{
 default.rsync,
 delete = false,
 source="/var/cpanel/users",
 target="/tmp/sync/var/cpanel/users",
 rsync = {
 binary = "/bin/handler-varuser.sh",
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 5,
 maxProcesses = 1
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/cpanel/users",
 host="SlaveIp",
 targetdir="/var/cpanel/users",
 rsync = {
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 10,
 maxProcesses = 1,
 ssh = {
 port = SlavePort
 }
}
--------------------------------------------
sync{
 default.rsync,
 delete = false,
 source="/var/cpanel/userdata",
 target="/tmp/sync/var/cpanel/userdata",
 exclude = { '*sed*' }, 
 rsync = {
 binary = "/bin/handler-userdata.sh",
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 5,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/cpanel/userdata",
 host="SlaveIp",
 targetdir="/var/cpanel/userdata",
 exclude = { '*sed*' }, 
 rsync = {
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 10,
 maxProcesses = 1,
 ssh = {
 port = SlavePort
 }
}
----------------------------------------------
sync{
 default.rsync,
 delete = false,
 source="/var/cpanel/conf/apache",
 target="/tmp/sync/var/cpanel/conf/apache",
 exclude = { '.*' },
 rsync = {
 binary = "/bin/handler-confapache.sh",
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 5,
 maxProcesses = 1,
}
sync{
 default.rsyncssh,
 delete = false,
 source="/tmp/sync/var/cpanel/conf/apache",
 host="SlaveIp",
 targetdir="/var/cpanel/conf/apache",
 exclude = { '.*' },
 rsync = {
 archive = true,
 perms = true,
 owner = true,
 update = true,
 whole_file = true,
 _extra = {"-a"},
 },
 delay = 10,
 maxProcesses = 1,
 ssh = {
 port = SlavePort
 }
}
