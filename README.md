# AutoGTV
Remote control for the SSE's Google TV

## What is this?
To make the Google TV automatically turn on and off, we need a script interface that can connect to a cron job. This does that!

## How it works
Using a [ruby wrapper](https://github.com/rnhurt/google_anymote) for the [anymote protocal](https://developers.google.com/tv/remote/docs/anymote), it connects to the GTV to send commands. It authenticates using certs placed in the cert directory, which are then paired to the TV. 
