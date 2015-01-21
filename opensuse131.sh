#!/usr/bin/env bash
# This bootstraps Puppet on opensuse 13.1
# marco.schroeder@become.eu

set -e

#puppetrpm="http://itsrv150.kaipc1.pangora.domain/rpms/puppet-121/x86_64/puppet-2.7.17-1.1.x86_64.rpm"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed.. exit..."
	exit 0
fi

# Install facter
echo "Install facter with zypper"
zypper install facter

# Install puppet 
echo "Install puppet"
zypper install puppet

echo "Puppet installed!"


# Install rubygem augeas
zypper ar http://download.opensuse.org/repositories/systemsmanagement:/puppet/openSUSE_13.1/ systemmanagement-puppet
zypper --gpg-auto-import-keys install ruby2.0-rubygem-augeas
