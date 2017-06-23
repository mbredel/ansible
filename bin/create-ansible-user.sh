#!/bin/bash

##
## Create an ansible-user at the remote host, add
## the user to the sudo group, and create a sudoers
## entry that allows the ansible-user to execute
## commands as root without beeing ask for a password.
## Moreover, put the current user's public ssh-key
## into the ~/.ssh/authorized_keys file.
##

ROLE=ansible-client
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
