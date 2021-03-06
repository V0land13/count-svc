FROM python:3.8.2-alpine3.10

RUN adduser -D count-svc

WORKDIR /home/count-svc

COPY requirements.txt requirements.txt
RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY app app
COPY migrations migrations
COPY count-svc.py config.py boot.sh celery.sh ./
RUN chmod +x boot.sh
RUN chmod +x celery.sh

ENV FLASK_APP count-svc.py
ENV SECRET_KEY "jbvedrr8430tgj4kgmrfg/dgb.rjgrej43434.ed..454yh"

RUN chown -R count-svc:count-svc ./
USER count-svc
