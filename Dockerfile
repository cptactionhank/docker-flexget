FROM google/python:2.7
MAINTAINER cptactionhank <cptactionhank@users.noreply.github.com>

# install flexget and dependencies
RUN pip install -I flexget transmissionrpc

# create configuration directory and empty configuration files
RUN mkdir -p /var/lib/flexget && touch /var/lib/flexget/config.yml

# mount the configuration directory
VOLUME ["/var/lib/flexget"]

# set the default entrypoint to flexget binary
ENTRYPOINT ["/usr/local/bin/flexget", "--loglevel", "warning", "-c", "/var/lib/flexget/config.yml"]

# set default command arguments to start daemon
CMD ["daemon", "start"]
