#!/bin/bash

<<'SCRIPT-FUNCTIONS'
    Requirements: none
    Description: Script for Install and Configure Terraform
    Author: Marcos Silvestrini
    Date: 06/06/2023
SCRIPT-FUNCTIONS

export LANG=C

# Set workdir
cd /home/vagrant || exit

# Variables
DISTRO=$(cat /etc/*release | grep -ws NAME=)

# Variables
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
LIGHTGRAY='\033[0;37m'
DISTRO=$(cat /etc/*release | grep -ws NAME=)

if [[ "$DISTRO" == *"Rocky Linux"* ]]; then
    echo -e "${GREEN}Congratulations! Your distribution has been enabled for this project!!!"
else
    echo -e "${RED}This distribution not enabled for this project.Sorry!!!"
    exit 0
fi
echo -e "${LIGHTGRAY}----------------------------------------------------------------"

echo -e "${ORANGE}Install and Configure Terraform..."
echo -e "${GREEN}  "
dnf install -y yum-utils
yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
dnf update -y
dnf -y install terraform

echo -e "${LIGHTGRAY}----------------------------------------------------------------"

echo -e "${ORANGE}Check Install Terraform..."
echo -e "${GREEN}  "
terraform --version
