/*1. Provide a SQL script that initializes the database for the Job Board scenario “CareerHub”.*/
create database CareerHub;
use CareerHub;

/*2. Create tables for Companies, Jobs, Applicants and Applications.*/
/* 3. Define appropriate primary keys, foreign keys, and constraints. */
/* 4. Ensure the script handles potential errors, such as if the database or tables already exist */
create table Companies (
    CompanyID int primary key,
    CompanyName varchar(255),
    Location varchar(255)
);

insert into Companies (CompanyID, CompanyName, Location)
values
(1, 'ABC Company', 'Mumbai'),
(2, 'XYZ Corporation', 'Bangalore'),
(3, '123 Industries', 'Delhi'),
(4, 'csk Corporation', 'Chennai'),
(5, 'srh Enterprises', 'Hyderabad'),
(6, 'pw Innovations', 'Pune'),
(7, 'rcb Corporation', 'Bangalore'),
(8, 'kkr Solutions', 'Kolkata'),
(9, 'mi Technologies', 'Mumbai'),
(10, 'acb Ventures', 'Chennai');

select * from companies;

CREATE TABLE Jobs (
    JobID int primary key,
    CompanyID int,
    JobTitle varchar(255),
    JobDescription text,
    JobLocation varchar(255),
    Salary decimal(10, 2),
    JobType varchar(50),
    PostedDate datetime,
    foreign key (CompanyID) references Companies(CompanyID)
);

insert into Jobs values
(1, 1, 'Software Engineer', 'Develops software', 'Bangalore', 80000.00, 'Full-time', '2024-02-05 09:00:00'),
(2, 2, 'Marketing Manager', 'Manages marketing efforts', 'Mumbai', 90000.00, 'Full-time', '2024-02-06 10:00:00'),
(3, 3, 'Data Analyst', 'Analyzes data', 'Delhi', 75000.00, 'Part-time', '2024-02-07 11:00:00'),
(4, 4, 'Graphic Designer', 'Designs graphics', 'Chennai', 70000.00, 'Contract', '2024-02-08 12:00:00'),
(5, 5, 'Customer Service Representative', 'Assists customers', 'Hyderabad', 60000.00, 'Full-time', '2024-02-09 13:00:00'),
(6, 6, 'Software Developer', 'Develops software solutions', 'Pune', 85000.00, 'Full-time', '2024-02-10 14:00:00'),
(7, 7, 'HR Manager', 'Manages HR department', 'Bangalore', 95000.00, 'Full-time', '2024-02-11 15:00:00'),
(8, 8, 'Sales Executive', 'Drives sales', 'Kolkata', 70000.00, 'Full-time', '2024-02-12 16:00:00'),
(9, 9, 'Accountant', 'Manages financial transactions', 'Mumbai', 80000.00, 'Full-time', '2024-02-13 17:00:00'),
(10, 10, 'Project Manager', 'Oversees projects', 'Chennai', 90000.00, 'Full-time', '2024-02-14 18:00:00');

select * from jobs;

create table applicants (
    applicantid int primary key,
    firstname varchar(255),
    lastname varchar(255),
    email varchar(255),
    phone varchar(20),
    resume text,
    city varchar(255),
    state varchar(255),
    experience int
);



INSERT INTO Applicants VALUES
(1, 'Virat', 'Kohli', 'virat.kohli@example.com', '+919876543210', 'Virat_Kohli_Resume.pdf', 'Delhi', 'Delhi',3),
(2, 'Rohit', 'Sharma', 'rohit.sharma@example.com', '+919876543211', 'Rohit_Sharma_Resume.pdf', 'Mumbai', 'Maharashtra',1),
(3, 'MS', 'Dhoni', 'ms.dhoni@example.com', '+919876543212', 'MS_Dhoni_Resume.pdf', 'Ranchi', 'Jharkhand',3),
(4, 'Ravindra', 'Jadeja', 'ravindra.jadeja@example.com', '+919876543213', 'Ravindra_Jadeja_Resume.pdf', 'Jamnagar', 'Gujarat',2),
(5, 'Jasprit', 'Bumrah', 'jasprit.bumrah@example.com', '+919876543214', 'Jasprit_Bumrah_Resume.pdf', 'Ahmedabad', 'Gujarat',4),
(6, 'Suresh', 'Raina', 'raina@example.com', '+919876543215', 'raina_Resume.pdf', 'chennai', 'tamilnadu',3),
(7, 'KL', 'Rahul', 'kl.rahul@example.com', '+919876543216', 'KL_Rahul_Resume.pdf', 'Bangalore', 'Karnataka',1),
(8, 'Ravi', 'Ashwin', 'aswin@example.com', '+919876543217', 'ashwin_Resume.pdf', 'Chennai', 'Tamilnadu',6),
(9, 'Rishabh', 'Pant', 'rishabh.pant@example.com', '+919876543218', 'Rishabh_Pant_Resume.pdf', 'Roorkee', 'Uttarakhand',2),
(10, 'Ajinkya', 'Rahane', 'ajinkya.rahane@example.com', '+919876543219', 'Ajinkya_Rahane_Resume.pdf', 'Mumbai', 'Maharashtra',1);


select * from applicants;

create table Applications (
    ApplicationID int primary key,
    JobID int,
    ApplicantID int,
    ApplicationDate datetime,
    CoverLetter text,
    foreign key (JobID) references Jobs(JobID),
    foreign key (ApplicantID) references Applicants(ApplicantID)
);

insert into Applications values
(1, 1, 1, '2024-02-05 09:00:00', 'Excited to apply for Software Engineer position.'),
(2, 2, 2, '2024-02-06 10:00:00', 'Interested in Marketing Manager position.'),
(3, 3, 3, '2024-02-07 11:00:00', 'Applying for Data Analyst role.'),
(4, 1, 4, '2024-02-08 12:00:00', 'Applying for Graphic Designer position.'),
(5, 5, 5, '2024-02-09 13:00:00', 'Excited about Customer Service Representative position.'),
(6, 6, 6, '2024-02-10 14:00:00', 'Interested in Software Developer position.'),
(7, 5, 7, '2024-02-11 15:00:00', 'Applying for HR Manager role.'),
(8, 8, 8, '2024-02-12 16:00:00', 'Excited about Sales Executive position.'),
(9, 6, 9, '2024-02-13 17:00:00', 'Interested in Accountant position.'),
(10, 10, 10, '2024-02-14 18:00:00', 'Applying for Project Manager role.');

select * from applications;


/* 5. Write an SQL query to count the number of applications received for each job listing in the
"Jobs" table. Display the job title and the corresponding application count. Ensure that it lists all
jobs, even if they have no applications. */

select J.JobTitle, count(A.JobID) as ApplicationCount
from Jobs J
left join Applications A on J.JobID = A.JobID
group by J.JobID, J.JobTitle;

/* 6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary
range. Allow parameters for the minimum and maximum salary values. Display the job title,
company name, location, and salary for each matching job.*/

select J.JobTitle, C.CompanyName, J.JobLocation, J.Salary
from Jobs J
inner join Companies C on J.CompanyID = C.CompanyID
where J.Salary between 80000 AND 90000;

/* 7. Write an SQL query that retrieves the job application history for a specific applicant. Allow a
parameter for the ApplicantID, and return a result set with the job titles, company names, and
application dates for all the jobs the applicant has applied to. */

select jobs.jobtitle as job_title, companies.companyname as company_name, applications.applicationdate as application_date
from applications
inner join jobs on applications.jobid = jobs.jobid
inner join companies on jobs.companyid = companies.companyid
where applications.applicantid = 10;

/* 8. Create an SQL query that calculates and displays the average salary offered by all companies for
job listings in the "Jobs" table. Ensure that the query filters out jobs with a salary of zero. */

select avg(salary) as average_salary
from jobs
where salary > 0;

/* Write an SQL query to identify the company that has posted the most job listings. Display the
company name along with the count of job listings they have posted. Handle ties if multiple
companies have the same maximum count. */

select companyname, count(*) as job_count
from companies
inner join jobs on companies.companyid = jobs.companyid
group by companies.companyid, companies.companyname
having count(*) = (select count(*) as max_job_count from jobs 
	group by companyid
    order by max_job_count desc
    limit 1
);


/* 10. Find the applicants who have applied for positions in companies located in 'CityX' and have at
least 3 years of experience. */

select a.firstname,a.lastname,a.experience
from applicants a
join applications ap on a.applicantid = ap.applicantid
join jobs j on ap.jobid = j.jobid
join companies c on j.companyid = c.companyid
where lower(a.city) = 'chennai' and a.experience >= 3;


/* 11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000. */

select distinct jobtitle from jobs where salary between 60000 and 80000;

/* 12. Find the jobs that have not received any applications. */

select jobtitle from jobs where jobid not in (select distinct jobid from applications);

/* 13. Retrieve a list of job applicants along with the companies they have applied to and the positions
they have applied for. */

select a.firstname, a.lastname, c.companyname, j.jobtitle from applicants a
inner join applications ap on a.applicantid = ap.applicantid
inner join jobs j on ap.jobid = j.jobid
inner join companies c on j.companyid = c.companyid;

/* 14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not
received any applications. */

select c.companyname, count(j.jobid) as jobcount from companies c
left join jobs j on c.companyid = j.companyid group by c.companyname;

/* 15. List all applicants along with the companies and positions they have applied for, including those
who have not applied. */

select a.firstname, a.lastname, c.companyname, j.jobtitle from applicants a
left join applications ap on a.applicantid = ap.applicantid
left join jobs j on ap.jobid = j.jobid
left join companies c on j.companyid = c.companyid;

/* 16. Find companies that have posted jobs with a salary higher than the average salary of all jobs. */

select distinct c.companyname from companies c
inner join jobs j on c.companyid = j.companyid
where j.salary > (select avg(salary) from jobs);

/* 17. Display a list of applicants with their names and a concatenated string of their city and state. */

select firstname, lastname, concat(city, ', ', state) as city_state from applicants;

/* 18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer' */

select jobtitle from jobs where lower(jobtitle) like '%developer%' or lower(jobtitle) like '%engineer%';

/* 19. Retrieve a list of applicants and the jobs they have applied for, including those who have not
applied and jobs without applicants. */

select a.firstname,a.lastname, j.jobtitle from applicants a
left join applications ap on a.applicantid = ap.applicantid
left join jobs j on ap.jobid = j.jobid;

/* 20. List all combinations of applicants and companies where the company is in a specific city and the
applicant has more than 2 years of experience. For example: city=Chennai */

select a.firstname,a.lastname,a.experience,c.companyname,j.jobtitle
from applicants a
join applications ap on a.applicantid = ap.applicantid
join jobs j on ap.jobid = j.jobid
join companies c on j.companyid = c.companyid
where lower(a.city) = 'Chennai' and a.experience > 2;




































