CREATE DATABASE company_db; 

USE company_db;

CREATE TABLE employee (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100),
    gender ENUM('Male','Female'),
    salary DECIMAL(10,3),
    age INT,
    hire_date DATE,
    department_id INT
); 

INSERT INTO employee 
VALUES
      (1, "Rıza", "Pamuk", "rpamuk@gmail.com", "05413275412", "Ceviz St.", "Male", 25.000, 24 ,"2024-01-07",1),
      (2,"Ferhat", "Aslan", "faslan@gmail.com", "05413474722", "Çiçek St.", "Male", 28.000, 35, "2024-01-09",3) ,
	  (3,"Sinem", "Bal", "sbal@gmail.com", "05435278814", "Çam St.", "Female", 35.000, 55, "2024-02-04",5) , 
      (4,"Ceyda", "Karaman", "ckaraman@gmail.com", "05554772533", "Aydın St.", "Female", 25.000, 25, "2024-02-08",4) , 
      (5,"Ahmet", "Tepe", "atepe@gmail.com", "05424714556", "Yeni St.", "Male", 30.000, 40, "2024-02-09",6) ,
      (6,"Celal", "Kurucu", "ckurucu@gmail.com", "05554789852", "Ekin St.", "Male", 29.000, 37, "2024-02-10",2) ,
      (7,"Mahmut", "Renk", "mrenk@gmail.com", "05075896224", "Kemal St.", "Male", 28.000, 35, "2024-02-12",7) ;
      
  
  
  CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(100)
);
      
INSERT INTO customer
VALUES 
  (1, "Canan", "Aktuna", "caktuna@gmail.com", "05412369854", "Yel St."), 
  (2, "Sena", "Ok", "senaok@gmail.com", "05077884751", "Sakarya St."), 
  (3, "Nüket", "Aksoy", "naksoy@gmail.com", "05412369854", "Sultan St."), 
  (4, "Su", "Bargan", "sbargan@gmail.com", "05413257855", "Parlak St."), 
  (5, "Safa", "Bayram", "sbayram@gmail.com", "05012558747", "Yıldız St."), 
  (6, "Arzu", "Boz", "aboz@gmail.com", "05553257865", "Canan St."), 
  (7, "Caner", "Ceylan", "cceylan@gmail.com", "05554789857", "Amasya St."), 
  (8, "Canan", "Ege", "cege@gmail.com", "05413268754", "Masal St.");  
  
 CREATE TABLE product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL
); 
  
INSERT INTO product
VALUES 
(1,"Iphone 15", 50.000 ),
(2,"Iphone 14", 45.000 ),
(3,"Iphone 13", 38.000 ),
(4,"Samsung Full HD TV", 35.000 ),
(5,"Samsung QLED 4K TV", 40.000),
(6,"Vestel Televizyon", 34.000 ),
(7,"Huawei MatePad Pro", 28.000 ),
(8,"Huawei MatePad Air", 14.000 ),
(9,"Canon Fotograf M.", 33.000),
(10,"Nikon Fotograf M.", 32.000 ); 
  
  

CREATE TABLE buys (
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    
    CONSTRAINT fk_buys_customer 
        FOREIGN KEY (customer_id) REFERENCES customer(customer_id),

    CONSTRAINT fk_buys_product 
        FOREIGN KEY (product_id) REFERENCES product(product_id)
); 

INSERT INTO buys (customer_id, product_id, purchase_date)
VALUES  

(3,6,"2024-03-01"),
(1,5,"2024-03-02"),
(3,6,"2024-03-01"),
(1,5,"2024-03-02"),
(3,6,"2024-03-01"),
(1,5,"2024-03-02"),
(1,8,"2024-03-03"), 
(5,4,"2024-03-03"),
(6,7,"2024-03-07"),
(3,8,"2024-03-04"),
(3,5,"2024-03-04"),
(1,1,"2024-03-02"),
(3,3,"2024-03-04"),
(7,8,"2024-04-02"),
(1,5,"2024-04-04"),
(4,6,"2024-04-01"),
(7,3,"2024-05-07"),
(8,2,"2024-07-11"), 
(5,4,"2024-04-12"),
(1,7,"2024-04-05"),
(6,6,"2024-04-02"),
(3,5,"2024-05-07");

CREATE TABLE department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    manager_name VARCHAR(100) NOT NULL
);

INSERT INTO department (department_id, department_name, manager_name)  
values  (1, "Human Resources", "Selim Yenisey"),
		(2, "IT Department" , "Seda Yan"),
		(3, "Customer Service", "Ahmet Deniz"),
		(4, "Marketing", "Yıldız Ceviz"),
        (5, "Finance", "Sedat Sunay"),
		(6, "Sales" , "Cem Kerim"),
		(7, "Purchase", "Alp Doruk"); 

ALTER TABLE employee
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES department(department_id);


CREATE TABLE supplier (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL,
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(100)
);

INSERT INTO supplier
VALUES 
  (1, "Kuzey Teknoloji", "kteknoloji@gmail.com", "05412478741", "Uzak St."), 
  (2, "Sevim Teknoloji", "sevimteknoloji@gmail.com", "05412589854", "Yakın St."), 
  (3, "Sedat Teknoloji",  "sedateknoloji@gmail.com", "05427844514", "Akdeniz St."), 
  (4, "Mühendisler Teknoloji", "mteknoloji@gmail.com", "05557894625", "Samanyolu St."), 
  (5, "Mayıs Teknoloji",  "mayisteknoloji@gmail.com", "05078442546", "Evren St."); 

ALTER TABLE product
ADD supplier_id INT;

ALTER TABLE product
ADD CONSTRAINT fk_product_supplier
FOREIGN KEY (supplier_id)
REFERENCES supplier(supplier_id);


CREATE TABLE provide (
    provide_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,

    CONSTRAINT fk_provide_product
        FOREIGN KEY (product_id) REFERENCES product(product_id),

    CONSTRAINT fk_provide_supplier
        FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

INSERT INTO provide
VALUES  
(1, 1,2),
(2, 2,5),
(3, 4,1),
(4, 10,2),
(6, 9,3),
(7, 8,4),
(8, 5,3),
(9, 6,4),
(10,6,3); 

CREATE TABLE sell (
    sell_id INT PRIMARY KEY,
    employee_id INT NOT NULL,
    product_id INT NOT NULL 
);

INSERT INTO sell
VALUES  
(1, 1,2),
(2, 2,5),
(3, 3,7),
(4, 1,3),
(5, 4,9),
(6, 5,4),
(7, 1,5),
(8, 6,4),
(9,1,7),
(10,7,2),
(11,7,3),
(12,5,3),
(13,5,2),
(14,7,7); 

----------------
SELECT first_name, last_name,  hire_date
FROM employee
WHERE hire_date > "2024-02-04"; -- First name, last name, and hire date of employees hired after a given date. 
-------------------
SELECT COUNT(id) as "employee number", department_name
FROM department JOIN employee ON department.department_id = employee.department_id
GROUP BY department_name 
HAVING  0 < COUNT(id) < 15 ;          

---------------------
SELECT product_name, price
FROM product
WHERE price > (SELECT AVG(price) FROM product);  -- Names and prices of products priced above the average (using a subquery).
-----------------------
SELECT AVG(price)
FROM product;
-----------------------
SELECT COUNT(supplier_name), product_name
FROM Supplier 
INNER JOIN provide  ON supplier.supplier_id = provide.supplier_id
INNER JOIN Product  ON provide.product_id = product.product_id
GROUP BY product_name;                                 -- Which seller is selling which product.
------------------
SELECT first_name,last_name, email
FROM customer;      -- First name, last name, and email details of customers.
---------------
SELECT AVG(salary) as "average salary" 
FROM employee;      -- Display the average salary.
--------------      
SELECT first_name, last_name, salary
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee); -- Details of the employee with the highest salary (first name, last name, and salary).
-----------------
SELECT first_name, last_name, salary
FROM employee
WHERE salary = (SELECT MIN(salary) FROM employee); -- Details of the employee with the lowest salary (first name, last name, and salary). 
-------------------
SELECT product_name, price
From product
WHERE price = (SELECT MAX(price) FROM product);  -- Name and price of the most expensive product.
----------------
SELECT product_name, price
From product
WHERE price = (SELECT MIN(price) FROM product);  -- Name and price of the cheapest product.
------------------
SELECT first_name, last_name, COUNT(sell.product_id) AS num_products_sold
FROM employee 
INNER JOIN Sell ON employee.id = sell.employee_id
GROUP BY employee.first_name, employee.last_name 
ORDER BY num_products_sold DESC 
LIMIT 1;    -- Name, surname, and total number of products sold by the employee who sold the most products.
-------------------
SELECT product_name, COUNT(sell.product_id) AS num_sold
FROM product 
INNER JOIN Sell  ON product.product_id = sell.product_id
GROUP BY product.product_id, product.product_name
ORDER BY num_sold DESC
LIMIT 1;    -- The most sold product.
----------------
SELECT email
FROM employee
WHERE age < 27;  -- Email addresses of customers under the age of 27. 
----------------
SELECT COUNT(customer_id) as "number of customer"
FROM customer;   -- Customer count. 
---------------
SELECT COUNT(*) as quantity, product_name 
FROM buys JOIN product ON buys.product_id = product.product_id 
group by product_name;   -- Number of units sold per product.
