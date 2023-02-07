## README: Installing Vagrant, VirtualBox and Using `vagrant up` and `vagrant ssh`

### Introduction

Vagrant is a tool used for building and managing virtual machine environments. In this guide, we will walk you through the process of installing Vagrant and a virtual box, and using the `vagrant up` and `vagrant ssh` commands to start and log into a virtual machine.

### Table of Contents

- [Prerequisites](#prerequisites)
- [Installing Vagrant and VirtualBox](#installing-vagrant-and-virtualbox)
- [Configuring Virtual Machines](#configuring-virtual-machines)
- [Starting a Virtual Machine](#starting-a-virtual-machine)
- [Logging into a Virtual Machine](#logging-into-a-virtual-machine)

### Prerequisites

Before you start, you will need to have the following installed on your computer:

- A computer running Windows, macOS, or Linux
- VirtualBox, a free and open-source virtualization software
- Vagrant, a tool for building and managing virtual machine environments

### Installing Vagrant and VirtualBox

1. Download and install VirtualBox from the [VirtualBox website](https://www.virtualbox.org/wiki/Downloads).

2. Download and install Vagrant from the [Vagrant website](https://www.vagrantup.com/downloads.html).

### Configuring Virtual Machines
The names and IP addresses of the virtual machines are defined in the vagrant/config.yaml file. 
An example example.config.yaml is available and must be renamed in "config.yaml" and completed with the names and IP addresses of the virtual machines.

### Starting a Virtual Machine

1. Navigate to the directory that contains your Vagrantfile in the terminal.

2. Start the virtual machine by running the following command:

    vagrant up

This command will run all virtual machine.

3. For a specific vitrual machine, use :

    vagrant up <vm_name>

These command will use the configuration specified in your `Vagrantfile` to start the virtual machine.

### Logging into a Virtual Machine

1. Log into the virtual machine by running the following command:

    vagrant ssh <vm_name>

Replace <vm_name> with the name of the virtual machine that you have specified in the config.yaml file.
This will open a secure shell connection to the virtual machine.


### Conclusion

With these steps, you should now have a basic understanding of how to install Vagrant and VirtualBox, start a virtual machine using a pre-existing `Vagrantfile`, and log into it using the specified credentials. You can now start using Vagrant to manage your virtual machine environments.

## Gitlab Registration and Deployment Guide

### Introduction
This guide is designed for developers who need to use the Gitlab server (https://gitlab.epitech-projects.me) for their projects. The server has been configured with a few necessary steps to follow in order to register and deploy your applications. 

### Table of Contents

- [Registration](#registration)
- [Deployment](#deployment)
- [Additional Steps](#additional-steps)
- [Rollback](#rollback)

### Registration
1. Create an account on the Gitlab server using an email address ending in @epitech.eu. 
2. Select your role as a developer. 
3. Wait for an admin to whitelist your account. 

### Deployment
1. Push your code to one of the repositories on the Gitlab server. This will trigger the CI pipelines to run and build your application as well as perform unit tests.
2. To deploy your application, create a release based on a tag named following the expression `/^d+\.\d+\.\d+/` (like "4.2.3"). The CD jobs in the pipeline will then send the build artifacts to the Nexus server (nexus.epitech-projects.me).
4. The Ansible playbook will retrieve the artifacts and deploy the application to the configured hosts.

### Additional Steps
After the virtual machine (VM) supporting the Gitlab deployment runner is executed, run the following command in the terminal: 

ansible-playbook -i /etc/ansible/inventories/local/hosts /etc/ansible/playbooks/setup.yml

### Rollback
To revert to a previous version, manually trigger the last job in the release pipeline.

### Conclusion
This guide has provided a comprehensive explanation of the steps necessary to register and deploy your application on the Gitlab server. If you have any questions or issues, please reach out to the admin team for support.
