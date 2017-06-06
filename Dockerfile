# Base on minimal debian

FROM bitnami/minideb:jessie  
RUN install_packages python

# Install flexget
RUN pip install -I flexget

# Install deluge

# Cleanup

# Export ports and folders

# Run commands
