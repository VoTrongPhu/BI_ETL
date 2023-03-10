use COVID_19_NDS
go
CREATE TABLE PHU_GROUP(
	PHU_GROUP_SK INT IDENTITY(1,1) NOT NULL,
	PHU_SK INT,
	PHU_CITY NVARCHAR(50),
	PHU_GROUP NVARCHAR(50),
	CREATED_DATE DATETIME,
	UPDATED_DATE DATETIME,
	STATUS INT,
	SOR INT,
	PRIMARY KEY (PHU_GROUP_SK))
GO
ALTER TABLE PHU_GROUP
ADD CONSTRAINT FK_PHU_GROUP_PHU
FOREIGN KEY (PHU_SK)
REFERENCES PHU(PHU_SK)



ALTER TABLE PHU
DROP COLUMN [PHU_GROUP]

ALTER TABLE PHU
ALTER COLUMN REPORTING_PHU_POSTAL_CODE nvarchar(255)


USE COVID_DB
GO
ALTER TABLE [dbo].[Ontario_PHU_GROUP]
DROP COLUMN PHU_GROUP_ID