create database Covid_19_METADATA
GO
USE Covid_19_METADATA
go

create table COVID_DB(
	id int identity(1,1) not null,
	tenbang varchar(50),
	ngaycapnhat datetime,
	primary key (id))
go
insert into data_flow values('Ontario_Cases_Report', '12/1/2022')
go
insert into data_flow values('Canada_Compiled_Case', '12/1/2022')
go
insert into data_flow values('Ontario_ongoing_outbreaks', '12/1/2022')
go
insert into data_flow values('Ontario_PHU', '12/1/2022')
go
insert into data_flow values('Ontario_PHU_GROUP', '12/1/2022')
go
insert into data_flow values('Ontario_Vaccines_By_Age', '12/1/2022')
go