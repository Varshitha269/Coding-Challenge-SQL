--Problem Statement:

--Create SQL Schema from the application, use the class attributes for table column names.

--SQL Schema:

-- Tasks --

--1. Provide a SQL script that initializes the database for the Job board scenario ' CareerHub'
--2. Create tables for Companies, Jobs, Applicants and Applications.
--3. Define appropriate primary keys, foreign keys, and constraints.


-- Companies Table
Create table Companies(
CompanyId int Primary Key,
CompanyName Varchar(50),
Location Varchar(50));

--Jobs Table
Create table Jobs(
JobId int Primary key,
CompanyId int
Foreign key (CompanyId) References Companies(CompanyId),
JobTitle varchar(50),
JobDescription varchar(100),
JobLocation Varchar(50),
Salary decimal(10,4),
JobType varchar(50) check (JobType in ('Full-time','part-time','contract')),
PostedDate Datetime);


--Applicants Table
Create table Applicants(
ApplicantId int Primary key,
FirstName Varchar(50),
LastName Varchar(50),
Email Varchar(50),
Phone Bigint,
Resumes text);


--Applications Table
Create table Applications(
ApplicationId int Primary key,
JobId int,
Foreign key (JobId) References Jobs(JobId),
ApplicantId int,
Foreign key(ApplicantId) References Applicants(ApplicantId),
ApplicationDate Datetime,
CoverLetter text);


-- Renaming the Database name

--ALTER DATABASE Coding_challege MODIFY NAME = CareerHub;


--4.Ensure the script handles potential errors, such as if the database or tables already exist.
 
 -- ensuring for the database
 
 If not Exists (select * from sys.databases where name='Coding_Challege')
 Begin 
 Create Database Coding_Challege;
 print 'Database Coding_challenge is created Successfully';
 End
 Else
 Begin
 Print ' Database Coding_Challege Already Exists';
 End

 --ensuring for the table

 if not exists(select* from INFORMATION_SCHEMA.Tables where table_name='Companies')
 Begin
Create table Companies(
CompanyId int Primary Key,
CompanyName Varchar(50),
Location Varchar(50));
Print ' Table Companies created sucessfully';
End
Begin
Print 'table Companies already exists';
End
    

-- inserting values for each table 

-- Companies table
INSERT INTO Companies (CompanyID, CompanyName, Location) VALUES
(1, 'Hexaware', 'Chennai'),
(2, 'ITC infotech', 'San Francisco'),
(3, 'MUSIGMA', 'London'),
(4, 'Smartgig', 'Sydney'),
(5, 'NextGen', 'Tokyo'),
(6, 'Data Wizards LLC', 'Chicago'),
(7, 'CodeGenius', 'Berlin'),
(8, 'InfoSystems', 'Paris'),
(9, 'Wipro', 'Bangalore'),
(10, 'Cognizant', 'Los Angeles');

INSERT INTO Companies (CompanyID, CompanyName, Location) VALUES
(11, 'Github', 'Chennai'),
(12, 'Microsoft', 'San Francisco');

-- Jobs table
INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(11, 1, 'Software Engineer', 'We are looking for experienced software engineers to join our team.', 'New York', 80000, 'Full-time', '2024-05-01'),
(12, 2, 'Data Analyst', 'We are seeking a skilled data analyst to analyze large datasets.', 'San Francisco', 75000, 'Part-time', '2024-05-02'),
(13, 3, 'UX Designer', 'We are hiring a UX designer to create intuitive user interfaces.', 'London', 70000, 'Full-time', '2024-05-03'),
(14, 4, 'Web Developer', 'We need talented web developers to build responsive websites.', 'Sydney', 85000, 'Part-time', '2024-05-04'),
(15, 5, 'Mobile App Developer', 'We are looking for mobile app developers to create innovative apps.', 'Tokyo', 90000, 'Full-time', '2024-05-05'),
(16, 6, 'Data Scientist', 'We are seeking data scientists to analyze complex datasets and generate insights.', 'Chicago', 95000, 'Full-time', '2024-05-06'),
(17, 7, 'Software Developer', 'We are looking for software developers to build cutting-edge applications.', 'Berlin', 82000, 'Contract', '2024-05-07'),
(18, 8, 'Network Engineer', 'We are hiring network engineers to design and implement network infrastructure.', 'Paris', 88000, 'Full-time', '2024-05-08'),
(19, 9, 'Database Administrator', 'We need experienced database administrators to manage database systems.', 'Bangalore', 83000, 'Contract', '2024-05-09'),
(20, 10, 'UI/UX Designer', 'We are looking for UI/UX designers to create visually appealing user interfaces.', 'Los Angeles', 79000, 'Full-time', '2024-05-10');


INSERT INTO Jobs (JobID, CompanyID, JobTitle, JobDescription, JobLocation, Salary, JobType, PostedDate) VALUES
(21, 11, 'Web Designer', 'We are looking for experienced web designers to join our team.', 'Chennai', 80000, 'Full-time', '2024-12-21'),
(22, 12, 'Testing Automator', 'We are seeking a skilled tester to automate data.', 'San Francisco', 75000, 'Part-time', '2023-11-02');



-- Applicants table
INSERT INTO Applicants (ApplicantID, FirstName, LastName, Email, Phone, Resumes) VALUES
(101, 'Arjun', 'Rao', 'arjun.rao@example.com', 9876543210, '2 years'),
(102, 'Ananya', 'Nair', 'ananya.nair@example.com', 8765432109, '5 years'),
(103, 'Aditya', 'Menon', 'aditya.menon@example.com', 7654321098, '1 year'),
(104, 'Amrita', 'Iyer', 'amrita.iyer@example.com', 6543210987, '2 years'),
(105, 'Aakash', 'Narayan', 'aakash.narayan@example.com', 5432109876, '3 years'),
(106, 'Anjali', 'Balakrishnan', 'anjali.b@example.com', 4321098765, '4 years'),
(107, 'Arun', 'Suresh', 'arun.suresh@example.com', 3210987654, '1 year'),
(108, 'Ashwini', 'Menon', 'ashwini.m@example.com', 2109876543, '2 years'),
(109, 'Aditi', 'Kumar', 'aditi.kumar@example.com', 1098765432, '4 years'),
(110, 'Amar', 'Sharma', 'amar.s@example.com', 9987654321, '4 years');


-- Applications table
INSERT INTO Applications (ApplicationID, JobID, ApplicantID, ApplicationDate, CoverLetter) VALUES
(1111, 11, 101, '2024-05-23 10:00:00', 'Dear Hiring Manager, I am excited to apply for the Software Engineer position at Acme Corporation.'),
(1112, 12, 102, '2024-02-03 11:00:00', 'Dear Hiring Manager, I am writing to express my interest in the Data Analyst role at Tech Innovations Ltd.'),
(1113, 13, 103, '2024-04-13 12:00:00', 'Dear Hiring Manager, I am thrilled to apply for the UX Designer position at Global Solutions Inc.'),
(1114, 14, 104, '2024-03-03 13:00:00', 'Dear Hiring Manager, I am enthusiastic about the opportunity to work as a Web Developer at InnovateIT Solutions.'),
(1115, 15, 105, '2024-04-15 14:00:00', 'Dear Hiring Manager, I am excited to apply for the Mobile App Developer role at Smart Tech Co.'),
(1116, 16, 106, '2024-07-10 15:00:00', 'Dear Hiring Manager, I am writing to express my interest in the Data Scientist position at Data Wizards LLC.'),
(1117, 17, 107, '2024-05-03 16:00:00', 'Dear Hiring Manager, I am thrilled to apply for the Software Developer position at CodeGenius.'),
(1118, 18, 108, '2024-05-03 17:00:00', 'Dear Hiring Manager, I am enthusiastic about the opportunity to work as a Network Engineer at InfoSystems Ltd.'),
(1119, 19, 109, '2024-06-17 18:00:00', 'Dear Hiring Manager, I am excited to apply for the Database Administrator role at SoftSolutions.'),
(1120, 20, 110, '2024-05-05 19:00:00', 'Dear Hiring Manager, I am writing to express my interest in the UI/UX Designer position at Visionary Enterprises.');
Insert into Applications( ApplicationId,JobId, ApplicantId, ApplicationDate,CoverLetter) Values
(1121, 11, 101, '2024-05-23 10:00:00', 'Dear Hiring Manager, I am excited to apply for the Software Engineer position at Acme Corporation.'),
(1122, 15, 105, '2024-04-15 14:00:00', 'Dear Hiring Manager, I am excited to apply for the Mobile App Developer role at Smart Tech Co.'),
(1123, 16, 106, '2024-07-10 15:00:00', 'Dear Hiring Manager, I am writing to express my interest in the Data Scientist position at Data Wizards LLC.'),
(1124, 17, 107, '2024-05-03 16:00:00', 'Dear Hiring Manager, I am thrilled to apply for the Software Developer position at CodeGenius.'),
(1125, 18, 108, '2024-05-03 17:00:00', 'Dear Hiring Manager, I am enthusiastic about the opportunity to work as a Network Engineer at InfoSystems Ltd.'),
(1126, 17, 107, '2024-05-03 16:00:00', 'Dear Hiring Manager, I am thrilled to apply for the Software Developer position at CodeGenius.'),
(1127, 18, 108, '2024-05-03 17:00:00', 'Dear Hiring Manager, I am enthusiastic about the opportunity to work as a Network Engineer at InfoSystems Ltd.');

INSERT INTO Applications (ApplicationId,JobID)
VALUES (1128,21);
INSERT INTO Applications (ApplicationId,JobID)
VALUES (1129,22);



--5.Write an SQL query to count the number of applications received for each job listing in the "Jobs" table. 
--Display the job title and the corresponding application count. Ensure that it lists all jobs, even if they have no applications.

select j.JobId,j.JobTitle, COUNT(a.ApplicationId) as Total_no_of_applications
from Jobs j
Left Join Applications a on j.jobId=a.JobId
Group by j.JobId,j.JobTitle 


--6. Develop an SQL query that retrieves job listings from the "Jobs" table within a specified salary range.
	-- Allow parameters for the minimum and maximum salary values. Display the job title, company name, location, and salary for each matching job.
   
   select j.jobTitle,c.CompanyName,c.Location, j.Salary from Jobs j
   Inner join Companies c on j.CompanyId=c.CompanyId
   where j.Salary between (select MIN(Salary) from Jobs) AND (select MAX(Salary) from Jobs);
   
  
--7. Write an SQL query that retrieves the job application history for a specific applicant. 
	--Allow a parameter for the ApplicantID, and return a result set with the job titles, company names,
	--and application dates for all the jobs the applicant has applied to.

select j.jobId, j.JobTitle, c.companyName, a.applicationDate from Applications a 
Join Jobs j on a.jobId=j.jobId
Join Companies c on j.CompanyId=c.CompanyId
where a.ApplicantId= 102;

--8. Create an SQL query that calculates and displays the average salary offered by all companies for job listings in the "Jobs" table.
	--Ensure that the query filters out jobs with a salary of zero.

select AVG(salary) as Average_salary from Jobs j 
Join Companies c on j.CompanyId=c.CompanyId
where j.Salary>0;

--9. Write an SQL query to identify the company that has posted the most job listings. 
	--Display the company name along with the count of job listings they have posted.
	--Handle ties if multiple companies have the same maximum count.

select TOP 1 c.companyName,COUNT(j.JobId) as JobCount from Companies c
Join Jobs j on c.companyid=j.companyid
Group by c.companyname 
Order by JobCount DESC;

--10. Find the applicants who have applied for positions in companies located in 'CityX' and have at least 3 years of experience.

select distinct a.FirstName, a.LastName from Applicants a
Join Applications ap on a.ApplicantId=ap.applicantId
Join Jobs j on ap.JobId=j.JobId
Join Companies c on j.CompanyId=c.companyId 
where c.location ='Chennai'
and CAST(a.Resumes AS varchar(max))= '3 years';


--11. Retrieve a list of distinct job titles with salaries between $60,000 and $80,000.

select distinct jobTitle, jobId from Jobs where Salary between 60000 and 80000


--12. Find the jobs that have not received any applications.

select j.jobId,j.JobTitle from Jobs j
Join Applications a on a.JobId = j.JobId
where a.applicationId is null;


--13. Retrieve a list of job applicants along with the companies they have applied to and the positions they have applied for.

select j.jobId,j.JobTitle,j.JobDescription,j.JobType,a.applicantId,a.FirstName,a.LastName,(select c.CompanyName  from Companies c where c.CompanyId=j.CompanyId) as CompanyName
from Applications ap
Join Applicants a on a.applicantId=ap.applicantId
Join jobs j on j.JobId=ap.JobId;

--14. Retrieve a list of companies along with the count of jobs they have posted, even if they have not received any applications.

select c.companyName, COUNT(distinct j.JobId) as Job_Count from Companies c
Join Jobs j on j.CompanyId=c.CompanyId
Group by c.CompanyName;

--15. List all applicants along with the companies and positions they have applied for, including those who have not applied.

select concat(Applicants.FirstName,' ',Applicants.LastName)as Name_of_a_Person,Companies.CompanyName,Jobs.JobTitle from Applicants
left join Applications on Applicants.ApplicantId=Applications.ApplicantId
left join Jobs on Jobs.JobId=Applications.JobId
left join Companies on Companies.CompanyId=Jobs.CompanyId

--16. Find companies that have posted jobs with a salary higher than the average salary of all jobs.
select distinct c.companyName from Companies c 
Join Jobs j on c.CompanyId=j.CompanyId 
where j.Salary>(select AVG(Salary) from Jobs);

-- 17. Display a list of applicants with their names and a concatenated string of their city and state.

alter table Applicants Add City Varchar(100), State Varchar(100);

-- updating values
Update Applicants set City='Tirupati', State='AP' where ApplicantId=101;
Update Applicants set City='Chennai', State='TN' where ApplicantId=102;
Update Applicants set City='Tirupati', State='AP' where ApplicantId=103;
Update Applicants set City='Tirupati', State='AP' where ApplicantId=104;
Update Applicants set City='Tirupati', State='AP' where ApplicantId=105;
Update Applicants set City='Chennai', State='TN' where ApplicantId=106;
Update Applicants set City='Tirupati', State='AP' where ApplicantId=107;
Update Applicants set City='Tirupati', State='AP' where ApplicantId=108;
Update Applicants set City='Chennai', State='TN' where ApplicantId=109;
Update Applicants set City='Bangalore', State='Karnataka' where ApplicantId=110;

--displaying the concatenated list

select CONCAT(FirstName,' ',LastName) as FullName, CONCAT(City,',',State)as City_State from Applicants;



--18. Retrieve a list of jobs with titles containing either 'Developer' or 'Engineer'.

select * from Jobs where JobTitle LIKE '%Developer%' or JobTitle Like '%Engineer%';

--19. Retrieve a list of applicants and the jobs they have applied for, including those who have not applied and jobs without applicants.


select a.applicantId,a.FirstName,a.LastName,(select TOP 1 ap.JobId from Applications ap where ap.applicantId=a.ApplicantId) as appliedJobId, 
(select TOP 1  j.JobTitle from Jobs j where j.JobId =(select TOP 1 ap.JobId from applications ap where ap.ApplicantId =a.applicantId)) as AppliedJobTitle
From Applicants a;


--20. List all combinations of applicants and companies where the company is in a specific city and the applicant has more than 2 years of experience. For example: city=Chennai
select a.applicantId,a.FirstName,a.LastName,(select TOP 1 c.CompanyName from Companies c Join Jobs j on c.CompanyId=j.ComPanyId Join Applications ap on j.JobId=ap.JobId
where ap.applicantId = a.ApplicantId and c.Location='Chennai') as CompanyName, 'Chennai' as Location 
From Applicants a 
Where Cast(a.Resumes as Varchar(50)) = '2 Years';


