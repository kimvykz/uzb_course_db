# uzb_course_db
employee database with schema and data for studying purposes

# unmount container
docker-compose down --rmi all --volumes --remove-orphans

# run the container
docker-compose up -d

# if necessary to restore dump manualy
pg_restore -d postgres://root1:root1@localhost:5432/employees -Fc 500_employees.dump -c -v --no-owner --no-privileges

# generate data for employee table
INSERT INTO employees.employee 
select  gs as id,
		DATE '1950-01-01' + (random() * (DATE '2005-12-31' - DATE '1950-01-01'))::int AS birth_date,
		(ARRAY['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank', 'Grace', 'Hank', 'Ivy', 'Jack', 
'Karen', 'Leo', 'Mona', 'Nate', 'Olivia', 'Paul', 'Quincy', 'Rachel', 'Steve', 'Tina', 
'Umar', 'Vera', 'Walter', 'Xena', 'Yanni', 'Zara', 'Aaron', 'Beth', 'Caleb', 'Diana', 
'Edward', 'Fiona', 'George', 'Hannah', 'Isaac', 'Julia', 'Kevin', 'Lydia', 'Miles', 'Nina', 
'Oscar', 'Penny', 'Quentin', 'Rose', 'Samuel', 'Tracy', 'Ulysses', 'Violet', 'William', 'Xavier', 
'Yvonne', 'Zeke', 'Abby', 'Brandon', 'Cindy', 'Derek', 'Eliza', 'Fred', 'Gina', 'Harvey', 'Irene', 
'James', 'Kylie', 'Lucas', 'Maria', 'Nathan', 'Opal', 'Peter', 'Queenie', 'Roger', 'Samantha', 
'Thomas', 'Ursula', 'Vincent', 'Wanda', 'Xander', 'Yasmin', 'Zion', 'Amelia', 'Bryan', 'Clara', 
'Dean', 'Ella', 'Felix', 'Gloria', 'Howard', 'Isabel', 'Jake', 'Kim', 'Liam', 'Melissa', 
'Noah', 'Olga', 'Patrick', 'Quinn', 'Ronald', 'Sophia', 'Tony', 'Uma', 'Victor', 'Winnie'])[floor(random() * 100) + 1] as first_name,
(array['Anderson', 'Brown', 'Clark', 'Davis', 'Evans', 'Fisher', 'Garcia', 'Harris', 'Iverson', 'Jones',  
'King', 'Lopez', 'Miller', 'Nelson', 'Owens', 'Parker', 'Quinn', 'Roberts', 'Smith', 'Taylor',  
'Upton', 'Vargas', 'White', 'Xavier', 'Young', 'Zimmerman', 'Adams', 'Baker', 'Collins', 'Dixon',  
'Edwards', 'Franklin', 'Gordon', 'Hall', 'Ingram', 'Jenkins', 'Knight', 'Lewis', 'Mitchell', 'Newton',  
'O’Brien', 'Phillips', 'Quigley', 'Reed', 'Stewart', 'Thomas', 'Underwood', 'Vance', 'Walker', 'Xander',  
'York', 'Zane', 'Armstrong', 'Barnes', 'Carter', 'Duncan', 'Ellis', 'Fleming', 'Grant', 'Henderson',  
'Irwin', 'Jefferson', 'Klein', 'Lawson', 'Morgan', 'Norris', 'Olson', 'Powell', 'Quintana', 'Ramirez',  
'Simpson', 'Turner', 'Usher', 'Vaughn', 'Watson', 'Xu', 'Yates', 'Zuniga', 'Abbott', 'Benson',  
'Chavez', 'Delgado', 'Elliott', 'Foster', 'Gibson', 'Hughes', 'Irving', 'Jackson', 'Keller', 'Lloyd',  
'Marshall', 'Navarro', 'Ortiz', 'Patel', 'Quintero', 'Rodriguez', 'Sanders', 'Tucker', 'Ulrich', 'Vasquez'])[floor(random() * 100) + 1] as last_name,
		(array['M', 'F'])[ceiling(random() * 2)] as gender,
		DATE '2000-01-01' + (random() * (DATE '2025-03-31' - DATE '2000-01-01'))::int AS hire_date
from generate_series(600000, 3000000) gs;

# generate data about salary
insert into salary
select gs as employee_id,
		ceiling(random() * 100000) amount,
		DATE '2000-01-01' + (random() * (DATE '2010-03-31' - DATE '2000-01-01'))::int AS from_date,
		DATE '2011-01-01' + (random() * (DATE '2025-03-31' - DATE '2011-01-01'))::int AS to_date
from generate_series(600000, 3000000) gs

# generate data about job position
insert into title
select gs as employee_id,
      (array['Software Engineer', 'Data Scientist', 'Product Manager', 'Project Manager', 'Web Developer',
      'Data Analyst', 'UX Designer', 'Software Developer', 'Business Analyst', 'DevOps Engineer', 
      'System Administrator', 'Database Administrator', 'Quality Assurance Engineer', 'Network Engineer', 
      'Cloud Architect', 'Security Analyst', 'Machine Learning Engineer', 'Full Stack Developer', 
      'Front End Developer', 'Back End Developer', 'Technical Support Engineer', 'IT Specialist', 
      'Data Engineer', 'Mobile Developer', 'Game Developer', 'Technical Lead', 'Site Reliability Engineer', 
      'Artificial Intelligence Engineer', 'Product Owner', 'Scrum Master', 'IT Manager', 
      'Human Resources Manager'])[floor(random() * 30) + 1] as title,
		DATE '2000-01-01' + (random() * (DATE '2025-03-31' - DATE '2000-01-01'))::int as from_date,
		'9999-01-01' as "to_date"
from generate_series(600000, 3000000) gs;

# generate data about department_employee
insert into department_employee 
select gs as employee_id,
		'd00' || ceiling(random() * 9) department_id,
		DATE '2000-01-01' + (random() * (DATE '2025-03-31' - DATE '2000-01-01'))::int as from_date,
		'9999-01-01' as "to_date"
from generate_series(600000, 3000000) gs;
