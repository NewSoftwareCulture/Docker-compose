# Telegram local bot API Server

*https://core.telegram.org/bots/api#using-a-local-bot-api-server*

## Local settings

### Set env variables

```bash
export TELEGRAM_SERVER_PORT=
export TELEGRAM_SERVER_PATH=
export TELEGRAM_SERVER_API_ID=
export TELEGRAM_SERVER_API_HASH=
export TELEGRAM_BOT_TOKEN=
```

### Install

*https://github.com/tdlib/telegram-bot-api*

```bash
git clone --recursive https://github.com/tdlib/telegram-bot-api.git
cd telegram-bot-api
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
cmake --build . --target install
```

### Run

```bash
telegram-bot-api 
  -p $TELEGRAM_SERVER_PORT
  -d $TELEGRAM_SERVER_PATH
  --api-id=$TELEGRAM_SERVER_API_ID
  --api-hash=$TELEGRAM_SERVER_API_HASH
  --local 
  --temp-dir=temp
```

## Switch bot to local server

*https://core.telegram.org/bots/api#logout*

```bash
curl https://api.telegram.org/file/bot$TELEGRAM_BOT_TOKEN/logOut
```

## Scripts with Docker

### Start server

```bash
./scripts/start
```

### Stop server

```bash
./scripts/stop
```
