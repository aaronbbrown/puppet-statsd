# StatsD

## Prerequisites

Install the [vcsrepo module](https://github.com/puppetlabs/puppetlabs-vcsrepo) from Puppet Labs.

Using the [puppet-module tool](https://github.com/puppetlabs/puppet-module-tool)
```
gem install puppet-module
puppet-module install puppetlabs-vcsrepo
```

or clone the repository directly
```
git clone git://github.com/puppetlabs/puppetlabs-vcsrepo.git
```

## Usage

``` ruby
include statsd
```
