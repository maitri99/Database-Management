create table Star_Ratings(
Star_Rating_Code CHAR(15),
Star_Rating_Image VARCHAR(250) not null,
PRIMARY KEY (Star_Rating_Code)
);
go
create table Hotel_Chains(
Hotel_Chain_Code CHAR(15) NOT NULL,
Hotel_Chain_Name VARCHAR(255),
PRIMARY KEY (Hotel_Chain_Code)
);
go
create table Ref_Country_Codes(
Country_Code CHAR(15) NOT NULL,
Country_Currency CHAR(15) NOT NULL,
Country_Name VARCHAR(80),
Standard_Exchange_Rate REAL
PRIMARY KEY (Country_Code)
);
go
create table Hotels(
Hotel_ID INT NOT NULL,
Hotel_Chain_Code CHAR(15),
Country_Code CHAR(15),
Star_Rating_Code CHAR(15),
Hotel_Name VARCHAR(255) NOT NULL,
Email_Address VARCHAR(250),
Hotel_Address VARCHAR(255),
Hotel_URL VARCHAR(255),
Other_Details VARCHAR(255),
PRIMARY KEY ( Hotel_ID),
FOREIGN KEY (Hotel_Chain_Code) REFERENCES Hotel_Chains(Hotel_Chain_Code),
FOREIGN KEY (Country_Code) REFERENCES Ref_Country_Codes(Country_Code),
FOREIGN KEY (Star_Rating_Code) REFERENCES Star_Ratings(Star_Rating_Code)
);
go
create table Hotel_Characteristics(
Characteristic_Code CHAR(15) NOT NULL,
Characteristic_Code_Description VARCHAR(255),
PRIMARY KEY (Characteristic_Code)
);
go
create table Specific_Hotel_Characteristics(
Characteristic_Code CHAR(15) NOT NULL,
Hotel_ID INT NOT NULL,
PRIMARY KEY (Characteristic_Code, Hotel_ID),

FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID),
FOREIGN KEY (Characteristic_Code) REFERENCES Hotel_Characteristics(Characteristic_Code)
);
go
create table Room_Types(
Room_Type_Code CHAR(15) NOT NULL,
Room_Standard_Rate Money,
Room_Type_Description VARCHAR(255),
PRIMARY KEY (Room_Type_Code)
);
go
create table Rooms(
Room_ID INT NOT NULL,
Hotel_ID INT NOT NULL,
Room_Type_Code CHAR(15),
Room_Floor CHAR(10),
Room_Number CHAR(10),
Room_Rate REAL,
Smoking_YN CHAR(1),
Other_Details VARCHAR(255),
PRIMARY KEY (Room_ID),
FOREIGN KEY (Hotel_ID) REFERENCES Hotels(Hotel_ID),
FOREIGN KEY (Room_Type_Code) REFERENCES Room_Types(Room_Type_Code)
);
go
create table Agents(
agent_ID INT NOT NULL,
agent_details VARCHAR(255),
PRIMARY KEY (agent_ID),
);
go
create table Agent_Reservations(
agent_Reservation_ID INT,
agent_ID INT NOT NULL,
total_Guest_Count INT,
agent_Reservation_Made_Date DATETIME,
PRIMARY KEY (agent_Reservation_ID),
FOREIGN KEY (agent_ID ) REFERENCES agents(agent_ID )
);
go
create table Booking_Status(
Booking_Status_Code CHAR(15) NOT NULL,
Booking_Status_Description VARCHAR(255),
PRIMARY KEY (Booking_Status_Code)
);
go
create table Room_Availability(
Room_ID INT NOT NULL,
Day_Date DATETIME,
room_Availability_Count INT,
PRIMARY KEY (Room_ID),
FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);
go
create table Daily_Room_Rates(
Hotel_ID INT NOT NULL,
Day_Date DATETIME,
Room_ID INT NOT NULL,
Daily_Room_Rate_Offered REAL,
Daily_Room_Rate_Accepted REAL,
PRIMARY KEY (Hotel_ID, Day_Date, Room_ID),
FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID)
);
go
create table Guests(
Guest_ID INT NOT NULL,
Guest_Details VARCHAR(255),
PRIMARY KEY (Guest_ID)
);
go
create table Bookings(
Booking_ID INT NOT NULL,
Agent_Reservation_ID INT NOT NULL,
Booking_Status_Code CHAR(15),
Guest_ID INT NOT NULL,
Room_ID INT NOT NULL,
Date_From DATETIME,
Date_To DATETIME,
PRIMARY KEY (Booking_ID),
FOREIGN KEY (Room_ID) REFERENCES Rooms(Room_ID),
FOREIGN KEY (Agent_Reservation_ID) REFERENCES Agent_Reservations(Agent_Reservation_ID),
FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
FOREIGN KEY (Booking_Status_Code) REFERENCES Booking_Status(Booking_Status_Code)
);
go
create table Guest_Checkout(
Guest_ID  INT, 
Booking_Id  INT, 
Checkout_Date  DATETIME, 
Paid_Amount  Money, 
Payment_Details  NCHAR(50),
PRIMARY KEY (Guest_ID),
FOREIGN KEY (Guest_ID) REFERENCES Guests(Guest_ID),
FOREIGN KEY (Booking_ID) REFERENCES Bookings (Booking_ID)
);
go
CREATE TABLE Guest_Messages(
	Message_ID INT, 
	Guest_ID INT, 
	Message_Details varchar(150)
	Primary key (Message_ID),
	Foreign key (Guest_ID) REFERENCES Guests (Guest_ID)
);
go
CREATE TRIGGER goodbye_email
	ON Guest_Messages
	AFTER INSERT
	AS
	BEGIN
		print 'Thank You'
	END

go

select *
from Guest_Messages

insert into Guest_Messages (Message_ID, Guest_ID)
	values ('Thank You', 'Thank You')

go

