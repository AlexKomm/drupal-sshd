#!/bin/sh

set -eo pipefail

if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -b 1024 -t rsa -N "" -f /etc/ssh/ssh_host_rsa_key -q
fi

if [ -n "$SSH_PUB_KEY" ]; then
	mkdir -p /root/.ssh
	echo "$SSH_PUB_KEY" > /root/.ssh/authorized_keys
	chmod 0700 -R /root/.ssh
fi

exec /usr/sbin/sshd -De
