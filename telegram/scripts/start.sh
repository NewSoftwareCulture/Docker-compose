# Run telegram-local-server container

PORT=8080
TELEGRAM_SERVER_API_ID=
TELEGRAM_SERVER_API_HASH=
TELEGRAM_DIR_PATH=/tmp/telegram/storage

docker run --rm -d \
  --name telegram-local-server \
  -p 8080:$PORT \
  -e TELEGRAM_SERVER_API_ID=$TELEGRAM_SERVER_API_ID \
  -e TELEGRAM_SERVER_API_HASH=$TELEGRAM_SERVER_API_HASH \
  -v /tmp/telegram/storage:$TELEGRAM_DIR_PATH \
  tdlib