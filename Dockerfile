FROM POSTGRES:17.1

COPY data/employees.sql.gz /docker-entrypoint-initdb.d/

ENV POSTGRES_USER=root1
ENV POSTGRES_PASSWORD=root1
ENV POSTGRES_DB=employees

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432