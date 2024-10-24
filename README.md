### 1. What is PostgreSQL?
PostgreSQL is an open-source relational database management system (RDBMS) that emphasizes extensibility and SQL compliance.

---

### 2. What is the purpose of a database schema in PostgreSQL?
A database schema in PostgreSQL defines the structure of the database, including the tables, columns, data types, relationships, and constraints. It acts as a blueprint for organizing data.

---

### 3. Explain the primary key and foreign key concepts in PostgreSQL.

- **Primary Key:** A primary key uniquely identifies each record in a table. It must contain unique values and cannot be NULL.
- **Foreign Key:** A foreign key creates a link between two tables. It refers to the primary key of another table.
---

### 4. What is the difference between the VARCHAR and CHAR data types?

- **VARCHAR(n):** Variable-length string (up to n characters).
- **CHAR(n):** Fixed-length string (n characters).
---

### 5. Explain the purpose of the WHERE clause in a SELECT statement.
The WHERE clause filters records in a SQL query, allowing you to specify conditions that must be met for rows to be included in the result set.

```sql
    SELECT * FROM students WHERE age > 10
```
---

### 6. What are the LIMIT and OFFSET clauses used for?

- **LIMIT:** Restricts the number of rows returned in a query result.
- **OFFSET:** Skips a specified number of rows before returning the result set.
```sql
    SELECT * FROM students WHERE age > 10 LIMIT 2 OFFSET 2 
```
---

### 7. How can you perform data modification using UPDATE statements?
The UPDATE statement is used to modify existing records in a table.

```sql
UPDATE students
SET status = 'Passed'
WHERE frontend_mark > 50 AND backend_mark > 50;
```

---

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
JOIN operations combine rows from two or more tables based on a related column. PostgreSQL supports various types of joins, such as INNER JOIN, LEFT JOIN, and RIGHT JOIN, allowing for complex queries across multiple tables.

```sql
SELECT students.student_name, courses.course_name
FROM students
JOIN courses ON students.student_id = courses.student_id;
```

---

### 9. Explain the GROUP BY clause and its role in aggregation operations.
The GROUP BY clause groups rows that have the same values in specified columns into summary rows.
```sql
SELECT age, COUNT(*) 
FROM students 
GROUP BY age;  
```
---

### 10. How can you calculate aggregate functions like COUNT, SUM, and AVG in PostgreSQL?
You can calculate aggregate functions by using them in a SELECT statement, often in conjunction with the GROUP BY clause. For example:
```sql
SELECT COUNT(*) FROM students;  -- Counts total rows
SELECT AVG(age) FROM students;   -- Calculates average age
SELECT SUM(score) FROM exams;    -- Sums up scores
``` 
