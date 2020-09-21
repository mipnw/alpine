FROM alpine:3.12

COPY scripts /usr/local/bin
RUN /usr/local/bin/dev.sh
RUN rm /usr/local/bin/dev.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
