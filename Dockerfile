FROM postgres:17.1

COPY data/employees.sql.gz /docker-entrypoint-initdb.d/500_employees.sql.gz

ENV POSTGRES_USER=root1
ENV POSTGRES_PASSWORD=root1
ENV POSTGRES_DB=employees

# don't need to create schema separately
COPY init.sql /docker-entrypoint-initdb.d/001_init.sql

EXPOSE 5432