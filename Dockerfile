# Base on minimal debian

FROM bitnami/minideb:jessie  
RUN install_packages python pip

# Install flexget
RUN pip install -I flexget

# Install deluge
RUN add-apt-repository ppa:deluge-team/ppa \
    && apt-get update \
    && apt-get install deluge
    
# Cleanup

# Folders and configs
RUN mkdir -p /root/.flexget \
    && touch /root/.flexget/config.yml

# Export ports and folders
VOLUME ["/root/.flexget"]


# Run commands
CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
