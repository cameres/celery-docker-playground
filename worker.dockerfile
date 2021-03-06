FROM python:latest

RUN pip install "celery"
RUN pip install "celery[redis]"

COPY currency.py .
COPY wait-for-it.sh .
RUN chmod +x wait-for-it.sh
COPY worker-wait.sh .
RUN chmod +x worker-wait.sh
