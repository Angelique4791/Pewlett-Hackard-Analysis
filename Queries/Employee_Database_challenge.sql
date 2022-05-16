-- RETIREMENT AGE EMPLOYEES BY TITLE
-- JOIN employees AND titles TABLES, 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    tl.title,
    tl.from_date,
    tl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	      AND (tl.to_date = '9999-01-01')
		  ORDER BY tl.emp_no ASC;  


-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;

-- RETIREMENT AGE EMPLOYEES BY UNIQUE TITLE
-- JOIN employees AND titles TABLES, 
SELECT e.emp_no,
    e.first_name,
    e.last_name,
    tl.title
INTO unique_titles
FROM employees as e
INNER JOIN titles as tl
ON (e.emp_no = tl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	      AND (tl.to_date = '9999-01-01')
		  ORDER BY tl.emp_no ASC;  