Create database Bus_automation

use Bus_automation

create table Cities
(	CityId int primary key identity(1,1),
	CityName nvarchar(50) not null
);

create table SubStation
(	SubStationId int primary key identity(1,1),
	SubStationName nvarchar(30) not null,
    CityId  int foreign key  references Cities(CityId) 
);

create table EmployeeType
(	EmployeeTypeId int primary key not null,
	EmployeeTypeName nvarchar(30) not null
);
create table Employees_Input_Output
(
EmployeeId int primary key not null,
ProcessingTime  datetime2 not null default getdate(),
EmployeeProcessingId int ,
ProcessingType bit
);

create table Employees
(	EmployeeId int primary key  identity(1,1),
	Name nvarchar(30) not null,
	Lastname nvarchar(30) not null,
	Email  nvarchar(60) not null,
	Phone nvarchar (30) not null unique,
	SubStationId  int foreign key  references SubStation(SubStationId),
	IsDirector bit,
	EmployeeTypeId int foreign key  references  Employees_Input_Output(EmployeeId),
	
constraint Employees_Phone_len check (len(Phone) = 11)
);

ALTER TABLE Employees ADD CONSTRAINT fk_employee 
    FOREIGN KEY (EmployeeId) REFERENCES Employees(EmployeeId);

create table Buses(
BusId int primary key identity(1,1),
Plaka nvarchar(10) not null unique,
IsActive bit not null,
SeatCapacity tinyint ,
EmployeeTypeId int foreign key  references  EmployeeType(EmployeeTypeId),
);
Create table Passengers(
PassengerId int primary key identity(1,1),
Name nvarchar(50)not null,
Lastname nvarchar(60) not null,
Email nvarchar(30),
Phone nvarchar(11) not null unique,
Gender bit not null,
 CityId  int foreign key  references Cities(CityId),

);
create table Voyoge(
VoyogeId int primary key identity(1,1),
Date datetime2 not null,
IsCancel bit not null,
Departure time,
Arrival time,
EstimatedTime int,
TicketPrice money not null,
DepartureCityId int foreign key  references  Cities(CityId),
ArrivalCityId int foreign key references Cities(CityId),
EmployeeTypeId int foreign key  references  EmployeeType(EmployeeTypeId),
BusId  int  foreign key  references  Buses(BusId)
);
create table Tickets(
TicketId int primary key identity(1,1),
VoyogeId int  foreign key  references  Voyoge(VoyogeId),
ProcessingEmployeeId int foreign key  references  Employees(EmployeeId),
PassengerGender bit not null,
SeatNumber int  not null,

);
create table Ticket_Details(
TicketId int  unique not null,
Pay money not null,
TransactionTime datetime not null default getdate(),
SalesType bit,
SeatNumber int  unique not null,
Discount int,
VoyogeId int  foreign key  references  Voyoge(VoyogeId),
PassengerId int  foreign key  references Passengers(PassengerId),
primary key(VoyogeId,SeatNumber)

);
ALTER TABLE Ticket_Details
ADD CONSTRAINT FK_Ticket_Detail FOREIGN KEY(TicketId) 
    REFERENCES Tickets(TicketId);

create table CostType(
CostTypeId int primary key identity(1,1),
CostTypeName nvarchar(50)
);
create table BusCost(
BusCostId int primary key identity(1,1),
CostTypeId int foreign key  references  CostType(CostTypeId),
Pay  money,
CostEmployeeId int not null,
VoyogeId int  foreign key  references  Voyoge(VoyogeId),
BusId   int  foreign key  references  Buses(BusId)

);






