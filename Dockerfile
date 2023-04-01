FROM postgres:15.2
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
COPY setup-database.sh /docker-entrypoint-initdb.d/
#ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN apt-get update && \
    apt-get install -y libc-bin && \
    apt-get install -y libc6 && \
    chmod 755 /docker-entrypoint-initdb.d/setup-database.sh
