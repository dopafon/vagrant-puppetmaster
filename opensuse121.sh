#!/usr/bin/env bash
# This bootstraps Puppet on opensuse 12.1


set -e


if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed.. upgrading..."
	zypper update puppet
	exit 0
fi

# Install facter
echo "Install facter with zypper"
zypper install facter

# Install puppet 
echo "Install puppet"
zypper install puppet

echo "Puppet installed!"

