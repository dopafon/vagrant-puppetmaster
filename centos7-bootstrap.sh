#!/usr/bin/env bash
# This bootstraps Puppetmaster on centos7
# marco.schroeder@become.eu

set -e

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

# Install puppet-server
echo "Install puppetserver"
rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
yum -y install puppet-server --nogpgcheck

# disble firewall
service firewalld stop
