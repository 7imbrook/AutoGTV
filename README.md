# AutoGTV
Remote control for the SSE's Google TV

## What is this?
To make the Google TV automatically turn on and off, we need a script interface that can connect to a cron job. This does that!

## How it works
Using a [ruby wrapper](https://github.com/rnhurt/google_anymote) for the [anymote protocal](https://developers.google.com/tv/remote/docs/anymote), it connects to the GTV to send commands. It authenticates using certs placed in the cert directory, which are then paired to the TV.

## Build the container
When you build the container it will generate the certs used to identify and authenticate with the GTV. Everytime you rebuild you'll need to re-pair the built image. It goes like this.
```bash
$ docker build -t gtvremote .
# This needs run with -it to enter the pairing code, which will show up on the tv.
$ docker run -it gtvremote pair
Enter the pairing code:

# Now anytime this image is run (even it is pushed somewhere) it will be paired to the tv
$ docker run gtvremote on
$ docker run gtvremote off
$ docker run gtvremote url https://sse.rit.edu/gtv
```

And that's it! The image is built on sseprod under the deploy user and there is a cronjob set up to turn on/off during mentoring hours.
