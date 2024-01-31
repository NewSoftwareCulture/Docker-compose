# Docker-compose multiple instances

## Run

```bash
docker-compose up -d --scale simple-service=4
```

## Stop

```bash
docker-compose down
```

## Restarm

```bash
docker-compose restart
```

## List

```bash
docker-compose ps -a
```

## Logs

```bash
docker-compose logs -f simple-service -n 200
```