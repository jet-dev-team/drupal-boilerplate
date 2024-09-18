#!/bin/bash


# This version of the script assumes that settings.php is already configured and the necessary
# configuration is available. If not, refer to post-start--install.bash for a fresh installation.

# This line is needed to load proper PATH for people using remote Docker context.
source ~/.bashrc

printf "\nCopy settings.local.php...\n"
cp .devcontainer/settings.local.php drupal/web/sites/default/settings.local.php

printf "\nInstall dependencies\n"
cd drupal
composer install
cd ..

printf "\nInstall site with existing config\n"
drush si --existing-config --account-name=drupal --account-pass=drupal -y

printf "\nFix files permissions\n"
chmod -R a+w drupal/web/sites/default/files

drush cr
drush cron

printf "\nYou are redy to go!\n"