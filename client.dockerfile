FROM python:latest

RUN pip install "celery"
RUN pip install "celery[redis]"

COPY currency.py .
COPY wait-for-it.sh .
RUN chmod +x wait-for-it.sh
COPY client-wait.sh .
RUN chmod +x client-wait.sh

python currency.py EURUSD CHFUSD GBPUSD GBPEUR CADUSD CADEUR
