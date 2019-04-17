#!/bin/bash
/usr/bin/rsync "$@"
result=$?
(
    grep -rl 'MasterIp' /tmp/sync/etc/wwwacct.conf | xargs sed -i 's/MasterIp/SlaveIp/g';
    grep -rl 'MasterIp' /tmp/sync/etc/userdatadomains | xargs sed -i 's/MasterIp/SlaveIp/g';
    grep -rl 'MasterIp' /tmp/sync/etc/hosts | xargs sed -i 's/MasterIp/SlaveIp/g';
    grep -rl 'MasterIp' /tmp/sync/etc/ips.dnsmaster | xargs sed -i 's/MasterIp/SlaveIp/g';
    grep -rl 'MasterIp' /tmp/sync/etc/userdatadomains.json | xargs sed -i 's/MasterIp/SlaveIp/g';
) >/dev/null 2>/dev/null </dev/null

exit $result
