FROM python:2.7

RUN pip install -I flexget transmissionrpc

RUN mkdir -p /var/lib/flexget \
    && touch /var/lib/flexget/config.yml

VOLUME ["/var/lib/flexget"]

ENTRYPOINT ["/usr/local/bin/flexget", "--loglevel", "warning", "-c", "/var/lib/flexget/config.yml"]
CMD ["daemon", "start"]
