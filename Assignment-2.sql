create table Students
(
student_id int primary key,
first_name varchar(30) not null,
last_name varchar(30) not null,
date_of_birth date not null,
email varchar(40) not null,
phone_number bigint not null
);


INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
(101, 'John', 'Doe', '2000-01-01', 'john.doe@example.com', 1234567890),
(102, 'Jane', 'Smith', '1999-05-15', 'jane.smith@example.com', 9876543210),
(103, 'Alice', 'Johnson', '2001-09-30', 'alice.johnson@example.com', 5555555555),
(104, 'Bob', 'Brown', '1998-03-20', 'bob.brown@example.com', 2222222222),
(105, 'Mary', 'Davis', '2002-11-10', 'mary.davis@example.com', 3333333333),
(106, 'Tom', 'Wilson', '1997-07-25', 'tom.wilson@example.com', 4444444444),
(107, 'Sarah', 'Anderson', '2003-04-05', 'sarah.anderson@example.com', 6666666666),
(108, 'Chris', 'Roberts', '1996-12-15', 'chris.roberts@example.com', 7777777777),
(109, 'Laura', 'Garcia', '2004-08-18', 'laura.garcia@example.com', 8888888888),
(110, 'Alex', 'Martinez', '1995-10-12', 'alex.martinez@example.com', 9999999999),
(111, 'Jessica', 'Lee', '2005-02-28', 'jessica.lee@example.com', 1111111111),
(112, 'Michael', 'Lopez', '1994-06-08', 'michael.lopez@example.com', 5555555555),
(113, 'David', 'Hernandez', '2006-07-14', 'david.hernandez@example.com', 6666666666),
(114, 'Jennifer', 'Young', '1993-09-22', 'jennifer.young@example.com', 7777777777),
(115, 'Amanda', 'King', '2007-11-03', 'amanda.king@example.com', 8888888888);


create table Courses
(
course_id int primary key,
course_name varchar(40),
credits int,
teacher_id int references Teacher(teacher_id)
);
 
INSERT INTO Courses (course_id, course_name, credits, teacher_id)
VALUES
(301, 'Introduction to Programming', 3, 201),
(302, 'Database Management', 4, 202),
(303, 'Web Development', 4, 203),
(304, 'Data Structures and Algorithms', 3, 201),
(305, 'Software Engineering', 4, 205),
(306, 'Computer Networking', 3, 206),
(307, 'Artificial Intelligence', 4, 207),
(308, 'Mobile App Development', 4, 202),
(309, 'Operating Systems', 3, 204),
(310, 'Computer Security', 4, 203),
(311, 'Machine Learning', 4, 207),
(312, 'Cloud Computing', 3, 205),
(313, 'Game Development', 4, 202),
(314, 'UI/UX Design', 3, 205),
(315, 'Digital Marketing', 4, 204);

create table Enrollments
(
enrollment_id int primary key,
student_id int references Students(student_id),
course_id int references Courses(course_id),
enrollment_date date
);

INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
(401, 101, 301, '2024-01-15'),
(402, 102, 301, '2024-02-20'),
(403, 103, 301, '2024-03-25'),
(404, 104, 302, '2024-04-10'),
(405, 105, 303, '2024-05-15'),
(406, 106, 304, '2024-06-20'),
(407, 107, 305, '2024-07-25'),
(408, 108, 306, '2024-08-10'),
(409, 109, 306, '2024-09-15'),
(410, 110, 306, '2024-10-20'),
(411, 111, 307, '2024-11-25'),
(412, 112, 307, '2025-01-10'),
(413, 113, 308, '2025-02-15'),
(414, 114, 308, '2025-03-20'),
(415, 115, 309, '2025-04-25'),
(416, 101, 308, '2025-03-20'),
(417, 102, 310, '2025-03-20');

create table Teacher
(
 teacher_id int primary key,
 first_name varchar(40),
 last_name varchar(40),
 email varchar(40)
);

INSERT INTO Teacher (teacher_id, first_name, last_name, email)
VALUES
(201, 'Robert', 'Johnson', 'robert.johnson@example.com'),
(202, 'Emily', 'Williams', 'emily.williams@example.com'),
(203, 'Daniel', 'Brown', 'daniel.brown@example.com'),
(204, 'Jennifer', 'Davis', 'jennifer.davis@example.com'),
(205, 'Michael', 'Miller', 'michael.miller@example.com'),
(206, 'Jessica', 'Garcia', 'jessica.garcia@example.com'),
(207, 'William', 'Martinez', 'william.martinez@example.com');

create table Payments
(
payment_id int primary key,
student_id int references Students(student_id),
amount int,
payment_date date
);

INSERT INTO Payments (payment_id, student_id, amount, payment_date)
VALUES
(501, 101, 1000, '2024-01-20'),
(502, 102, 2000, '2024-02-25'),
(503, 103, 1500, '2024-03-30'),
(504, 104, 2500, '2024-04-15'),
(505, 105, 3000, '2024-05-20'),
(506, 106, 2000, '2024-06-25'),
(507, 107, 4000, '2024-07-30'),
(508, 108, 3500, '2024-08-15'),
(509, 109, 6000, '2024-09-20'),
(510, 110, 4500, '2024-10-29'),
(511, 111, 7000, '2024-11-25'),
(512, 112, 5500, '2025-01-20'),
(513, 113, 8000, '2025-02-25'),
(514, 114, 6500, '2025-03-30'),
(515, 115, 9000, '2025-04-25');


--Task-2

--1) Write an SQL query to insert a new student into the "Students" table with the following details:

--a. First Name: John
--b. Last Name: Doe
--c. Date of Birth: 1995-08-15
--d. Email: john.doe@example.com
--e. Phone Number: 1234567890
select * from students;
insert into Students values(116,'John','Doe','1995-08-15','doe@example.com',123456789);

--2) Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.

select * from Enrollments;
insert into Enrollments values(418,116,311,'2023-10-28');

--3) Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
select * from Teacher;
declare @updateEmail varchar(40);
set @updateEmail='robertjohnson@example.com';
update Teacher set email=@updateEmail where teacher_id=201;

--4) Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.

delete from Enrollments where student_id=102 and course_id=301;

--5) Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

select * from Courses;
update Courses set teacher_id=204 where course_id=304;

--6) Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

ALTER TABLE Enrollments ADD CONSTRAINT FK_Studentid FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE; 
delete from Students where student_id=116;

--7) Update the payment amount for a specific payment record in the "Payments" table. Choose any payment record and modify the payment amount.

select * from Payments;
update Payments set amount=2500 where payment_id=515;

--Task-3

--1) Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.


select s.first_name,s.last_name,sum(p.amount) as Total_amount_Paid
from Students s
inner join Payments p
on s.student_id=p.student_id
group by s.student_id,s.first_name,s.last_name;

--2) Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.

select c.course_id,c.course_name,count(e.enrollment_id) as Total_students_enrolled
from Courses c
inner join Enrollments e
on c.course_id=e.course_id
group by c.course_id,c.course_name;

--3) Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.

select s.first_name
from Students s
left join Enrollments e
on s.student_id=e.student_id
group by s.student_id,s.first_name
having COUNT(e.enrollment_id)<1;

--4) Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

select s.first_name,s.last_name,c.course_name
from Enrollments e
inner join Students s
on e.student_id=s.student_id
inner join Courses c
on e.course_id=c.course_id;

--5) Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.

select t.teacher_id,t.first_name,t.last_name,c.course_name
from Teacher t
inner join Courses c
on t.teacher_id=c.teacher_id;

--6) Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.

select s.first_name,s.last_name,c.course_name,e.enrollment_date
from Students s
inner join Enrollments e
on s.student_id=e.student_id
inner join Courses c
on e.course_id=c.course_id;

--7) Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.

select s.first_name,s.last_name
from Students s
left join Payments p
on s.student_id=p.student_id
where p.payment_id is null;

select * from Payments;

--8) Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.

select c.course_id,c.course_name
from Courses c
left join Enrollments e
on c.course_id=e.course_id
where e.enrollment_id is null;

select * from Enrollments;

--9) Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.

select distinct e.student_id
from Enrollments e
inner join  Enrollments er
on e.student_id=er.student_id
where e.course_id <> er.course_id;

--10) Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

select t.teacher_id,t.first_name,t.last_name,c.course_id
from Teacher t
left join Courses c
on t.teacher_id=c.teacher_id
where c.course_id is null;

--Task-4

--1) Calculate the average number of students enrolled in each course:

select course_id, avg(num_students)
from (
    select course_id, count(student_id) as num_students
    from enrollments
    group by course_id
) as subquery
group by course_id;

--2) Identify the student(s) who made the highest payment:

select student_id
from payments
where amount = (
    select max(amount)
    from payments
);

--3)Retrieve a list of courses with the highest number of enrollments:

select course_id
from enrollments
group by course_id
having count(student_id) = (
    select max(num_students)
    from (
        select course_id, count(student_id) as num_students
        from enrollments
        group by course_id
    ) as subquery
);
--4) Calculate the total payments made to courses taught by each teacher:

select teacher_id, sum(amount) as total_payments
from (
    select e.course_id, p.amount, c.teacher_id
    from enrollments e
    join courses c on e.course_id = c.course_id
    join payments p on e.student_id = p.student_id
) as subquery
group by teacher_id;

--5) Identify students who are enrolled in all available courses:

select student_id
from enrollments
group by student_id
having count(distinct course_id) = (
    select count(distinct course_id)
    from courses
);

--6) Retrieve the names of teachers who have not been assigned to any courses:

select teacher_id
from teachers
where teacher_id not in (
    select distinct teacher_id
    from courses
);
--7) Calculate the average age of all students:

select avg(age) as average_age
from (
    select student_id, datediff(year, dob, getdate()) as age
    from students
) as subquery;

--8)Identify courses with no enrollments:

select course_id
from courses
where course_id not in (
    select distinct course_id
    from enrollments
);

--9) Calculate the total payments made by each student for each course they are enrolled in:

select student_id, course_id, sum(amount) as total_payments
from payments
group by student_id, course_id;

--10) Identify students who have made more than one payment:

select student_id
from payments
group by student_id
having count(payment_id) > 1;
--11) Calculate the total payments made by each student:

select student_id, sum(amount) as total_payments
from payments
group by student_id;

--12) Retrieve a list of course names along with the count of students enrolled in each course:

select c.course_id, c.course_name, count(e.student_id) as num_students
from courses c
left join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name;
--13) Calculate the average payment amount made by students:

select student_id, avg(amount) as average_payment
from payments
group by student_id;



























