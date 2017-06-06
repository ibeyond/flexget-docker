# Base on minimal debian

FROM bitnami/minideb:jessie  
RUN install_packages python python-pip

# Install deluge
RUN install_packages deluge
 
# Install flexget
RUN pip install --upgrade setuptools \
    && pip install -I flexget
    
# Cleanup

# Folders and configs
RUN mkdir -p /config \
    && mkdir -p /storage

VOLUME ["/flexget", "/storage"]

RUN touch /flexget/config.yml


# Run commands
CMD ["/usr/local/bin/flexget","-c","/flexget/config.yml", "--loglevel", "info", "daemon", "start"]
