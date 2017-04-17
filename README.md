# celery-docker-playground
Playground/Sandbox repository for creating worker instances with workflows for verifying image dependencies.
Code is based from Francesco Pierfederici's "Distributed Computing with Python".

## Starting Services
```bash
docker build -t worker -f worker.dockerfile .
docker-compose -p celery up
```

## Submitting Jobs
```bash
docker build -t client -f client.dockerfile .
docker run --network=celery_default client
```

## Scaling Workers
In order to see an increase in performance we need to have increase in the number of machines.
Increasing the number of containers running the worker will not yield higher performance, b.c. celery uses multiprocessing by default.
Higher performance can be yielded with the use of docker-swarm.
```bash
docker-compose -p celery scale worker=4
```
