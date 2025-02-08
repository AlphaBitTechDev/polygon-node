FROM ubuntu:latest

WORKDIR /polygon

# Install dependencies
RUN apt update && \
    apt-get upgrade -y && \
    apt install -y build-essential lz4 curl software-properties-common

# Install Heimdall
RUN curl -L https://raw.githubusercontent.com/maticnetwork/install/main/heimdall.sh | bash -s -- 1.2.0 mainnet sentry

# Install Bor
RUN curl -L https://raw.githubusercontent.com/maticnetwork/install/main/bor.sh | bash -s -- 1.5.5 mainnet sentry

# Ownership (important for host directory mounts)
RUN chown -R heimdall:heimdall /var/lib/heimdall
RUN chown -R bor:bor /var/lib/bor

# Entrypoint script
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Expose ports (same as before)
EXPOSE 26656
EXPOSE 1317
EXPOSE 30303
EXPOSE 8545