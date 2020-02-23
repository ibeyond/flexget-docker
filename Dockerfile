                   
# Base on minimal debian

FROM bitnami/minideb:latest
RUN install_packages python3 python3-pip python3-setuptools

RUN pip3 install wheel

# Install flexget
RUN pip3 install --upgrade setuptools \
    && pip3 install -I flexget

# Cleanup

# Folders and configs
RUN mkdir -p /config

VOLUME ["/config"]

#RUN touch /config/config.yml

EXPOSE 3539:3539
# Run commands: Remove lock files and start daemon

CMD ["sh", "-c", "touch /config/.config-lock && rm /config/.config-lock && /usr/local/bin/flexget -c /config/config.yml --loglevel info daemon start"]
