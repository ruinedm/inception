FROM debian:bullseye

RUN apt update && apt install -y \
    curl \
    ca-certificates \
    libpcap0.8 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/google/cadvisor/releases/download/v0.49.2/cadvisor-v0.49.2-linux-amd64 -o /usr/local/bin/cadvisor && \
    chmod +x /usr/local/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/cadvisor", "-port=8080"]
