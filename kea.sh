#!/bin/bash

set -e

if [ ! -z "$GITREPO_ETC" ]; then
    cd /tmp/

    if [ -d /tmp/kea_git_config ]; then
	rm -rf /tmp/kea_git_config/
    fi
    
    git clone $GITREPO_ETC /tmp/kea_git_config
	
    if [ -f "/tmp/kea_git_config/kea-dhcp4.conf" ]; then	
	cp /tmp/kea_git_config/kea-dhcp4.conf /etc/kea/kea-dhcp4.conf
    fi
fi

kea-dhcp4
