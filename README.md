# MCollective Agent users

MCollective Agent to display users on systems (who/last).

To use this agent you need:

  * MCollective 2.2.1 at least
  * wprocps/sysvinit-tools installed

# TODO

  * ???

## Agent Installation

Follow the basic [plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins)

## Usage

All options and filters are available.

### Who

Display the current logged on users with the MCollective Application:

    $ mco users who
	
### Last

Display the last logged on users with the MCollective Application:

    $ mco users last
