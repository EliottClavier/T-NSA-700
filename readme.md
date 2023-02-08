# T-NSA-700

## Summary

- [Contributors](#contributors)
- [Introduction](#introduction)
- [First Steps](#first-steps)
    - [Prerequisites](#prerequisites)
    - [Installing Vagrant and VirtualBox](#installing-vagrant-and-virtualbox)
    - [Configuring Virtual Machines](#configuring-virtual-machines)
    - [Configuring Ansible secret](#configuring-ansible-secret)
        - [Vault_pass](#vault_pass)
        - [Vault](#vault)
    - [Starting a Virtual Machine](#starting-a-virtual-machine)    
    - [Logging into a Virtual Machine](#logging-into-a-virtual-machine)
    - [Environment setup](#environment-setup)
    - [Conclusion](#conclusion)
- [Gitlab Registration and Deployment Guide](#gitlab-registration-and-deployment-guide)
    - [Registration](#registration)
    - [Deployment](#deployment)
    - [Rollback](#rollback)
        - [To the previous version](#rollback-to-the-previous-version)
        - [To a specific version](#rollback-to-a-specific-version)
    - [Conclusion](#conclusion)

## Contributors

Our team is composed of:
- CLAVIER Eliott
- PIGNON Nathan
- MATHÉ Clément
- RIPAULT Paul
- MARTIN Maxime

## Introduction

This project aims to create an agile DevOps environment, allowing a team of developers to practice Agile development processes, and continuous product delivery.

To do this, we set up a Gitlab environment to manage the code, and provide a runner to execute the different pipelines. With its release system, developers can trigger the deployment of their applications from the Gitlab interface.

The deployment can be configured on different environments, but for this project we configured virtual machines using Vagrant. One of them embeds a Gitlab runner, allowing to execute the deployment on the other machines in local environment.

Ansible playbooks will then be executed from this deployment virtual machine, to install the necessary services, and then when a deployment is triggered, to retrieve the build artifacts from our Nexus server (http://nexus.epitech-projects.me:8081/) to make the applications available.

With this project, we ensure an Agile product development cycle, for the team of developers for whom it is intended.

## First Steps  

### Prerequisites

Before you start, you will need to have the following installed on your computer:

- A computer running Windows, macOS, or Linux
- VirtualBox, a free and open-source virtualization software
- Vagrant, a tool for building and managing virtual machine environments


### Installing Vagrant and VirtualBox

1. Download and install VirtualBox from the [VirtualBox website](https://www.virtualbox.org/wiki/Downloads).

2. Download and install Vagrant from the [Vagrant website](https://www.vagrantup.com/downloads.html).

### Configuring Virtual Machines

The names and IP addresses of the virtual machines are defined in a `vagrant/config.yml` file. You must create it. To do this : 
- In "vagrant" folder, use `example.config.yml` template to create a `config.yml` file
- Open the file and complete the IP addresses of the virtual machines.
- Indicate true to the `main_vm` parms to get a Vm with Ansible on it ( in the template, the VM called "terminal" has this option to true)
- Indicate the url of the gitlab server
- Indicate the `runner_register_token`.

### Configuring Ansible secret

#### Vault_pass

You must define a password in root_pass.txt. To do this :
- In /ansible, use the `example.vault_pass.txt` template to create file to create a `vault_pass.txt` file
- Write a password of your choice inside the file

#### Vault

You must define parms in vault.yml To do this :
- In /ansible, use the `example.vault.yml` template file to create a `vault.yml` file.
- Define a configuration. (refer to comments in it or keys name)

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

### Environment setup

- Run the "terminal" vm or a vm with main_vm to true

- After the virtual machine (VM) supporting the Gitlab deployment runner is executed, run the following command in the terminal: 

    ansible-playbook -i /etc/ansible/inventories/local/hosts /etc/ansible/playbooks/setup.yml

### Conclusion

The local environnement is now set up

## Gitlab Registration and Deployment Guide

### Introduction
This guide is designed for developers who need to use the Gitlab server (https://gitlab.epitech-projects.me) for their projects. The server has been configured with a few necessary steps to follow in order to register and deploy your applications. 

### Registration
1. Create an account on the Gitlab server using an email address ending in @epitech.eu. 
2. Select your role as a developer. 
3. Wait for an admin to whitelist your account. 

### Deployment
1. Push your code to one of the repositories on the Gitlab server. This will trigger the CI pipelines to run and build your application as well as perform unit tests.
2. To deploy your application, create a release based on a tag named following the expression `/^d+\.\d+\.\d+/` (like "4.2.3"). The CD jobs in the pipeline will then send the build artifacts to the Nexus server (nexus.epitech-projects.me).
4. The Ansible playbook will retrieve the artifacts and deploy the application to the configured hosts.

### Rollback to the previous version
To revert to a previous version, manually trigger the last job in the release pipeline.

### Rollback to a specific version
To revert to a specific version, manually remove the release of the desired target version. Then, create a branch from the code present in the desired tag, then make a release from this branch.

### Conclusion
This guide has provided a comprehensive explanation of the steps necessary to register and deploy your application on the Gitlab server. If you have any questions or issues, please reach out to the admin team for support.
