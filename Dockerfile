FROM python:3.10-slim

# Create tutor user
RUN useradd -ms /bin/bash tutor

# Install system dependencies
RUN apt-get update && \
    apt-get install -y curl gnupg git docker.io && \
    rm -rf /var/lib/apt/lists/*

# Create Docker CLI plugin directory for Compose
RUN mkdir -p /usr/local/lib/docker/cli-plugins

# Install Docker Compose V2 plugin
RUN curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 \
    -o /usr/local/lib/docker/cli-plugins/docker-compose && \
    chmod +x /usr/local/lib/docker/cli-plugins/docker-compose

# Install Tutor
RUN pip install --upgrade pip && pip install tutor[full]

# Set up workdir and permissions
WORKDIR /home/tutor
RUN chown -R tutor:tutor /home/tutor

# Default to bash shell
CMD ["bash"]
