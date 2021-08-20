create database Eproject
go
use Eproject
go
create table Area
(
	Id nvarchar(25) primary key ,
	AreaName nvarchar(100)

)
go
create table [Service](
	serviceId nvarchar(25) primary key,
	ServiceName nvarchar(100),
	service_area nvarchar(25) foreign key references Area(Id)
)
go
create table Shop(
	ShopId nvarchar(25) primary key,
	ShopName nvarchar(25),
	Photo nvarchar(25),
	serviceId nvarchar(25) foreign key references [Service](serviceId),
	[Description] nvarchar(100)
)
go
create table Movie_type
(
	id nvarchar(25) primary key,
	name nvarchar(25)
)
go
create table Movie
(
	TitleId nvarchar(25) foreign key references Movie_type(id),
	IdMovie nvarchar(25) primary key ,
	ShopId nvarchar(25) foreign key references Shop(ShopId),
	ProductName nvarchar(25),
	[Image] nvarchar(25),
	Price int,
	[Description] nvarchar(100)

)
go
create table Blog
(
	id_Shop nvarchar(25) foreign key references Shop(ShopId),
	[Description] nvarchar(100),
	[Time] nvarchar(25) 

)
go
create table [Days]
(
	id nvarchar(25) primary key,
	[day] nvarchar(25)
)
go
create table Times
(
	TimeId nvarchar(25) primary key,
	timeStart datetime,
	timeEnd datetime
)
go
create table Room
(
	IdRoom nvarchar(25) primary key,
	RoomName nvarchar(25)

)
go
create table Sreening
(
	id nvarchar(25) primary key,
	movie_id nvarchar(25) foreign key references Movie(IdMovie),
	room_id  nvarchar(25) foreign key references Room(IdRoom),
	day_id nvarchar(25) foreign key references [Days](id),
	times_id nvarchar(25) foreign key references Times(TimeId)

)
go
create table Seat
(
	Id nvarchar(25) primary key,
	Name nvarchar(25),
	[status] bit,	
	idRoom nvarchar(25) foreign key references Room(IdRoom),
)
go
create table ProductDetail(
	id nvarchar(25) primary key,
	IdRoom nvarchar(25) foreign key references Room(IdRoom),
	ProductId nvarchar(25) foreign key references Movie(IdMovie),
	TimeId nvarchar(25) foreign key references Times(TimeId),
	[Description] nvarchar(100)
)
 go
 create table Customer(
	Id nvarchar(25) primary key,
	FristName nvarchar(25),
	LastName nvarchar(25),
	Phone nvarchar(25),
	Email nvarchar(25),
	Adress nvarchar(25)
)
go
create table [Order](--(Đặt hàng)
	
	CustomerId nvarchar(25) foreign key references Customer(Id),
	OrderId nvarchar(25) primary key,
	ProductId nvarchar(25) foreign key references Movie(IdMovie),
	screening_id nvarchar(25) foreign key references Sreening(id),
	Quatity int ,
	Price int ,
	Discount float,
)
go
create table [Admin]
(
	id nvarchar(25) primary key ,
	Name nvarchar(25),
	Pass nvarchar(25)

)