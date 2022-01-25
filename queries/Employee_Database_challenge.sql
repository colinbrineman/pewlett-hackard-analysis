-- 1 Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees;
-- 2 Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;
-- 3 Create a new table using the INTO clause.
-- 4 Join both tables on the primary key.
-- 5 Filter the data on the birth_date column to retrieve the employees
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
-- 6 Export the Retirement Titles table from the previous step as retirement_titles.csv
  -- and save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 7 Before you export your table, confirm that it looks like this image:
SELECT * FROM retirement_titles;
-- 8 Copy the query from the Employee_Challenge_starter_code.sql and
   -- add it to your Employee_Database_challenge.sql file.
-- 9 Retrieve the employee number, first and last name, and title columns
   -- from the Retirement Titles table.
-- 10 Use the DISTINCT ON statement to retrieve the first occurrence
   -- of the employee number for each set of rows defined by the ON () clause.
-- 11 Exclude those employees that have already left the company by filtering on
   -- to_date to keep only those dates that are equal to '9999-01-01'.
-- 12 Create a Unique Titles table using the INTO clause.
-- 13 Sort the Unique Titles table in ascending order by the employee number and
   -- descending order by the last date (i.e., to_date) of the most recent title.
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;
-- 14 Export the Unique Titles table as unique_titles.csv and
   -- save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 15 Before you export your table, confirm that it looks like this image:
SELECT * FROM unique_titles;
-- 16 Write another query in the Employee_Database_challenge.sql file to retrieve
   -- the number of employees by their most recent job title who are about to retire.
-- 17 First, retrieve the number of titles from the Unique Titles table.
-- 18 Then, create a Retiring Titles table to hold the required information.
-- 19 Group the table by title, then sort the count column in descending order.
SELECT COUNT(ut.title),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC;
-- 20 Export the Retiring Titles table as retiring_titles.csv and
   -- save it to your Data folder in the Pewlett-Hackard-Analysis folder.
-- 21 Before you export your table, confirm that it looks like this image:
SELECT * FROM retiring_titles;