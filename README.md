vagrant-puppetmaster
====================

What?
-----

My Vagrant configuration for setting up a test environment for a puppet master and agent


Usage
-----

Edit Vagrantfile to customize your puppet directory location or put it under ./puppet/
Using a autosign.conf in puppet is recommended for this purpose to make the agent work without manually accepting the keysigning request on the puppetmaster
