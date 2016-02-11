## Ansible

### Usage

To run the playbook:

```
  $ ansible-playbook -i ./ansible.host -s -u ansible jdk8.yml


    -i PATH
        The PATH to the inventory hosts file.

    -s
        Run the command as the user given by -u and sudo to root.

    -u USERNAME
        Use this remote USERNAME instead of the current user.o

    -k
        Prompt for the SSH password instead of assuming key-based authentication.

    -K
        Prompt for the password to use with --sudo, if any.
```
