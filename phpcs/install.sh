# Check for an existing installation of Valet
if test ! $(which phpcs)
then
  composer global require squizlabs/php_codesniffer --update-no-dev
  composer global require dealerdirect/phpcodesniffer-composer-installer --update-no-dev
  composer global require wp-coding-standards/wpcs --update-no-dev
fi
