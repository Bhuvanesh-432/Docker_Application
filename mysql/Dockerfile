FROM mysql:8.0

# Set environment variables (overridden by docker-compose)
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=gardening_db
ENV MYSQL_USER=gardenuser
ENV MYSQL_PASSWORD=gardenpass

# Copy initialization SQL
COPY init.sql /docker-entrypoint-initdb.d/init.sql

EXPOSE 3306
