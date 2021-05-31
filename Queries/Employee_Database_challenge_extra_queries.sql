--03bA. mentorship_titles:
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
--INTO mentorship_titles
FROM employees AS e
LEFT JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;



--EXPORT THE TABLE
mentorship_titles.csv


--03bB. unique_mentorship_titles:
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
--INTO unique_mentorship_titles
FROM mentorship_titles
ORDER BY emp_no, to_date DESC;

--EXPORT THE TABLE
unique_mentorship_titles.csv


---03bC. mentorship_titles
SELECT COUNT(title), title
--INTO only_mentorship_titles
FROM unique_mentorship_titles
GROUP BY title
ORDER BY COUNT(TITLE) DESC;

--export
mentorship_titles.csv














--03bD join retiring and mentorship tables
SELECT e.count AS retirement_count, 
e.title AS retirement_title,
m.count AS mentorship_count, 
m.title AS mentorship_title,
to_char(ROUND(cast (m.count AS NUMERIC)/CAST (e.count AS NUMERIC),4)*100,'999D99%') AS avail_to_mentorship_retirement
FROM retiring_titles AS e
FULL OUTER JOIN only_mentorship_titles AS m
ON (e.title = m.title);


--3bD_retirment_v_mentorship_by_title




