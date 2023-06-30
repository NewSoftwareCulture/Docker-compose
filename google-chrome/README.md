# Google Chrome from Docker with graphics

## xQuartz

1. Install XQuartz via brew

```bash
$ brew install --cask xquartz
```

2. Logout and login of your Mac to activate XQuartz as default X11 server

3. Start XQuartz

```bash
$ open -a XQuartz
```

4. Go to Security Settings and ensure that "Allow connections from network clients" is on

5. Restart your Mac and start XQuartz again

```bash
$ open -a XQuartz
```

6. Check if XQuartz is setup and running correctly

```bash
$ ps aux | grep Xquartz
```

7. Ensure that XQuartz is running similar to this: `/opt/X11/bin/Xquartz :0 -listen tcp :0` means the display is running on display port 0. Important is that its not saying `–nolisten tcp` which would block any X11 forwarding to the X11 display.

8. Allow X11 forwarding via xhost

```bash
$ xhost +
```

This allows any client to connect. If you have security concerns you can append an IP address for a whitelist mechanism.

Alternatively, if you want to limit X11 forwarding to local containers, you can limit clients to localhost only via

```bash
$ xhost +localhost
```

Be ware: You will always have to run xhost + after a restart of X11 as this is not a persistent setting.

## Docker

0. Remove old container and image (*optional*)

```bash
$ docker rm google_chrome_container
$ docker image rm google_chrome_image
```

1. Build image 

```bash
$ docker build -t google_chrome_image_image .
```
2. Run container from image

```bash
$ docker run -it -e DISPLAY=docker.for.mac.host.internal:0 --name google_chrome_container google_chrome_image
```

Args:
- `-it` Interactive mode (*watch logs*)
- `-e DISPLAY=$DISPLAY` Display for browser graphics
- `--name $CONTAINER_NAME` Container name
- `$IMAGE_NAME` Image name
