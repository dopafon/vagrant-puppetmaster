#!/usr/bin/env bash
# This bootstraps Puppet on opensuse 12.1
# marco.schroeder@become.eu

set -e

puppetrpm="http://itsrv150.kaipc1.pangora.domain/rpms/puppet-121/x86_64/puppet-2.7.17-1.1.x86_64.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed.. upgrading..."
	rpm -Uhv $puppetrpm
	exit 0
fi

# Install facter
echo "Install facter with zypper"
zypper install facter

# Install puppet 
echo "Install puppet from itsrv150"
rpm -ivh $puppetrpm

echo "Puppet installed!"

