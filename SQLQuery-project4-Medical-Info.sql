-- Maitri Patel- project 4

-- 1.	Created a new database called MEDICAL_INFO
-- 2.	Created a new table called INPUT_DATA
-- 3.	Loaded the data from the spreadsheet to the INPUT_DATA table
--can check from this query - select * from dbo.INPUT_DATA

-- 4.	NORMALIZE INPUT_DATA table to the 3NF Form and create new objects accordingly.

CREATE TABLE customer (
Customer_id VARCHAR(20) PRIMARY KEY not null,
Age INT not null,
Gender VARCHAR (12) not null,
Marital VARCHAR (15) not null
);
 GO

INSERT INTO customer(Customer_id, Age, Gender, Marital)
SELECT Customer_id, Age, Gender, Marital 
FROM INPUT_DATA

select * from customer
-------------------------------------------

CREATE TABLE customer_info (
Customer_id VARCHAR(20) references customer(Customer_id),
Job VARCHAR (100) not null,
Education VARCHAR (100) not null,
Employment VARCHAR (100) not null,
--info_id int PRIMARY KEY not null,
);

 GO

INSERT INTO customer_info(Customer_id, Job, Education, Employment)
SELECT Customer_id, Job, Education, Employment
FROM INPUT_DATA

select * from customer_info
---------------------------------------------------

CREATE TABLE location_info (
	Customer_id VARCHAR(20) references customer(Customer_id),
	--location_id varchar  PRIMARY KEY not null,
	state_name VARCHAR (10)not null,
	zip int not null,
	city varchar (50) not null,
	population_count int not null,
	county varchar (50) not null,
	area varchar (50) not null,
	)
	go
	 
INSERT INTO location_info(Customer_id, state_name, zip, city, population_count, county, area)
SELECT Customer_id, State, zip, City, Population, County, Area
FROM INPUT_DATA

select * from location_info
------------------------------------------

CREATE TABLE health_info (
	Customer_id VARCHAR(20) references customer(Customer_id),
	SeniorCitizen VARCHAR (5),
	HighBlood varchar (50),
	Stroke varchar (50),
	Complication_Risk varchar (50),
	Overweight varchar (50),
	Arthritis varchar (50),
	Diabetes varchar (50),
	Hyperlipidemia varchar (50),
	BackPain varchar (50),
	Anxiety varchar (50),
	Allergic_rhinitis varchar (50),
	Reflux_esophagitis varchar (50),
	Asthma varchar (50),
)
 go

insert into health_info(Customer_id, SeniorCitizen, HighBlood, Stroke, Complication_Risk, Overweight, Arthritis, Diabetes, Hyperlipidemia, BackPain, Anxiety, Allergic_rhinitis, Reflux_esophagitis, Asthma)
select Customer_id, SeniorCitizen, HighBlood, Stroke, Complication_Risk, Overweight, Arthritis, Diabetes, Hyperlipidemia, BackPain, Anxiety, Allergic_rhinitis, Reflux_esophagitis, Asthma 
from dbo.INPUT_DATA

select * from health_info

-- Hence now we have four tables in the MEDICAL_INFO db namely customer, customer_info, health_info, and location_info. Therefore, as a part of creating 3NF, I seperated INPUT_DATA into 4 diffrent tables.

-- 5.	Declare PK and FK in these new tables.

-- I already declared it in the part 4. But to make it easier for you, I will list PK, FK here:
-- Table customer: PK = Customer_id, no FK
-- Table Customer_info: PK = will add a new column called info_id and set it as PK constraint, FK = Customer_id
-- Table location_info: Pk = will add a new column called location_id and set it as PK constraint, FK = Customer_id
-- Table Health_info: PK = not needed, FK = Customer_id

--6.	Create indexes/constraints as needed.

ALTER TABLE customer_info
Add info_id int not null IDENTITY(1,1)

ALTER TABLE customer_info
ADD CONSTRAINT info_id PRIMARY KEY (info_id);

ALTER TABLE location_info
Add location_id int not null IDENTITY(1,1)

ALTER TABLE location_info
ADD CONSTRAINT location_id PRIMARY KEY (location_id);

CREATE UNIQUE  NONCLUSTERED INDEX Customer_id
ON customer (Customer_id);

-- 7.	Create an Extra table CARDIAC_CUSTOMERS  with columns ID (identity column), CUSTOMER_ID, HIGH_BLOOD, OVERWEIGHT, STROKE, HYPERLIPIDEMIA

CREATE TABLE CARDIAC_CUSTOMERS (
	--ID int NOT NULL IDENTITY(1, 1),
	CUSTOMER_ID VARCHAR(20) references customer(Customer_id),
	HIGH_BLOOD varchar(50) not null,
	OVERWEIGHT varchar (50) not null,
	STROKE varchar (50) not null,
	HYPERLIPIDEMIA varchar (50) not null)
	go

insert into CARDIAC_CUSTOMERS (CUSTOMER_ID, HIGH_BLOOD, OVERWEIGHT, STROKE, HYPERLIPIDEMIA)
select Customer_id, HighBlood, Overweight, Stroke, Hyperlipidemia
from INPUT_DATA

ALTER TABLE CARDIAC_CUSTOMERS
Add ID int not null IDENTITY(1,1)
select * from CARDIAC_CUSTOMERS

-- 8.	Select all Customers  with HIGH_BLOOD (input data) and/or HYPERLIPIDEMIA and insert this data in the CARDIAC_CUSTOMERS  table
-- oops did this part already in question 7! But here you go again.
insert into CARDIAC_CUSTOMERS (HIGH_BLOOD, HYPERLIPIDEMIA)
select HighBlood, Hyperlipidemia
from INPUT_DATA

--9.	Generate a list of Customers  with Customer_id, ordered by AGE, showing which is the most common disease amongst Senior Citizens.
select count(*)
from health_info
where SeniorCitizen = 'yes' AND HighBlood = 'yes'   -- gives 1443

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Stroke = 'yes'   -- gives 679

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Overweight = 'yes'   -- gives 2419

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Arthritis = 'yes'   -- gives 1246

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Diabetes = 'yes'   -- gives 949

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Hyperlipidemia = 'yes'   -- gives 1118

select count(*)
from health_info
where SeniorCitizen = 'yes' AND BackPain = 'yes'   -- gives 1425

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Anxiety = 'yes'   -- gives 1108

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Allergic_rhinitis = 'yes'   -- gives 1388

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Reflux_esophagitis = 'yes'   -- gives 1403

select count(*)
from health_info
where SeniorCitizen = 'yes' AND Asthma = 'yes'   -- gives 1023
--from the results we can see that the most common disease amongst senior citizen is Overweight. 2419 senior citizens are affected by overweight.
-- here is how we will display the query results: 
select Customer_id, Age, SeniorCitizen, Overweight
from INPUT_DATA
where SeniorCitizen = 'yes' AND Overweight = 'yes'
order by Age

--10.	Generate a list of Customers  with Customer_id, ordered by AGE, showing which is the least common disease amongst Female Customers .
select count(*)
from INPUT_DATA
where Gender = 'Female' AND HighBlood = 'yes'  --gives 2003

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Stroke = 'yes'  --gives 953

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Overweight = 'yes'  --gives 3425

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Arthritis = 'yes'  --gives 1760

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Diabetes = 'yes'  --gives 1322

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Hyperlipidemia = 'yes'  --gives 1663

select count(*)
from INPUT_DATA
where Gender = 'Female' AND BackPain = 'yes'  --gives 1964

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Anxiety = 'yes'  --gives 1539

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Allergic_rhinitis = 'yes'  --gives 1898

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Reflux_esophagitis = 'yes'  --gives 1950

select count(*)
from INPUT_DATA
where Gender = 'Female' AND Asthma = 'yes'  --gives 1418
--from the results we can see that the least common disease amongst females is Stroke. 953 females are affected by stroke.
-- here is how we will display the query results: 
select Customer_id, Age, Gender, Stroke
from INPUT_DATA
where Gender = 'Female' AND Stroke = 'yes'
order by Age

--11.	 Generate a list of Customers  with Customer_id, ordered by AGE, showing which is the most common disease amongst all customers.
select count(*)
from INPUT_DATA
where HighBlood = 'yes'   -- gives 4090

select count(*)
from INPUT_DATA
where Stroke = 'yes'   -- gives 1993

select count(*)
from INPUT_DATA
where Overweight = 'yes'   -- gives 7094

select count(*)
from INPUT_DATA
where Arthritis = 'yes'   -- gives 3574

select count(*)
from INPUT_DATA
where Diabetes = 'yes'   -- gives 2738

select count(*)
from INPUT_DATA
where Hyperlipidemia = 'yes'   -- gives 3372

select count(*)
from INPUT_DATA
where BackPain = 'yes'   -- gives 4114

select count(*)
from INPUT_DATA
where Anxiety = 'yes'   -- gives 3215

select count(*)
from INPUT_DATA
where Allergic_rhinitis = 'yes'   -- gives 3941

select count(*)
from INPUT_DATA
where Reflux_esophagitis = 'yes'   -- gives 4135

select count(*)
from INPUT_DATA
where Asthma = 'yes'   -- gives 2893
--from the results we can see that the most common disease amongst all customers is overweight. 7094 customers are affected by overweight. Whoa that's a lot!
-- here is how we will display the query results: 
select Customer_id, Age, Overweight
from INPUT_DATA
where Overweight = 'yes'
order by Age

--12.	 Generate a list of Customers with Customer_ids who have anxiety, and are overweight and have Reflux_esophagitis and/or Allergic_rhinitis and/or Asthma. 


select count(*)
from INPUT_DATA
where Anxiety = 'yes' AND Overweight = 'yes' AND  Reflux_esophagitis = 'yes' AND Allergic_rhinitis = 'yes' AND Asthma = 'yes'   -- gives 113

--from the results we can see that there are 113 customers who are affected by anxiety, and are overweight and have Reflux_esophagitis and Allergic_rhinitis and Asthma.
-- here is how we will display the query results: 
select Customer_id, Age, Overweight, Anxiety, Reflux_esophagitis, Allergic_rhinitis, Asthma
from INPUT_DATA
where Anxiety = 'yes' AND Overweight = 'yes' AND  Reflux_esophagitis = 'yes' AND Allergic_rhinitis = 'yes' AND Asthma = 'yes'
order by Age   --not required but still


