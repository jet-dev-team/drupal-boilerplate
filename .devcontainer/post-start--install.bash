#!/bin/bash

printf "\nCopy settings.local.php...\n"
cp .devcontainer/settings.local.php drupal/web/sites/default/settings.local.php

printf "\nInstall dependencies\n"
cd drupal
composer require drush/drush
composer install
cd ..

printf "\nInstall fresh site\n"
drush si --account-name=drupal --account-pass=drupal --site-name="Drupal Boilerplate" --db-url=mysql://drupal:drupal@db:3306/drupal -y

printf "\nInclude settings.local.php...\n"
echo -e "\nif (file_exists(\$app_root . '/' . \$site_path . '/settings.local.php')) {\n  include \$app_root . '/' . \$site_path . '/settings.local.php';\n}" >> drupal/web/sites/default/settings.php

printf "\nRun Drupal cron...\n"
drush core:cron

printf "\nYou are redy to go!\n"
