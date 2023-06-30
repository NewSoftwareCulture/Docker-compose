#!/bin/bash

# Start Google Chrome with PROXY and URL https://www.whatismyip.com/

# TODO: set values to HOST and PORT
HOST=
PORT=

google-chrome-stable \
  --no-sandbox \
  --proxy-server=$HOST:$PORT \
  https://www.whatismyip.com/

# Delay
sleep infinity
