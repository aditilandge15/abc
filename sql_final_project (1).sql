create database pizzahut;
use pizzahut;
create table pizzaa(pizza_id varchar(255),pizza_type_id varchar(200),size varchar(20),price float);
insert into pizzaa
values("bbq_ckn_s","bbq_ckn","S",12.75),("bbq_ckn_m","bbq_ckn","M",16.75),("bbq_ckn_l","bbq_ckn","L",20.75),
("cali_ckn_s","cali_ckn","S",12.75),("cali_ckn_m","cali_ckn","M",16.75),("cali_ckn_l","cali_ckn","L",20.75),
("big_meat_s","big_meat","S",12),("big_meat_m","big_meat","M",16),("big_meat_l","big_meat","L",20.5),
("spicy_ital_s","spicy_ital","S",12.5),("spicy_ital_m","spicy_ital","M",16.5),("spicy_ital_l","spicy_ital","L",20.75),
("five_cheese_s","five_cheese","S",12.5),("five_cheese_m","five_cheese","M",15.5),("five_cheese_l","five_cheese","L",18.5);
select *from pizzaa;

create table pizza_types(pizza_type_id varchar(255),name varchar(260),category varchar(20),ingredients varchar(280));
insert into pizza_types values("bbq_ckn","The Barbecue Chicken Pizza","Chicken","Barbecued Chicken, Red Peppers, Green Peppers, Tomatoes, Red Onions, Barbecue Sauce"),
("cali_ckn","The California Chicken Pizza","Chicken","Chicken, Artichoke, Spinach, Garlic, Jalapeno Peppers, Fontina Cheese, Gouda Cheese"),
("big_meat","The Big Meat Pizza","Classic","Bacon, Pepperoni, Italian Sausage, Chorizo Sausage"),
("spicy_ital","The Spicy Italian Pizza","Supreme","Capocollo, Tomatoes, Goat Cheese, Artichokes, Peperoncini verdi, Garlic"),
("five_cheese","The Five Cheese Pizza","Veggie","Mozzarella Cheese, Provolone Cheese, Smoked Gouda Cheese, Romano Cheese, Blue Cheese, Garlic");
select *from pizza_types;

create table Orders(order_id INT PRIMARY KEY,order_date date,order_time time);
insert into Orders values(1,"2015-01-01","11:38:36"),(2,"2015-01-01","11:57:40"),(3,"2015-01-01","12:12:28"),
(4,"2015-01-02","12:45:51"),(5,"2015-01-02","12:53:27"),(6,"2015-01-02","13:13:41"),
(7,"2015-01-03","16:57:37"),(8,"2015-01-03","16:58:51"),(9,"2015-01-03","17:00:49"),
(10,"2015-01-04","12:31:00"),(11,"2015-01-04","12:45:14"),(12,"2015-01-04","12:46:22");
select *from Orders;

create table Orderr_Detailss(order_details int primary key,order_id int,pizza_id varchar(200),quantity int);
insert into Orderr_Detailss values(1,1,"five_cheese_l",1),(2,1,"bbq_ckn_s",1),(3,1,"big_meat_m",1),(4,2,"big_meat_s",1),
(5,3,"spicy_ital_s",1),(6,4,"five_cheese_m",1),(7,4,"big_meat_l",1),(8,5,"big_meat_m",1),
(9,6,"five_cheese_l",2),(10,7,"spicy_ital_l",2),(11,8,"five_cheese_l",2),(12,8,"bbq_ckn_l",2);
select*from Orderr_detailss;

select count(order_id) as total_orders
 from Orders;

select sum(Orderr_Detailss.quantity*pizzaa.price) as total_sales
from Orderr_Detailss join pizzaa
on pizzaa.pizza_id = Orderr_Detailss.pizza_id;

select pizza_types.name,pizzaa.price
from pizza_types join pizzaa
on pizza_types.pizza_type_id = pizzaa.pizza_type_id
order by pizzaa.price desc
limit 1 ;

select pizzaa.size,count(Orderr_Detailss.order_id) as order_count
from pizzaa join Orderr_Detailss
on pizzaa.pizza_id=Orderr_Detailss.pizza_id
group by pizzaa.size
order by order_count desc;

select pizza_types.name,sum(Orderr_Detailss.quantity)as quantity
from pizza_types join pizzaa
on pizza_types.pizza_type_id = pizzaa.pizza_type_id
join Orderr_Detailss
on Orderr_Detailss.pizza_id = pizzaa.pizza_id
group by pizza_types.name 
order by quantity desc 
limit 5;

select hour(order_time) as hours,
count(order_id) as order_count
from Orders
group by hour(order_time);

select category ,count(*) 
from pizza_types
group by category;













