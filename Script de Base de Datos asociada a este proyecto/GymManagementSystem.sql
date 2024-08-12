create database GymManagementSystemDB;
go

use GymManagementSystemDB;
go

create table Members (
MemberID int primary key identity (1,1),
FirstName varchar (50),
LastName varchar (50),
Email varchar (100),
PhoneNumber varchar (30),
JoinDate date
);
go

create table Trainers (
TrainerID int primary key identity (1,1),
FirstName varchar (50),
LastName varchar (50),
Email varchar (100),
PhoneNumber varchar (30),
HireDate date
);
go

create table Classes (
ClassID int primary key identity (1,1),
ClassName varchar (100),
TrainerID int foreign key references Trainers(TrainerID),
Schedule varchar (100)
);
go

create table Subscriptions (
SubscriptionID int primary key identity (1,1),
MemberID int foreign key references Members(MemberID),
SubscriptionType varchar (50),
StartDate date,
EndDate date
);
go

create table ClassMembers (
ClassID int foreign key references Classes(ClassID),
MemberID int foreign key references Members(MemberID),
Primary key (ClassID, MemberID)
);
go

--Ejecucicion para ver los datos que hay dentro de la tabla
select*from Members
select*from Trainers
select*from Classes
select*from Subscriptions
select*from ClassMembers


--Area de insersiones de datos de ejemplo
insert into Members (FirstName, LastName, Email, PhoneNumber, JoinDate) values 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '2024-01-15'),
('Jane', 'Smith', 'jane.smith@example.com', '234-567-8901', '2024-02-20'),
('Emily', 'Johnson', 'emily.johnson@example.com', '345-678-9012', '2024-03-10'),
('Michael', 'Williams', 'michael.williams@example.com', '456-789-0123', '2024-04-25'),
('Sarah', 'Brown', 'sarah.brown@example.com', '567-890-1234', '2024-05-30');
go

insert into Trainers (FirstName, LastName, Email, PhoneNumber, HireDate) values 
('Alice', 'White', 'alice.white@example.com', '678-901-2345', '2023-06-15'),
('Bob', 'Green', 'bob.green@example.com', '789-012-3456', '2023-07-20'),
('Charlie', 'Black', 'charlie.black@example.com', '890-123-4567', '2023-08-10'),
('Diana', 'Blue', 'diana.blue@example.com', '901-234-5678', '2023-09-05'),
('Eve', 'Gray', 'eve.gray@example.com', '012-345-6789', '2023-10-12');
go

insert into Classes (ClassName, TrainerID, Schedule) VALUES 
('Yoga', 1, 'Monday 9:00 AM - 10:00 AM'),
('Pilates', 2, 'Tuesday 10:00 AM - 11:00 AM'),
('Spin Class', 3, 'Wednesday 6:00 PM - 7:00 PM'),
('Zumba', 4, 'Thursday 7:00 PM - 8:00 PM'),
('CrossFit', 5, 'Friday 5:00 PM - 6:00 PM');

go

insert into Subscriptions (MemberID, SubscriptionType, StartDate, EndDate) values 
(1, 'Monthly', '2024-01-15', '2024-02-15'),
(2, 'Quarterly', '2024-02-20', '2024-05-20'),
(3, 'Yearly', '2024-03-10', '2025-03-10'),
(4, 'Monthly', '2024-04-25', '2024-05-25'),
(5, 'Quarterly', '2024-05-30', '2024-08-30');

go

insert into ClassMembers (ClassID, MemberID) values 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 1);
go