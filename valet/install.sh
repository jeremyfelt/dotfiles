# Check for an existing installation of Valet+
if test ! $(which valet)
then
  composer global require weprovide/valet-plus
fi
