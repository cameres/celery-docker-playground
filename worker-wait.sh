#!/bin/bash

./wait-for-it.sh -t 0 rabbit:5672 -- echo "rabbit is up"
./wait-for-it.sh -t 0 redis:6379 -- echo "reddis is up"

celery -A currency worker --loglevel=info
