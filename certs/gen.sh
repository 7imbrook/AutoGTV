#!/bin/bash

openssl req \
  -new \
  -newkey rsa:2048 \
  -sha1 \
  -days 365 \
  -nodes \
  -x509 \
  -keyout /app/certs/server.key \
  -out /app/certs/server.crt \
  -config /app/certs/openssl.conf

cat server.key server.crt > cert.pem
