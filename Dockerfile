FROM python:3.8-slim-buster
#comapney name or repo author
MAINTAINER BUNESHWAR

ENV PYTHONUNBUFFERED 1

#copying file
COPY ./requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2

RUN apt-get update \
    && apt-get install -y postgresql postgresql-contrib gcc python3-dev musl-dev
#RUN apk add --update --no-cache --virtual .tmp-build-deps \
#    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
#RUN apk del .tmp-build-deps

RUN mkdir /awake
WORKDIR /awake
COPY ./awake /awake/


## -d creating user
#RUN adduser -D user
#USER user