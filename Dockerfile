FROM python:3.12

USER root

RUN adduser --uid 1000  --shell /bin/false --comment 'App User' --home /home/app --disabled-password --disabled-login app

USER app

ENV HOME=/home/app
ENV PATH=/home/app/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir /home/app/bin
COPY --chown=app:app app/bin/entrypoint.sh /home/app/bin/entrypoint.sh
COPY --chown=app:app app/bin/post_compile /home/app/bin/post_compile
COPY --chown=app:app app/metadata.yaml /home/app/metadata.yaml
COPY --chown=app:app app/requirements.txt /home/app/requirements.txt

RUN pip install --no-cache-dir --user -r /home/app/requirements.txt

WORKDIR /home/app

ENTRYPOINT ["/home/app/bin/entrypoint.sh"]

HEALTHCHECK CMD curl -f http://localhost:8001
