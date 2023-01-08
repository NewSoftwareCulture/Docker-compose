# https://hub.docker.com/r/apache/superset

# Create network
docker network create app_sql_network

# Run superset container
docker run --rm -d \
  --name superset \
  -p 80:8088 \
  --net=app_sql_network \
  apache/superset

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