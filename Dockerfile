FROM postgres:latest
ENV DB_NAME database
ENV DB_USER admin
ENV DB_PASS password
ADD setup-database.sh /docker-entrypoint-initdb.d/