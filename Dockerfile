FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y curl gnupg git && \
    pip install --upgrade pip && \
    pip install docker-compose && \
    pip install tutor[full]

# Set up working environment
WORKDIR /home/tutor
RUN useradd -m tutor && chown -R tutor /home/tutor
USER tutor

CMD ["bash"]

