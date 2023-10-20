CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(
	Branch_no INT PRIMARY KEY,
    Manager_id INT,
    Branch_address VARCHAR(50),
    Contact_no INT
 );   

CREATE TABLE  Employee(
	Emp_id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(100),
    Salary INT
  );  
  
  CREATE TABLE Customer(
	Customer_id INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_address VARCHAR(225),
    Reg_date DATE
 );   
  
 CREATE TABLE Books(
	ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(50),
    Category VARCHAR(50),
    Rental_price DECIMAL(10,2),
    Status ENUM('Yes', 'No'),
    Author VARCHAR(50),
    Publisher VARCHAR(225)
 );   
    
 CREATE TABLE IssueStatus(
	Issue_id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(50),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
  );  
  
 CREATE TABLE ReturnStatus(
	Return_id INT PRIMARY KEY,
    Return_cust VARCHAR(50),
    Return_book_name VARCHAR(50),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY(Isbn_book2) REFERENCES Books(ISBN)
 );    
 
 SELECT Book_title, Category, Rental_price
  FROM Books
  WHERE  status = 'Yes';    
  
  SELECT Emp_name, Salary
FROM Employee
ORDER BY salary DESC;  

  
 SELECT b.Book_title AS Book_title, c.Customer_name
 FROM Books b
 JOIN IssueStatus i On b.ISBN = i.ISBN_book
 JOIN Customer c ON i.Issued_cust = c.Customer_id;
 
 SELECT Category, COUNT(*) AS Total_Count
 FROM Books
 GROUP BY Category;
 
 SELECT Emp_name, position
  FROM Employee
  WHERE Salary >50000;
  
  SELECT Customer_name
  FROM customer
  WHERE Reg_date <'2022-01-01'
  AND Customer_id NOT IN (SELECT Issued_cust FROM IssueStatus);
  
  SELECT Branch_no, COUNT(*) AS Total_Employees
  FROM Branch
  GROUP BY Branch_no;
 
SELECT Customer_name 
FROM Customer  
INNER JOIN IssueStatus  ON Customer_id = Issued_cust
WHERE YEAR(Issue_date) = 2023 AND MONTH(Issue_date) = 6;

SELECT Book_title
FROM Books
WHERE Category LIKE '%history%';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Branch
GROUP BY Branch_no
HAVING Total_Employees > 5;

  

 