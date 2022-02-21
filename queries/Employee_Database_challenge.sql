-- Deliverable 1: The Number of Retiring Employees by Title
-- 1.1 Retrieve the emp_no, first_name, and last_name columns from the Employees table.
-- 1.2 Retrieve the title, from_date, and to_date columns from the Titles table.
-- 1.3 Create a new table using the INTO clause.
-- 1.4 Join both tables on the primary key.
-- 1.5 Filter the data on the birth_date column to retrieve the employees
    -- who were born between 1952 and 1955. Then, order by the employee number.
SELECT em.emp_no,
em.first_name,
em.last_name,
ti.title,
ti.from_date,
ti.to_date
INTO retirement_titles
FROM employees as em
LEFT JOIN titles as ti
ON em.emp_no = ti.emp_no
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY em.emp_no;
-- 1.6 Export the Retirement Titles table from the previous step as retirement_titles.csv
    -- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 1.7 Before you export your table, confirm that it looks like this image:
SELECT * FROM retirement_titles;
-- 1.8 Copy the query from the Employee_Challenge_starter_code.sql and
    -- add it to your Employee_Database_challenge.sql file.
-- 1.9 Retrieve the employee number, first and last name, and title columns
    -- from the Retirement Titles table.
-- 1.10 Use the DISTINCT ON statement to retrieve the first occurrence
     -- of the employee number for each set of rows defined by the ON () clause.
-- 1.11 Exclude those employees that have already left the company by filtering on
     -- to_date to keep only those dates that are equal to '9999-01-01'.
-- 1.12 Create a Unique Titles table using the INTO clause.
-- 1.13 Sort the Unique Titles table in ascending order by the employee number and
     -- descending order by the last date (i.e., to_date) of the most recent title.
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;
-- 1.14 Export the Unique Titles table as unique_titles.csv and
     -- save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 1.15 Before you export your table, confirm that it looks like this image:
SELECT * FROM unique_titles;
-- 1.16 Write another query in the Employee_Database_challenge.sql file to retrieve
     -- the number of employees by their most recent job title who are about to retire.
-- 1.17 First, retrieve the number of titles from the Unique Titles table.
-- 1.18 Then, create a Retiring Titles table to hold the required information.
-- 1.19 Group the table by title, then sort the count column in descending order.
SELECT COUNT(ut.title),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
-- 1.20 Export the Retiring Titles table as retiring_titles.csv and
     -- save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 1.21 Before you export your table, confirm that it looks like this image:
SELECT * FROM retiring_titles;
-- Deliverable 2: The Employees Eligible for the Mentorship Program
-- 2.1 Retrieve the emp_no, first_name, last_name, and birth_date columns
    -- from the Employees table.
-- 2.2 Retrieve the from_date and to_date columns from the Department Employee table.
-- 2.3 Retrieve the title column from the Titles table.
-- 2.4 Use a DISTINCT ON statement to retrieve the first occurrence of
    -- the employee number for each set of rows defined by the ON () clause
-- 2.5 Create a new table using the INTO clause.
-- 2.6 Join the Employees and the Department Employee tables on the primary key.
-- 2.7 Join the Employees and the Titles tables on the primary key.
-- 2.8 Filter the data on the to_date column to all the current employees,
    -- then filter the data on the birth_date columns to get all the employees
    -- whose birth dates are between January 1, 1965 and December 31, 1965.
-- 2.9 Order the table by the employee number.
SELECT DISTINCT ON (em.emp_no)
em.emp_no,
em.first_name,
em.last_name,
em.birth_date,
de.from_date,
de.to_date,
ti.title
INTO mentorship_eligibility
FROM employees as em
INNER JOIN dept_emp as de
ON (em.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE de.to_date = ('9999-01-01')
AND (em.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY em.emp_no, de.to_date DESC;
-- 2.10 Export the Mentorship Eligibility table as mentorship_eligibilty.csv
     -- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 2.11 Before you export your table, confirm that it looks like this image:
SELECT * FROM mentorship_eligibility;