# AutoGTV
Remote control for the SSE's Google TV

## What is this?
To make the Google TV automatically turn on and off, we need a script interface that can connect to a cron job. This does that!

## How it works
Using a [ruby wrapper](https://github.com/rnhurt/google_anymote) for the [anymote protocal](https://developers.google.com/tv/remote/docs/anymote), it connects to the GTV to send commands. It authenticates using certs placed in the cert directory, which are then paired to the TV.

## Setup
Before using the app, you must have an OpenSSL certificate. This certificate can be
self signed and that's pretty easy to do. Assuming you have `openssl` on your path you
can run the following.

```
$ openssl genrsa -des3 -out server.key 1024
$ openssl req -new -key server.key -out server.csr
$ openssl rsa -in server.key -out server.key
$ openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt
$ cat server.key server.crt > cert.pem
```

By default, the application looks for a file `certs/cert.pem` relative to the
current directory.

## Pairing
Before running the application for the first time, you need to pair your device with the GTV.
you can do this by running the following:

```
bundle exec pair gtv ssegoogletv.rit.edu path/to/cert.pem
```

After this, you should have no problem running the app.
