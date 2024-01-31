FROM alpine:3.15

WORKDIR /

RUN apk add --no-cache \
    ca-certificates

RUN apk add --no-cache --virtual .build-deps \
    g++ \
    make \
    cmake \
    git \
    gperf \
    libressl-dev \
    zlib-dev \
    zlib-static \
    linux-headers;

RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git && \
    cd telegram-bot-api && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . --target install

ENV TELEGRAM_SERVER_PORT=8080
ENV TELEGRAM_SERVER_PATH=/tmp/telegram/storage
ENV TELEGRAM_SERVER_API_ID=""
ENV TELEGRAM_SERVER_API_HASH=""

CMD telegram-bot-api \
  -p $TELEGRAM_SERVER_PORT \
  -d $TELEGRAM_SERVER_PATH \
  --api-id=$TELEGRAM_SERVER_API_ID \
  --api-hash=$TELEGRAM_SERVER_API_HASH \
  --local \
  --temp-dir=temp