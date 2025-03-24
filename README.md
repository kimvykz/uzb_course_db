# uzb_course_db
test database with schema and data for studying purposes


# unmount container
docker-compose down --rmi all --volumes --remove-orphans

# run the container
docker-compose up -d

# if necessary to restore dump manualy
pg_restore -d postgres://root1:root1@localhost:5432/employees -Fc 500_employees.dump -c -v --no-owner --no-privileges
