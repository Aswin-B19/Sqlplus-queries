 ------------------Single table retrieval-----------------



1 => SELECT name FROM Client_master;

2 => SELECT * FROM Client_master;

3 => SELECT name,city FROM Client_master;

4 => SELECT description FROM product_master;

5 => SELECT name FROM Client_master WHERE name LIKE '_a%';

6 => SELECT name FROM Client_master WHERE city LIKE '_a%';

7 => SELECT name FROM Client_master WHERE city IN ('Bombay','Delhi','Madras');

8 => SELECT name FROM Client_master WHERE city ='Bombay';

9 => SELECT name FROM Client_master WHERE bal_due > 10000;

10 => SELECT * FROM sales_order WHERE TO_CHAR(s_order_date ,'Mon') = 'Jan';

11 => SELECT * FROM sales_order WHERE client_no IN ('C00001','C00002');

12 => SELECT * FROM product_master WHERE description IN ('1.44 Drive','1.22 Drive');

13 => SELECT description FROM product_master WHERE sell_price > 2000 AND sell_price <= 5000;

// 14 => SELECT sell_price, sell_price *15 AS new FROM product_master WHERE sell_price > 1500; 

// 15 => ALTER TABLE product_master RENAME COLUMN new TO new_price;

16 => SELECT description FROM product_master WHERE cost_price < 1500;

17 => SELECT description FROM product_master ORDER BY description ASC;

18 => SELECT sell_price, SQRT(sell_price) AS square_root FROM product_master;

19 => SELECT sell_price / (sell_price -100) AS cost FROM product_master WHERE description = '540 HDD';

20 => SELECT name,city,state FROM client_master WHERE state != 'Maharashtra';

21 => SELECT product_no, description, sell_price FROM product_master WHERE description LIKE 'M%';

22 => SELECT * FROM sales_order  WHERE order_status = 'C' AND TO_CHAR(dely_date,'Mon') = 'May';



-----------Set Functions and Concatenation------------

23 => SELECT COUNT(*) AS total_count FROM sales_order_details;

24 => SELECT AVG(product_rate) AS average FROM sales_order_details;

25 => SELECT MIN(product_rate) AS minimum FROM sales_order_details;

26 => SELECT MIN (product_rate) AS min_price, MAX(product_rate) AS max_price FROM sales_order_details;

27 => SELECT COUNT(*) AS tot FROM sales_order_details WHERE product_rate >= 1500; 

28 => SELECT COUNT(*) AS temp FROM product_master WHERE qty_on_hand < record_lvl;

29 =>



-----------------Having and Group by----------------


// 30 => SELECT sales_order_details.product_no,sales_order_details.qty_dis, product_master.description FROM sales_order_details  JOIN product_master  ON sales_order_details.product_no = product_master.product_no;


31 => SELECT p.product_no, p.description, SUM(s.qty_ordered * s.product_rate) AS value_of_sale FROM product_master p INNER JOIN sales_order_details s on p.product_no = s.product_no group by p.product_no, p.description;

32 => SELECT SUM(sd.qty_ordered), SUM(sd.product_rate), AVG(sd.qty_ordered * sd.product_rate) AS average_val FROM sales_order_details sd INNER JOIN sales_order s on sd.s_order_no = s.s_order_no GROUP BY s.client_no HAVING SUM(sd.qty_ordered * sd.product_rate) <= 15000.00;

33 => SELECT SUM(so.qty_ordered * so.product_rate) AS total_sale_in_Jan FROM sales_order_details so inner join challan_header c on so.s_order_no = c.s_order_no inner join sales_order s on so.s_order_no = s.s_order_no where s_order_date like '%JAN%' GROUP BY so.s_order_no;

34 => SELECT p.description || ' worth of Rs.' || SUM(s.qty_ordered * s.product_rate) AS info FROM product_master p INNER JOIN sales_order_details s on p.product_no = s.product_no GROUP BY s.product_no, p.description;

35 =>SELECT p.description || ' worth of Rs.' || SUM(s.qty_ordered * s.product_rate) || ' was produced in the month of ' || so.s_order_date AS info FROM product_master p INNER JOIN sales_order_details s on p.product_no = s.product_no inner join sales_order so on so.s_order_no = s.s_order_no where so.s_order_date like '%JAN%'  GROUP BY s.product_no, p.description, so.s_order_date;





-----------------Nested Queries------------------


36 => SELECT product_no,description FROM product_master WHERE product_no NOT IN (select distinct product_no from sales_order_details);

37 => SELECT name,address1,address2,city,pincode FROM Client_master WHERE client_no IN (SELECT client_no FROM sales_order WHERE s_order_no='O19001');

38 => SELECT name FROM client_master WHERE client_no IN (SELECT client_no FROM sales_order WHERE dely_date <to_date('01-May-1996','DD-Mon-YYYY'));

39 => SELECT client_no,name FROM Client_master WHERE client_no IN (SELECT client_no FROM sales_order WHERE s_order_no IN( (SELECT s_order_no FROM sales_order_details WHERE product_no IN(SELECT product_no FROM product_master WHERE description ='1.44 Drive'))));

40 => SELECT name AS Order_more_than_10000 FROM Client_master WHERE client_no IN(SELECT client_no FROM sales_order WHERE s_order_no IN (SELECT s_order_no FROM sales_order_details  GROUP BY s_order_no HAVING SUM(qty_ordered*product_rate)>10000));

41 => SELECT s_order_no,TO_CHAR(s_order_date, 'DAY') AS day_name FROM sales_order;

42 => SELECT TO_CHAR(dely_date, 'MONTH-DD') AS Delivery_format FROM sales_order;

43 => SELECT TO_CHAR(s_order_date,'DD-MONTH-YYYY') AS ordered_format FROM sales_order;

44 => SELECT SYSDATE + 15 AS date_after_15_days FROM DUAL;

45 => SELECT DATEDIFF(NOW(), dely_date) AS days_elapsed FROM sales_order;



------------Table Updations------------------------

//46 => UPDATE sales_order SET s_order_date = 'TO_DATE('24/07/96','DD-MM-YYYY')' WHERE client_no ='C00001';

47 => UPDATE product_master SET sell_price = 1150.00 WHERE description ='1.44 Drive';

48 => 







Default Constructor --> Ctrl + Space

Parametrized Constructor --> ALt + Shift + S & Press O & Enter

Getter Setter --> Alt + Shift + R & Select All & Enter
