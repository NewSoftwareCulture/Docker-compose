FROM ubuntu:latest

WORKDIR /app

COPY . /app

RUN apt update && \
  apt-get install -y python3

EXPOSE 8080:8080

CMD python3 run.py