#working slim buster with 650mb image
FROM python:3.11.3-slim-buster

RUN mkdir /code
WORKDIR /code

COPY requirements.txt /code/

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev && \
    pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt && \
    apt-get remove -y build-essential && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY . /code/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

#FROM python:3.11.3-buster
#
#RUN mkdir /code
#WORKDIR /code
#RUN pip install --upgrade pip
#COPY requirements.txt /code/
#
#RUN pip install -r requirements.txt
#COPY . /code/
#
#EXPOSE 8000
#
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
#1st config end

#another config
#FROM python:3.11.3-buster as builder
#
#RUN apt clean && apt update -y \
#    && apt-get install -y \
#    gcc \
#    gnutls-bin \
#    default-libmysqlclient-dev \
#    && python3 -m pip install --upgrade pip
#
#WORKDIR /code
#
#ENV PYTHONDONTWRITEBYTECODE 1
#
#ENV PYTHONUNBUFFERED 1
#
#COPY ./requirements.txt .
#
#RUN pip wheel --no-cache-dir --no-deps --wheel-dir /code/wheels -r requirements.txt
#
#FROM python:3.11.3-slim-buster
#
#ARG UNAME=djangouser
#
#ARG UID=1000
#
#ARG GID=1000
#
#RUN groupadd -g $GID -o $UNAME
#
#RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
#
#WORKDIR /app
#
#COPY --from=builder /code/requirements.txt .
#COPY --from=builder /code/wheels ../wheels
#
#RUN apt update -y \
#    && apt-get install -y \
#    gcc \
#    gnutls-bin \
#    default-libmysqlclient-dev \
#    && apt-get autoremove -y \
#    && apt-get clean \
#    && rm -rf /var/lib/apt/lists/
#
## Add docker-compose-wait tool -------------------
#ENV WAIT_VERSION 2.7.2
#
#ADD https://github.com/ufoscout/docker-compose-wait/releases/download/$WAIT_VERSION/wait ../wait
#
#RUN chmod +x ../wait
## && chown -R ${UID}:${GID} . && chmod +x ./entrypoint.sh
#
#USER $UNAME
#
#RUN python3 -m pip install --no-cache ../wheels/*
#
#COPY . /app/
#EXPOSE 8000
#CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

##ENTRYPOINT ["sh", "/app/entrypoint.sh"]
