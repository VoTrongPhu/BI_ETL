use Covid_19_METADATA
go
Create table DDS(
	id int identity(1,1),
	tenbang nvarchar(50),
	ngaycapnhat datetime
	primary key (id))


insert into dds(tenbang) values ('DIM_AGE_GROUP')
go

insert into dds(tenbang) values ('DIM_CITY')
go

insert into dds(tenbang) values ('DIM_DATE')
go

insert into dds(tenbang) values ('DIM_GENDER')
go

insert into dds(tenbang) values ('DIM_MONTH')
go

insert into dds(tenbang) values ('DIM_OUT_BREAK_GROUP')
go

insert into dds(tenbang) values ('DIM_PHU')
go

insert into dds(tenbang) values ('DIM_PHU_GROUP')
go

insert into dds(tenbang) values ('DIM_QUATER')
go

insert into dds(tenbang) values ('DIM_SEVERITY')
go

insert into dds(tenbang) values ('DIM_YEAR')
go

insert into dds(tenbang) values ('FACT1_COVID_COUNT')
go

insert into dds(tenbang) values ('FACT2_SEVERITY')
go

insert into dds(tenbang) values ('FACT3_CASES')
go

insert into dds(tenbang) values ('FACT4_5A_CASES')
go

insert into dds(tenbang) values ('FACT5B_VACCINES')
go
insert into dds(tenbang) values ('FACT6_CASES')
go

update dds set ngaycapnhat = '12/1/2022'