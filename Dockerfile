# Base on minimal debian

FROM bitnami/minideb:jessie  
RUN install_packages python python-pip software-properties-common python-software-properties

# Install deluge
RUN add-apt-repository ppa:deluge-team/ppa \
    && apt-get update \
    && install_packages deluge
 
# Install flexget
RUN pip install -I flexget
    
# Cleanup

# Folders and configs
RUN mkdir -p /root/.flexget \
    && touch /root/.flexget/config.yml

# Export ports and folders
VOLUME ["/root/.flexget"]


# Run commands
CMD ["/usr/local/bin/flexget", "--loglevel", "info", "daemon", "start"]
