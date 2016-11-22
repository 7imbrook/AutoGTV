#!/usr/bin/env bash

if [ "$1" == "pair" ];
then
  echo "pairing";
  bundle exec pair gtv ssegoogletv.rit.edu /app/certs/cert.pem
  exit $?;
fi;

ruby gtv-remote.rb $@
