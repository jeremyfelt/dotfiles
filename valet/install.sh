# Check for an existing installation of Valet
if test ! $(which valet)
then
  composer global require laravel/valet
fi
