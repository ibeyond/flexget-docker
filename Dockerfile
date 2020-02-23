# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

# Install deluge
# RUN install_packages deluge
RUN pip3 install imdbpy deluge-client

 
# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget
    
# Cleanup

# Folders and configs
RUN mkdir -p /config \
    && mkdir -p /storage

VOLUME ["/config", "/storage"]

RUN touch /config/config.yml

# Run commands: Remove lock files and start daemon
CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
