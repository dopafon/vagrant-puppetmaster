#!/usr/bin/env bash
# This bootstraps Puppet provisioning on centos7
# marco.schroeder@become.eu

set -e

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Install puppet
echo "Install puppet"
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y install puppet --nogpgcheck

# disble firewall
service firewalld stop
