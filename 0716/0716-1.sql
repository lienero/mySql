USE madang;
SELECT phone FROM Customer WHERE name = '김연아';
CREATE TABLE NewBook (
bookid INTEGER PRIMARY KEY,
bookname VARCHAR(20),
Publisher varchar(20),
Price integer);

CREATE TABLE NewCustomer (
custid integer PRIMARY KEY,
name varchar(40), 
Address varchar(40),
Phone varchar(30)
);

CREATE TABLE NewoOrders (
Orderid integer PRIMARY KEY,
Custid integer NOT NULL,
Bookid integer NOT NULL,
Saleprice integer,
Orderdate date,
FOREIGN KEY (custid) REFERENCES Newcustomer(custid) on delete cascade
);

ALTER TABLE NewBook ADD isbn varchar(13);
ALTER TABLE NewBook MODIFY isbn integer;
ALTER TABLE NewBook DROP COLUMN isbn;
ALTER TABLE NewBook MODIFY bookid INTEGER NOT NULL;
ALTER TABLE NewBook ADD PRIMARY KEY(bookid);
DROP TABLE NewBook;
DROP TABLE NewoOrders;
DROP TABLE NewCustomer;

INSERT INTO Book VALUES(11,'축구의 역사', '굿스포츠', 90000);
INSERT INTO BOOK VALUES(13,'스포츠 의학','한솔의학서적',90000);
INSERT INTO BOOK VALUES(14,'스포츠 의학','한솔의학서적',null);
INSERT INTO BOOK VALUES(12,'스포츠 의학','한솔의학서적',null);
INSERT INTO Book(bookid, bookname, publisher,price)
	   SELECT bookid, bookname, publisher, price
	   FROM imported_book;    

UPDATE customer SET address = '대한민국 부산' WHERE custid = 5;
UPDATE book SET publisher = (SELECT publisher FROM imported_book WHERE bookid = 21) WHERE bookid = 14;
DELETE FROM Book WHERE bookid = 11;
SELECT bookname, price FROM Book;
SELECT price, bookname FROM Book;
SELECT bookid, bookname, publisher, price FROM Book;
SELECT publisher FROM Book;
SELECT DISTINCT publisher FROM Book;
SELECT bookid, bookname, publisher, price FROM Book WHERE price < 20000 ;
SELECT bookid, bookname, publisher, price FROM Book WHERE price  between 10000 AND 20000;
SELECT bookid, bookname, publisher, price FROM Book WHERE publisher = '굿스포츠' OR publisher = '대한미디어' ;
SELECT bookid, bookname, publisher, price FROM Book WHERE publisher != '굿스포츠' AND publisher != '대한미디어' ;
SELECT bookname, publisher FROM Book WHERE bookname = '축구의 역사' ;
SELECT bookname, publisher FROM Book WHERE bookname LIKE '축구%' ;
SELECT bookid, bookname, publisher, price FROM Book WHERE bookname LIKE '%구%' ;
SELECT bookid, bookname, publisher, price FROM Book WHERE bookname LIKE '축구%' AND price >= 20000 ;
SELECT bookid, bookname, publisher, price FROM Book order by bookname;
SELECT bookid, bookname, publisher, price FROM Book order by price, bookname;
SELECT SUM(saleprice) FROM orders;
SELECT SUM(saleprice) AS '총매출'
  FROM orders;
  
SELECT SUM(saleprice) AS '총매출' 
  FROM orders  
 WHERE custid = 2; 
 
SELECT SUM(saleprice) AS 'Total',
	   avg(saleprice) AS 'Average',
       MIN(saleprice) AS 'Minimum',
       MAX(saleprice) AS 'Maximum'
  FROM orders;

SELECT count(*) FROM orders;
SELECT custid, 
       count(bookid) AS '도서수량', 
       sum(saleprice) AS '총액'
  FROM orders 
 GROUP BY custid;  
 
SELECT custid, 
       count(bookid) AS '도서수량'
  FROM orders 
 WHERE saleprice >= 8000
 GROUP BY custid
 HAVING count(bookid) >= 2;  

SELECT *
  FROM Customer, Orders;
 
SELECT * 
  FROM customer c JOIN orders o
	ON(c.custid = o.custid)
 ORDER BY o.orderid;
   
 INSERT INTO imported_book(bookid, bookname, publisher, price)
    SELECT bookid, bookname, publisher , price
    FROM book;

SELECT c.name,
       o.saleprice 
  FROM customer c JOIN orders o	
				    ON (c.custid = o.custid);

SELECT c.name,
       SUM(o.saleprice) 
  FROM customer c JOIN orders o	
				    ON (c.custid = o.custid)
 GROUP BY c.name
 ORDER BY c.name;

SELECT name,
       bookname
  FROM customer c, book b, orders o
 WHERE c.custid = o.custid and o.bookid = b.bookid;

SELECT name, 
       bookname  
  FROM customer c, book b, orders o 
 WHERE c.custid = o.custid and o.bookid = b.bookid 
						   and b.price=20000;

SELECT name, 
       saleprice
  FROM customer c left outer join orders o ON c.custid = o.custid;

SELECT bookname
  FROM book
 WHERE price = (SELECT max(price)
				  FROM book);

SELECT name 
  FROM customer
 WHERE custid in (SELECT custid 
                    FROM orders);
SELECT name 
  FROM customer
 WHERE custid in (SELECT custid 
                    FROM orders
				   WHERE bookid in (SELECT bookid 
					                  FROM book 
					                 WHERE publisher = '대한미디어'));   
                                     
SELECT b1.bookname,
       b1.publisher
  FROM book b1
 WHERE b1.price > (SELECT avg(b2.price)
                     FROM book b2
                    WHERE b2.publisher = b1.publisher); 