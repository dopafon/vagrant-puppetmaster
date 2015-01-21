#!/usr/bin/env bash
# This bootstraps Puppet on opensuse 12.1
# marco.schroeder@become.eu

set -e

puppetrepo="http://download.opensuse.org/repositories/systemsmanagement:/puppet:/devel/SLE_11_SP3"

if [ "$EUID" -ne "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

if which puppet > /dev/null 2>&1; then
  echo "Puppet is already installed.. delete it..."
	rpm -e puppet
fi

zypper ar --no-gpgcheck $puppetrepo puppet-devel
zypper install puppet --no-gpg-checks --yes
