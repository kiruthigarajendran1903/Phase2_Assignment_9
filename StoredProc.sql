create database OrderDB
use OrderDB
drop database OrderDB
create table Customers
(CustomerId int primary key,
FirstName nvarchar(50),
LastName nvarchar(50),
)
drop table Customers
create table Orders
(OrderId int primary key,
CustomerId int foreign key references Customers(CustomerId),
 OrderDate datetime,
 TotalAmount decimal)
 drop table Orders
 insert into Customers values(1,'Kiran','Dev')
 insert into Customers values(2,'Mithun','Kirish')
 insert into Customers values(3,'Krishav','Kalyan')
 insert into Customers values(4,'Nehan','Dev')

 insert into Orders values(6,1,'3/2/2013',560)
 insert into Orders values(7,2,'5/7/2021',450)
  insert into Orders values(9,3,'6/9/2022',250)
  insert into Orders values(12,4,'1/10/2022',150)


  select * from Customers

  select * from Orders



Create Procedure PlaceOrder
@orderId int ,
@cid int,
@totalAmount decimal
As
Begin
Insert Into Orders(OrderId,CustomerId,OrderDate,TotalAmount)
Values (@orderId,@cid,GetDate(),@totalAmount)

Update Customers Set TotalSpending=(
Select SUM(TotalAmount) From Orders
Where Customers.CustomerId=Orders.CustomerId)

exec PlaceOrder 9,1,230
end




