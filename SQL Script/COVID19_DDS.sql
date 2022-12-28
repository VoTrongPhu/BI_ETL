CREATE DATABASE COVID19_DDS
GO

USE COVID19_DDS
GO

CREATE TABLE FACT1_COVID_COUNT (
	PHU_SK INT,
	YEAR_SK INT,
	Death_Cases int,
	Num_of_Cases INTEGER,
	Recovery_cases INTEGER
	PRIMARY KEY(PHU_SK, YEAR_SK))
GO
CREATE TABLE FACT2_SEVERITY(
	PHU_SK INT,
	SEVERITY_SK INT,
	QUATER_SK INT,
	Check_Severity INT,
	PRIMARY KEY(PHU_SK, SEVERITY_SK, QUATER_SK))
GO
CREATE TABLE FACT3_CASES(
	Gender_SK INT,
	AgeGroup_SK INT,
	Year_SK INT,
	Death_Case INT,
	PRIMARY KEY(Gender_SK, AgeGroup_SK, Year_SK))
GO
CREATE TABLE FACT4_5A_CASES(
	CITY_SK INT,
	SEVERITY_SK INT,
	DATE_SK INT,
	Death_Cases int,
	Num_of_Cases INTEGER,
	PRIMARY KEY(CITY_SK, SEVERITY_SK, DATE_SK))
GO
CREATE TABLE FACT5B_VACCINES(
	Year_SK INT,
	First_Dose INT,
	Second_dose INT,
	Third_dose int,
	Fully_vaccinated INTEGER,
	PRIMARY KEY(Year_SK))
GO
CREATE TABLE FACT6_CASES(
	PHU_GROUP_SK INT,
	SEVERITY_SK INT,
	OUT_BREAK_GROUP_SK INT,
	YEAR_SK int,
	Num_of_Cases INTEGER,
	Death_Cases int,
	PRIMARY KEY(PHU_GROUP_SK, SEVERITY_SK, OUT_BREAK_GROUP_SK))
GO

CREATE TABLE DIM_PHU(
	PHU_SK INT identity(1,1),
	Reporting_PHU NVARCHAR(MAX),
	Reporting_PHU_Address NVARCHAR(MAX),
	Reporting_PHU_Postal_Code NVARCHAR(10),
	Reporting_PHU_Website NVARCHAR(MAX),
	Reporting_PHU_Latitude FLOAT,
	Reporting_PHU_Longitude FLOAT,
	Province NVARCHAR(255),
	Created_Date DATE,
	Updated_Date DATE,
	Status INT,
	SOR INT,
	City_ID INT,
	PHU_ID INT,
	PRIMARY KEY(PHU_SK))
GO
CREATE TABLE DIM_CITY(
	CITY_SK INT identity(1,1),
	City NVARCHAR(50),
	PHU_Group_ID INT,
	Created_Date DATE,
	Updated_Date DATE,
	Status int,
	SOR INT,
	PRIMARY KEY(CITY_SK))
GO
CREATE TABLE DIM_PHU_GROUP(
	PHU_GROUP_SK INT identity(1,1),
	PHU_Group NVARCHAR(50),
	Created_Date Date,
	Updated_Date Date,
	Status INTEGER,
	SOR int,
	PHU_Group_ID int,
	PRIMARY KEY(PHU_GROUP_SK))
GO
CREATE TABLE DIM_GENDER(
	Gender_SK INT identity(1,1),
	Gender NVARCHAR(50),
	PRIMARY KEY(Gender_SK))
GO
CREATE TABLE DIM_AGE_GROUP(
	AgeGroup_SK INT identity(1,1),
	AgeGroup NVARCHAR(50),
	PRIMARY KEY(AgeGroup_SK))
GO
CREATE TABLE DIM_OUT_BREAK_GROUP(
	OUT_BREAK_GROUP_SK INT identity(1,1),
	Out_break_Group NVARCHAR(50),
	Created_Date Date,
	Updated_Date Date,
	Status INTEGER,
	SOR int,
	PRIMARY KEY(OUT_BREAK_GROUP_SK))
GO
CREATE TABLE DIM_SEVERITY(
	SEVERITY_SK INT identity(1,1),
	Name NVARCHAR(50),
	Min_Case INT,
	Max_Case int,
	Serious_level INTEGER,
	PRIMARY KEY(SEVERITY_SK))
GO
CREATE TABLE DIM_YEAR(
	Year_SK INT identity(1,1),
	DYear INT,
	PRIMARY KEY(Year_SK))
GO
CREATE TABLE DIM_QUATER(
	Quater_SK INT identity(1,1),
	Quater INT,
	Year_SK int,
	PRIMARY KEY(Quater_SK))
GO
CREATE TABLE DIM_MONTH(
	MONTH_SK INT identity(1,1),
	DMonth INT,
	Quater_SK INT,
	PRIMARY KEY(MONTH_SK))
GO
CREATE TABLE DIM_DATE(
	DATE_SK INT identity(1,1),
	DDay INT,
	Month_SK INT,
	PRIMARY KEY(DATE_SK))
GO
---------




ALTER TABLE FACT1_COVID_COUNT
ADD CONSTRAINT FK_FACT1_COVID_COUNT_DIM_PHU
FOREIGN KEY (PHU_SK)
REFERENCES DIM_PHU(PHU_SK)
GO

ALTER TABLE FACT1_COVID_COUNT
ADD CONSTRAINT FK_FACT1_COVID_COUNT_DIM_YEAR
FOREIGN KEY (Year_SK)
REFERENCES DIM_YEAR(Year_SK)
GO
---------------------
ALTER TABLE FACT2_SEVERITY
ADD CONSTRAINT FK_FACT2_SEVERITY_DIM_SEVERITY
FOREIGN KEY (SEVERITY_SK)
REFERENCES DIM_SEVERITY(SEVERITY_SK)
GO

ALTER TABLE FACT2_SEVERITY
ADD CONSTRAINT FK_FACT2_SEVERITY_PHU_SK
FOREIGN KEY (PHU_SK)
REFERENCES DIM_PHU(PHU_SK)
GO

ALTER TABLE FACT2_SEVERITY
ADD CONSTRAINT FK_FACT2_SEVERITY_DIM_QUATER
FOREIGN KEY (QUATER_SK)
REFERENCES DIM_QUATER(QUATER_SK)
GO
----------------
ALTER TABLE FACT3_CASES
ADD CONSTRAINT FK_FACT3_CASES_DIM_GENDER
FOREIGN KEY (Gender_SK)
REFERENCES DIM_GENDER(Gender_SK)
GO

ALTER TABLE FACT3_CASES
ADD CONSTRAINT FK_FACT3_CASES_DIM_AGE_GROUP
FOREIGN KEY (AgeGroup_SK)
REFERENCES DIM_AGE_GROUP(AgeGroup_SK)
GO

ALTER TABLE FACT3_CASES
ADD CONSTRAINT FK_FACT3_CASES_DIM_YEAR
FOREIGN KEY (Year_SK)
REFERENCES DIM_YEAR(Year_SK)
GO
---------------------

ALTER TABLE FACT4_5A_CASES
ADD CONSTRAINT FK_FACT4_5A_CASES_DIM_CITY
FOREIGN KEY (CITY_SK)
REFERENCES DIM_CITY(CITY_SK)
GO

ALTER TABLE FACT4_5A_CASES
ADD CONSTRAINT FK_FACT4_5A_CASES_DIM_SEVERITY
FOREIGN KEY (SEVERITY_SK)
REFERENCES DIM_SEVERITY(SEVERITY_SK)
GO

ALTER TABLE FACT4_5A_CASES
ADD CONSTRAINT FK_FACT4_5A_CASES_DIM_DATE
FOREIGN KEY (DATE_SK)
REFERENCES DIM_DATE(DATE_SK)
GO
------------------
ALTER TABLE FACT5B_VACCINES
ADD CONSTRAINT FK_FACT4_5A_CASES_DIM_YEAR
FOREIGN KEY (Year_SK)
REFERENCES DIM_YEAR(Year_SK)
GO
--------------------------
ALTER TABLE FACT6_CASES
ADD CONSTRAINT FK_FACT6_CASES_DIM_PHU_GROUP
FOREIGN KEY (PHU_GROUP_SK)
REFERENCES DIM_PHU_GROUP(PHU_GROUP_SK)
GO

ALTER TABLE FACT6_CASES
ADD CONSTRAINT FK_FACT6_CASES_DIM_SEVERITY
FOREIGN KEY (SEVERITY_SK)
REFERENCES DIM_SEVERITY(SEVERITY_SK)
GO

ALTER TABLE FACT6_CASES
ADD CONSTRAINT FK_FACT6_CASES_DIM_OUT_BREAK_GROUP
FOREIGN KEY (OUT_BREAK_GROUP_SK)
REFERENCES DIM_OUT_BREAK_GROUP(OUT_BREAK_GROUP_SK)
GO

ALTER TABLE FACT6_CASES
ADD CONSTRAINT FK_FACT6_CASES_DIM_YEAR
FOREIGN KEY (YEAR_SK)
REFERENCES DIM_YEAR(YEAR_SK)
GO
--------------
ALTER TABLE DIM_PHU
ADD CONSTRAINT FK_DIM_PHU_DIM_CITY
FOREIGN KEY (City_ID)
REFERENCES DIM_CITY([CITY_SK])
GO

ALTER TABLE DIM_CITY
ADD CONSTRAINT FK_DIM_CITY_DIM_PHU_GROUP
FOREIGN KEY (PHU_Group_ID)
REFERENCES DIM_PHU_GROUP([PHU_GROUP_SK])
GO
----------------------------
ALTER TABLE DIM_DATE
ADD CONSTRAINT FK_DIM_DATE_DIM_MONTH
FOREIGN KEY (MONTH_sk)
REFERENCES DIM_MONTH(MONTH_SK)
GO

ALTER TABLE DIM_MONTH
ADD CONSTRAINT FK_DIM_MONTH_DIM_QUATER
FOREIGN KEY (Quater_SK)
REFERENCES DIM_QUATER(Quater_SK)
GO

ALTER TABLE DIM_QUATER
ADD CONSTRAINT FK_DIM_QUATER_DIM_YEAR
FOREIGN KEY (Year_SK)
REFERENCES DIM_YEAR(Year_SK)
GO