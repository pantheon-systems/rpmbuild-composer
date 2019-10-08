# RPM for Composer

This repository builds an RPM for Composer.

The RPM filename built by this repository is:
```
composer-1.2.0-201607271604.noarch.rpm
{ name }-{ver}-{timestamp }.{arch}.rpm
```

## Install Location

This rpm installs:

/opt/composer/composer/composer.phar

## Releasing to Package Cloud

Any time a pull request is created, then the composer RPM is built and pushed up to Package Cloud in pantheon/internal-staging/fedora/#.

In the example, # is the fedora build number (19, 20, 22). Note that Composer is only installed on app servers, and there are no app servers on anything prior to f22; therefore, at the moment, we are only building for f22.

This repository does NOT automatically promote the internal-staging RPM to internal (production) when the PR is merged to master. This step must be done manually.

## Provisioning Composer on Pantheon

Pantheon will automatically install any new RPM that is deployed to Package Cloud. This is controlled by [pantheon-cookbooks/php](https://github.com/pantheon-cookbooks/php/blob/master/recipes/composer.rb).
