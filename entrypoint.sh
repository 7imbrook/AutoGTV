#!/usr/bin/env bash

echo $@
exit 0;

if [ i"$1" -eq "pair" ]
then
  echo "Pairing....";
  bundle exec pair gtv ssegoogletv.rit.edu /app/certs/cert.pem
  exit $?;
fi;

echo "Running command";
ruby gtv-remote.rb $@
