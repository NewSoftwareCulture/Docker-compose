# Create volume
# docker volume create postgres_vol_1

# # Create network
# docker network create app_sql_network

# Run postgres container
docker run --rm -d \
  --name postgres_1 \
  -p 5432:5432 \
  -e POSTGRES_PASSWORD=admin \
  -e POSTGRES_USER=admin \
  -e POSTGRES_DB=app_sql \
  -v postgres_vol_1:/var/lib/postgresql/data \
  --net=app_sql_network \
  postgres:14