SELECT * FROM myfirstdb.dropoutnew;

show create table new_orders;

drop table new_customer;

alter table orders drop foreign key orders_jbfk_1;

INSERT INTO imported_book(bookid, bookname, publisher, price)
    SELECT bookid, bookname, publisher , price
    FROM book;

UPDATE book
   SET price = (SELECT price 
				  FROM imported_book
				 WHERE bookid = 24)
 WHERE bookid = 1;
    
    