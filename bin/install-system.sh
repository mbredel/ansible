#!/bin/bash

##
## This 'tool' uses Ansible to install
## my laptop from scratch. To this end
## it installs all the software and
## Debian/Ubuntu packages I am using.
## Moreover, it provides the configuration
## like for my Wifi connections, printers,
## and other stuff I collected over
## the years.
##
## To run the script, just download and
## execute it locally. If needed it
## first installs the necessary tools,
## i.e. Git and Ansible, before it
## actually sets up the system.
##
## The script has to be executed with
## sudo rights.
##

#
# Some variables used in this script.
#
GITHUB="https://github.com/mbredel/ansible.git"
ROLE="ansible-client"
ANSIBLE_TMP_DIR="/tmp/ansible"
INVENTORY_FILE="${ANSIBLE_TMP_DIR}/ansible.host"
PLAYBOOK="${ANSIBLE_TMP_DIR}/any-role.yml"
INSTALL_CMD="apt-get -q -y install"
GIT_CMD="git"

#
# If Git is not installed yet, install
# a Git client.
#
if ! [ -x "$(command -v git)" ]; then
  echo "Installing Git ..."
  ${INSTALL_CMD} git
fi

#
# If Ansible ist not installed yet,
# installed Ansible.
#
if ! [ -x "$(command -v ansible)" ]; then
  echo "Installing Ansible ..."
  ${INSTALL_CMD} ansible
fi

#
# Download the Ansible playbooks
# and roles needed for this setup
# from GitHub.
#
rm -rf ${ANSIBLE_TMP_DIR}
mkdir -p ${ANSIBLE_TMP_DIR}
git clone ${GITHUB} ${ANSIBLE_TMP_DIR}

#
# Create the temporary inventory file.
# The inventory file is used by
# Ansible to get to know the hosts
# it operates on. In our case, this
# is just the local host.
#
echo "[localhost]" > ${INVENTORY_FILE}
echo "127.0.0.1"  >> ${INVENTORY_FILE}

#
# Execute the command.
#
#ansible-playbook -k -K -i ${INVENTORY_FILE} ${PLAYBOOK} -e "ROLE=${ROLE}" -e "TARGETIP=127.0.0.1"

#
# Remove the temporary Ansible directory. 
#
rm -rf ${ANSIBLE_TMP_DIR}
