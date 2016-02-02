FROM postgres:9.4.5
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
ADD setup-database.sh /docker-entrypoint-initdb.d/
#ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 755 /docker-entrypoint-initdb.d/setup-database.sh
#
