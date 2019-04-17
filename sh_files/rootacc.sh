#!/bin/bash
/usr/bin/rsync "$@"
result=$?
(
    grep -rl 'MasterIp' /tmp/sync/var/cpanel/root.accts | xargs sed -i 's/MasterIp/SlaveIp/g';
) >/dev/null 2>/dev/null </dev/null

exit $result
