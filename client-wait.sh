#!/bin/bash

./wait-for-it.sh -t 0 rabbit:5672 -- echo "rabbit is up"
./wait-for-it.sh -t 0 redis:6379 -- echo "reddis is up"

# client also should wait until celery is up
# use case is not typical, b.c. workers would
# typically be long running and clients would
# come and go with application use.
# http://stackoverflow.com/questions/8506914/detect-whether-celery-is-available-running

python currency.py EURUSD CHFUSD GBPUSD GBPEUR CADUSD CADEUR
