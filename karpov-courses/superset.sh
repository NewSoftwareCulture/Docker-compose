# https://www.youtube.com/watch?v=I1h2YaWW9PE

# Volumes

docker volume create postgres_vol_1
docker volume create postgres_vol_2
docker volume create clickhouse_vol_1

# Networks

docker network create app_sql_network

# ------------------------
# POSTGRES_1
# ------------------------

# Run postgres container
# --rm    - удаление при остановке
# -d      - фоновый режим
# --name  - название контейнера
# -e      - переменная окружения
# -v      - volume
# -p      - port
# --net   - network
docker run --rm -d \
  --name postgres_1 \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_USER=admin \
  -e POSTGRES_DB=app_sql \
  -v postgres_vol_1:/var/lib/postgresql/data \
  --net=app_sql_network \
  postgres:14

# ------------------------
# POSTGRES_2
# ------------------------

# Run postgres container
docker run --rm -d \
  --name postgres_2 \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_USER=admin \
  -e POSTGRES_DB=app_sql_2 \
  -v postgres_vol_2:/var/lib/postgresql/data \
  --net=app_sql_network \
  -p 5432:5432 \
  postgres:14

# ------------------------
# CLICKHOUSE
# ------------------------

# Run clickhouse container
docker run --rm -d \
  --name clickhouse \
  --net=app_sql_network \
  -v clickhouse_vol_1:/var/lib/clickhouse \
  yandex/clickhouse-server

# Add package
docker exec superset pip install clickhouse-connect

# ------------------------
# SUPERSET
# ------------------------

# Run superset container
docker run --rm -d \
  --name superset \
  -p 80:8088 \
  --net=app_sql_network \
  apache/superset

# https://hub.docker.com/r/apache/superset

# Create admin superset
docker exec -it superset superset fab create-admin \
  --username admin \
  --firstname Superset \
  --lastname Admin \
  --email admin@superset.com \
  --password admin

# Migrate db
docker exec -it superset superset db upgrade

# Setup roles
docker exec -it superset superset init

# Restart superset container
docker restart superset

# ------------------------
# REMOVE
# ------------------------
# docker stop postgres_1 postgres_2 clickhouse superset
# docker volume rm postgres_vol_1 postgres_vol_2 clickhouse_vol_1
# docker network rm app_sql_network