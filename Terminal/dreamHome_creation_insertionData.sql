
create database dreamHome
use dreamHome
create table branch(

branchNo varchar(100) primary key,
street varchar(100),
city varchar(100),
postCode varchar(100)

)

 insert into Branch ( branchNo , street,city,postcode)
values ( 'B005', '22 Deer rd ', 'London','SW1 4EH') ,
( 'B007', '22 Deer rd ', 'Aberdeen','AB2 35U') ,
( 'B003', '16 Argyll St ', 'Glasgow','G11 9QX') ,
( 'B004', '163 Manse Rd ', 'Bristol ','BS99 1NZ') ,
( 'B002', '56 Clover Dr', 'London','NW10 6EU')


create table staff(

staffNo varchar(100) primary key ,
fname varchar (100),
lName varchar(100),
position varchar(100),
sex char,
DOB date,
salary money,
branchNo varchar(100) foreign key REFERENCES branch(branchNo)

)

 insert into staff(staffNo,fName,lName,position,sex,DOB,salary,branchNo)values('SL21','John','White','Manager','M','1-Oct-45',30000.00,'B005'),
('SG37','Ann','Beech','Assistant','F','10-Nov-60',12000.00,'B003'),
('SG14','David','Ford','Supervisor','M','24-Mar-58',18000.00,'B003'),
('SA9','Mary','Howe','Assistan','F','19-Feb-70',9000.00,'B007'),
('SG5','Susan','Brand','Manager','F','3-Jun-40',24000.00,'B003'),
('SL41','Julie','Lee','Assistan','F','13-Jun-65',9000.00,'B005')


create table privateOwner(

ownerNo varchar(100) primary key,
fNAme varchar(100),
lname varchar(100),
address varchar(100),
telNo varchar(100),
eMail varchar(100),
password varchar(100),

)

insert into privateOwner(ownerNo,fName,lName,address,telNo,eMail,password)values('CO46','Joe','Keogh','2 Fergus Dr, Aberdeen AB2 7SX','01224-861212','john.kay@gmail.com','********'),
('CO87','Carol','Farrel','6 Achray St, Glasgow G32 9DX','0141-357-7419','cfarrel@gmail.com','********'),
('CO40','Tina','Murphy','63 Well St, Glasgow G42','0141-943-1728','tinam@hotmail.com','********'),
('CO93','Tony','Shaw','12 Park Pl, Glasgow G4 0QR','0141-225-7025','tony.shaw@ark.com','********')


create table propertyForRent(

propertyNo varchar(100) primary key,
street varchar(100),
city varchar(100),
postCode varchar(100),
type varchar(100),
rooms int,
rent money,
ownerNo varchar(100) foreign key REFERENCES privateOwner(ownerNo) ,
staffNo varchar(100) foreign key REFERENCES staff(staffNo) ,
branchNo varchar(100) foreign key REFERENCES branch(branchNo)

)

insert into PropertyForRent ( propertyNo , street,city,postcode,type,rooms,rent,ownerNo,staffNo,branchNo)
values ('PA14','16 Holhead','Aberdeen','Ab7 5SU','House',6,650,'CO46','SA9','B007'),
 ('PL94','16 Argyll St ','London','NW2','Flat',4,400,'CO87','SL41','B005'),
 ('PG4','6 Lawerence St','Glassgow','G11 9QX','Flat',3,350,'CO40',Null,'B003'),
 ('PG36','Manor Rd','Glassgow','G11 4QX','Flat',3,375,'CO93','SG37','B003'),
 ('PG21','18 Dale Rd','Glassgow','G12','House',5,600,'CO87','SG37','B003'),
 ('PG16','5 Novar St','Glassgow','G12 9AX','Flat',4,450,'CO93','SG14','B003')

create table client(

clientNo varchar(100) primary key,
fName varchar(100),
lName varchar(100),
telNo varchar(100),
prefType varchar(100),
maxRent money,
eMail varchar(100)

)

insert into client(clientNo,fName,lName,telNo,prefType,maxRent,eMail) values('CR76','John','Kay','0207-774-5632','Flat',425,'john.kay@gmail.com'),
('CR56','Aline','Stewart','0141-848-1825','Flat',350,'astewart@hotmail.com'),
('CR74','Mike','Ritchie','01475-392178','House',750,'mritchie01@yahoo.co.uk'),
('CR62','Mary','Tregear','01224-196720','Flat',600,'maryt@hotmail.co.uk')


create table viewing(

clientNO varchar(100) foreign key REFERENCES client(clientNo),
propertyNO varchar(100) foreign key REFERENCES propertyForRent(propertyNo) ,
primary key (clientNo,propertyNo),
viewDate date,
comment varchar(100)

)

 insert into Viewing ( clientNo ,propertyNo,viewDate,comment)
 values ( 'CR56','PA14','24-May-13','too small'),
 ( 'CR76','PG4','20-Apr-13','too remote'),
 ( 'CR56','PG4','26-May-13',Null),
 ( 'CR62','PA14','14-May-13','no dining room'),
 ( 'CR56','PG36','28-Apr-13',Null)

create table registration(

clientNo varchar(100) foreign key REFERENCES client(clientNo),
branchNo varchar(100) foreign key REFERENCES branch(branchNo),
primary key (clientNo,branchNo),
staffNo varchar(100) foreign key REFERENCES staff(staffNo),
dateJoined date

)

 insert into Registration ( clientNo ,branchNo, staffNo,dateJoined)
 values ('CR76','B005','Sl41','2-Jan-13'),
 ('CR56','B003','SG37','11-Apr-12'),
 ('CR74','B003','SG37','16-Nov-11'),
 ('CR62','B007','SA9','7-Mar-12')

