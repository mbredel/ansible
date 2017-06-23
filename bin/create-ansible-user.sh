#!/bin/bash

ROLE=ansible-client
INVENTORY_FILE=./ansible.host
PLAYBOOK=./any-role.yml

#
# Check the input parameters.
#
if [ -z "$1" ] || [ $# -ne 1 ]
  then
    echo "Usage: create-ansible-user [IP-ADDRESS]";
    exit 0;
fi

#
# Execute the command.
#
ansible-playbook --become --ask-become-pass --ask-pass -i $1, ${PLAYBOOK} -e "ROLE=${ROLE}" -e "TARGETIP=$1"
