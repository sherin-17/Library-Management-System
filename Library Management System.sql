-- Library Management System

CREATE DATABASE Library;
USE Library;

-- CREATE DIFFERENT TABLES AND INSERT VALUES OF EACH TABLES

CREATE TABLE Branch (
Branch_no INT PRIMARY KEY, 
Manager_Id INT,
Branch_address VARCHAR(30), 
Contact_no VARCHAR(10) 
);
 DESC Branch;
INSERT INTO Branch(Branch_no,Manager_Id,Branch_address,Contact_no)
VALUES (1, 101, ' Main Road, Delhi', '9876543210'),
(2, 102, ' Corporate Park, Mumbai', '9790765432'),
(3, 103, 'IT Park, Bangalore', '9987654321'),
(4, 104, ' Anna Salai,Chennai', '8876543210'),
(5, 105, ' MG Road,Hyderabad', '9746532109'),
(6, 106, ' Brabourne Roard,Kolkata', '9543217890'),
(7, 107, 'C G Road, Ahmedabad', '9087654321'),
(8, 108, 'Sector 17, Chandigrah', '8890765432'),
(9, 109, 'Cross Cut Road, Coimbatore', '8865432167'),
(10, 110, 'Ashok Marg, Jaipur', '9087654321');
SELECT *FROM Branch;

CREATE TABLE Employee (
Emp_Id INT PRIMARY KEY, 
Emp_name VARCHAR(20),
Position VARCHAR(20),
Salary INT,
Branch_no INT ,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);
DESC Employee;
INSERT INTO Employee(Emp_Id,Emp_name,Position,Salary,Branch_no)
VALUES(201,'Fathima Rena', 'Finance', 65000.00, 1),
(202, 'Alen Thomas', 'Manager', 75000.00, 2),
(203, 'Ziya Mathew', 'Accountant', 45000.00, 3),
(204, 'Nesha Fath', 'Clerk', 35000.00, 4),
(205, 'Krishna Kripa', 'Librarian', 40000.00, 5),
(206, 'Lena Jo', 'Accountant', 42000.00, 6),
(207, 'Rekha Nair', 'Clerk', 37000.00, 7),
(208, 'Adam Joseph', 'Manager', 70000.00, 8),
(209, 'Sherin Sha', 'Finance', 60000.00, 9),
(210, 'Akhil Krishna', 'Librarian', 42000.00, 10);
SELECT *FROM Employee;

CREATE TABLE Books (
  ISBN INT PRIMARY KEY,
  Book_title VARCHAR(50),
  Category VARCHAR(50),
  Rental_Price DECIMAL(10, 2),
  Status VARCHAR(5)NOT NULL,
  Author VARCHAR(50),
  Publisher VARCHAR(50)
);
DESC Books;
 INSERT INTO Books (ISBN, Book_title,Category, Rental_Price, Status,Author,Publisher)
VALUES(234, 'The Great Gatsby', 'Classic', 60, 'Yes', 'F.Scott Fitzgerlad', 'Penguin Books'),
(123, 'To Kill a Mockigbird', 'Fiction', 50, 'No', 'Harper Lee', 'HarperCollins'),
(321, 'The Catcher in the Rye', 'Young Adult', 70, 'Yes', 'J.D.Salinger', 'Little, Brown and Company'),
(341, 'The Hunger Games', 'Science,Fiction', 65, 'Yes', 'Suzanne Collins', 'Scholastic Press'),
(421, 'The Lord of the Rings', 'Fantacy', 65, 'No', 'J.R.R Tolkien', 'George Allen & Unwin'),
(241, 'The Lion', 'Fantacy', 80, 'Yes', 'C.S.Lewis', 'Harprt Collins'),
(543, 'The Alchemist', 'Fiction', 45, 'Yes', 'Paulo Coelho', 'Harper Torch'),
(356, 'The Da Vinci Code', 'Mystery', 35, 'No', 'Dan Brown', 'Doubleday'),
(632, 'The Rise and Fall of the Third Rich', 'History', 75, 'Yes', 'William L. Shirer', 'Simon & Schuster'),
(978, 'The Nightingale', 'Historical Fiction', 90, 'No', 'Kristin Hannah', 'St.Martin Press');
SELECT *FROM Books;
    
CREATE TABLE Customer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(30),
  Customer_address VARCHAR(50),
  Reg_date DATE
);   
DESC Customer;
INSERT INTO Customer( Customer_Id,Customer_name, Customer_address,  Reg_date)
VALUES(301, 'Fathima Rena', 'Cochin, Kerala', '2023-06-10'),
(302, 'Alen Thomas', 'Bangalore, India', '2024-01-01'),
(303, 'Ziya Mathew', 'Chennai, India', '2024-02-05'),
(304, 'Nesha Fath', 'Hyderabad, India', '2024-03-10'),
(305, 'Krishna Kripa', 'Ahmedabad, India', '2024-04-15'),
(306, 'Lena Jo', 'Pune, India', '2024-05-25'),
(307, 'Rekha Nair', 'Tamil Nadu, India', '2024-06-26'),
(308, 'Adam Joseph', 'Karnataka, India', '2024-07-27'),
(309, 'Sherin Sha', 'Gujarat, India', '2024-08-28'),
(310, 'Akhil Krishna', 'Assam, India', '2024-09-29'); 
SELECT *FROM Customer;

CREATE TABLE IssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issue_customer INT,
  Issued_book_name VARCHAR(50),
  Issue_date DATE,
  Isbn_book INT,
  FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);
DESC IssueStatus;
INSERT INTO IssueStatus(Issue_Id, Issue_customer,Issued_book_name,Issue_date,Isbn_book)
VALUE(401, 301, 'The Great Gatsby', '2023-06-10', 234),
(402, 302, 'To Kill a Mockigbird', '2024-01-01', 123),
(403, 303, 'The Catcher in the Rye', '2024-02-05', 321),
(404, 304, 'The Hunger Games', '2024-03-15',341),
(405, 305, 'The Lord of the Rings', '2024-04-20', 421),
(406, 306, 'The Lion', '2024-05-25', 241),
(407, 307, 'The Alchemist', '2024-06-26', 543),
(408, 308, 'The Da Vinci Code', '2024-07-27', 356),
(409, 309, 'The Rise and Fall of the Third Rich', '2024-08-28', 632),
(410, 310, 'The Nightingale', '2024-09-29', 978);
SELECT *FROM IssueStatus;   

CREATE TABLE ReturnStatus (
  Return_Id INT PRIMARY KEY,
  Return_cust VARCHAR(50),
  Return_book_name VARCHAR(100),
  Return_date DATE,
  Isbn_book2 INT,
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
DESC ReturnStatus;

INSERT INTO ReturnStatus(Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES(601, 701, 'The Great Gatsby', '2023-06-10', 234),
(602, 702, 'To Kill a Mockigbird', '2024-01-01', 123),
(603, 703, 'The Catcher in the Rye', '2024-02-05', 321),
(604, 704, 'The Hunger Games', '2024-03-15',341),
(605, 705, 'The Lord of the Rings', '2024-04-20', 421),
(606, 706, 'The Lion', '2024-05-25', 241),
(607, 707, 'The Alchemist', '2024-06-26', 543),
(608, 708, 'The Da Vinci Code', '2024-07-27', 356),
(609, 709, 'The Rise and Fall of the Third Rich', '2024-08-28', 632),
(610, 710, 'The Nightingale', '2024-09-29', 978);
SELECT *FROM ReturnStatus;

-- Display all the tables and Write the queries for the following :     
    
# 1. Retrieve the book title, category, and rental price of all available books.
  select book_title,category,rental_price from Books;
  
# 2. List the employee names and their respective salaries in descending order of salary.
  select emp_name,salary from Employee order by salary desc;

# 3. Retrieve the book titles and the corresponding customers who have issued those books.
  select book_title,customer_name from issuestatus inner join books on isbn_book= ISBN join customer on issue_customer = customer_id; 

# 4. Display the total count of books in each category. 
  select category,count(*) as 'Total Books' from Books group by category;
  
# 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
  select emp_name,position from Employee where salary>50000;
  
# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
  select customer_name,reg_date from Customer where reg_date < '2022-01-01' and customer_id not in (select issue_customer from IssueStatus);
  
# 7. Display the branch numbers and the total count of employees in each branch. 
  select branch_no,count(*) as 'No.of Employees' from Employee group by branch_no;
  
# 8. Display the names of customers who have issued books in the month of June 2023
  select customer_name from customer join issuestatus on customer_id =issue_customer where month(issue_date)=6 and year(issue_date)=2023;
  
# 9. Retrieve book_title from book table containing history. 
  select book_title from books where category = 'history';
 
# 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
  select branch_no, count(emp_id) AS total_employees  from employee  group by branch_no having  count(emp_id) > 5;

# 11. Retrieve the names of employees who manage branches and their respective branch addresses.
 select emp_name,branch_no,branch_address from Employee  inner join Branch  on branch_no=branch_no where position='manager';
 
# 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.
  select customer_name from Customer  inner join issueStatus on issue_customer = customer_id inner join Books  on ISBN = isbn_book where rental_price>25.00 ;



