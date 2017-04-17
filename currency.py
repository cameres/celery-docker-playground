import celery
import urllib.request
app = celery.Celery('currency',
                    broker='amqp://rabbit',
                    backend='redis://redis')

# worker code
URL = 'http://finance.yahoo.com/d/quotes.csv?s={}=X&f=p'
@app.task
def get_rate(pair, url_tmplt=URL):
    with urllib.request.urlopen(url_tmplt.format(pair)) as res:
        body = res.read()
    return (pair, float(body.strip()))

# client code
if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('pairs', type=str, nargs='+')
    args = parser.parse_args()
    results = [get_rate.delay(pair) for pair in args.pairs]
    for result in results:
        pair, rate = result.get()
        print(pair, rate)
