FROM python:latest

RUN pip install "celery"
RUN pip install "celery[redis]"

COPY currency.py .

CMD ["python", "currency.py", "EURUSD", "CHFUSD", "GBPUSD", "GBPEUR", "CADUSD", "CADEUR"]
