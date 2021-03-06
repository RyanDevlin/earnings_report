FROM docker.io/library/debian:buster-slim

WORKDIR /root/
COPY ./earningsbot .

# Since we issue http(s) requests, we need to install
# certificate authority certificates from the
# ca-certificates package inside the container
RUN apt-get update && apt-get install -y ca-certificates && \
    chmod +x earningsbot

# Expose metadata to explain that these ports are used by the application
EXPOSE 80 443

ENTRYPOINT [ "./earningsbot" ]
