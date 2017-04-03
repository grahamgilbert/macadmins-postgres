FROM postgres:9.6.2
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
COPY setup-database.sh /docker-entrypoint-initdb.d/
COPY docker-healthcheck.sh /docker-healthcheck/
#ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN apt-get update && \
    apt-get install -y libc-bin && \
    apt-get install -y libc6 && \
    chmod 755 /docker-entrypoint-initdb.d/setup-database.sh && \
    chmod 755 /docker-healthcheck/docker-healthcheck.sh
HEALTHCHECK CMD ["/docker-healthcheck/docker-healthcheck.sh"]

