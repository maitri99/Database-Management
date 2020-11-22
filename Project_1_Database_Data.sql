	create table authors
	(au_id varchar(20)not null,
	au_lname varchar(40) not null,
	au_fname varchar(20) not null,
	phone char(12) not null,
	address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	country varchar(12) null,
	postalcode char(10) null,
	unique nonclustered (au_id))
go
	create table publishers
	(pub_id char(4) not null,
	pub_name varchar(40) not null,
	city varchar(20) null,
	state char(2) null,
	unique nonclustered (pub_id))
go
	create table titles
	(title_id varchar(20) not null,
	title varchar(80) not null,
	type char(12) not null,
	pub_id char(4) null
		references publishers(pub_id),
	price money null,
	advance numeric(12,2) null,
	num_sold int null,
	notes varchar(200) null,
	pubdate datetime not null,
	contract bit not null,
	unique nonclustered (title_id))
go
	create table roysched
	(title_id varchar(20) not null
		references titles(title_id),
	lorange int null,
	hirange int null,
	royalty int null)
go
	create table stores
	(stor_id char(4) not null,
	stor_name varchar(40) not null,
	stor_address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	country varchar(12) null,
	postalcode char(10) null,
	payterms varchar(12) null,
	unique nonclustered (stor_id))
go
	create table sales
	(stor_id char(4) not null
		references stores(stor_id),
	ord_num numeric(6,0) identity,
	date datetime not null,
	unique nonclustered (ord_num))
go
	create table store_employees
	(stor_id char(4) null
		references stores(stor_id),
	emp_id varchar(20)not null,
	mgr_id varchar(20)null
		references store_employees(emp_id),
	emp_lname varchar(40) not null,
	emp_fname varchar(20) not null,
	phone char(12) null,
	address varchar(40) null,
	city varchar(20) null,
	state char(2) null,
	country varchar(12) null,
	postalcode varchar(10) null,
	unique nonclustered (emp_id))
go
	create table salesdetail
	(stor_id char(4) not null
		references stores(stor_id),
	ord_num numeric(6,0)
		references sales(ord_num),
	title_id varchar(20) not null
		references titles(title_id),
	qty smallint not null,
	discount float not null)
go
	create table titleauthor
	(au_id varchar(20)not null
		references authors(au_id),
	title_id varchar(20) not null
		references titles(title_id),
	au_ord tinyint null,
	royaltyper int null)
go
	create table discounts
	(discounttype   varchar(40) not null,
	stor_id         char(4) null
		references stores(stor_id),
	lowqty          smallint null,
	highqty         smallint null,
	discount        float not null)
go
	create table blurbs
	(au_id	 varchar(20)  not null
		references authors(au_id),
	 copy	text null)
insert authors
values ('409-56-7008', 'Bennet', 'Abraham',
'510 658-9932', '6223 Bateman St.', 'Berkeley', 'CA', 'USA', '94705')
go
insert authors
values ('213-46-8915', 'Green', 'Marjorie',
'510 986-7020', '309 63rd St. #411', 'Oakland', 'CA', 'USA', '94618')
go
insert authors
values ('238-95-7766', 'Carson', 'Cheryl',
'510 548-7723', '589 Darwin Ln.', 'Berkeley', 'CA', 'USA', '94705')
go
insert authors
values ('998-72-3567', 'Ringer', 'Albert',
'801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', 'USA', '84152')
go
insert authors
values ('899-46-2035', 'Ringer', 'Anne',
'801 826-0752', '67 Seventh Av.', 'Salt Lake City', 'UT', 'USA', '84152')
go
insert authors
values ('722-51-5454', 'DeFrance', 'Michel',
'219 547-9982', '3 Balding Pl.', 'Gary', 'IN', 'USA', '46403')
go
insert authors
values ('807-91-6654', 'Panteley', 'Sylvia',
'301 946-8853', '1956 Arlington Pl.', 'Rockville', 'MD', 'USA', '20853')
go
insert authors
values ('893-72-1158', 'McBadden', 'Heather',
'707 448-4982', '301 Putnam', 'Vacaville', 'CA', 'USA', '95688')
go
insert authors
values ('724-08-9931', 'Stringer', 'Dirk',
'510 843-2991', '5420 Telegraph Av.', 'Oakland', 'CA', 'USA', '94609')
go
insert authors
values ('274-80-9391', 'Straight', 'Dick',
'510 834-2919', '5420 College Av.', 'Oakland', 'CA', 'USA', '94609')
go
insert authors
values ('756-30-7391', 'Karsen', 'Livia',
'510 534-9219', '5720 McAuley St.', 'Oakland', 'CA', 'USA', '94609')
go
insert authors
values ('724-80-9391', 'MacFeather', 'Stearns',
'510 354-7128', '44 Upland Hts.', 'Oakland', 'CA', 'USA', '94612')
go
insert authors
values ('427-17-2319', 'Dull', 'Ann',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', 'USA', '94301')
go
insert authors
values ('672-71-3249', 'Yokomoto', 'Akiko',
'415 935-4228', '3 Silver Ct.', 'Walnut Creek', 'CA', 'USA', '94595')
go
insert authors
values ('267-41-2394', 'O''Leary', 'Michael',
'408 286-2428', '22 Cleveland Av. #14', 'San Jose', 'CA', 'USA', '95128')
go
insert authors
values ('472-27-2349', 'Gringlesby', 'Burt',
'707 938-6445', 'PO Box 792', 'Covelo', 'CA', 'USA', '95428')
go
insert authors
values ('527-72-3246', 'Greene', 'Morningstar',
'615 297-2723', '22 Graybar House Rd.', 'Nashville', 'TN', 'USA', '37215')
go
insert authors
values ('172-32-1176', 'White', 'Johnson',
'408 496-7223', '10932 Bigge Rd.', 'Menlo Park', 'CA', 'USA', '94025')
go
insert authors
values ('712-45-1867', 'del Castillo', 'Innes',
'615 996-8275', '2286 Cram Pl. #86', 'Ann Arbor', 'MI', 'USA', '48105')
go
insert authors
values ('846-92-7186', 'Hunter', 'Sheryl',
'415 836-7128', '3410 Blonde St.', 'Palo Alto', 'CA', 'USA', '94301')
go
insert authors
values ('486-29-1786', 'Locksley', 'Chastity',
'415 585-4620', '18 Broadway Av.', 'San Francisco', 'CA', 'USA', '94130')
go
insert authors
values ('648-92-1872', 'Blotchet-Halls', 'Reginald',
'503 745-6402', '55 Hillsdale Bl.', 'Corvallis', 'OR', 'USA', '97330')
go
insert authors
values ('341-22-1782', 'Smith', 'Meander',
'913 843-0462', '10 Mississippi Dr.', 'Lawrence', 'KS', 'USA', '66044')
go
insert publishers
values ('0736', 'New Age Books', 'Boston', 'MA')
go
insert publishers
values ('0877', 'Binnet & Hardley', 'Washington', 'DC')
go
insert publishers
values ('1389', 'Algodata Infosystems', 'Berkeley', 'CA')
go
insert titles
values ('PC8888', 'Secrets of Silicon Valley',
'popular_comp', '1389', $20.00, $8000.00, 4095,
'Muckraking reporting by two courageous women on the world''s largest computer hardware and software manufacturers.',
'06/12/87', 1)
go
insert titles
values ('BU1032', 'The Busy Executive''s Database Guide',
'business', '1389', $19.99, $5000.00, 4095,
'An overview of available database systems with emphasis on common business applications.  Illustrated.',
'06/12/86', 1)
go
insert titles
values ('PS7777', 'Emotional Security: A New Algorithm',
'psychology', '0736', $7.99, $4000.00, 3336,
'Protecting yourself and your loved ones from undue emotional stress in the modern world.  Use of computer and nutritional aids emphasized.',
'06/12/88', 1)
go
insert titles
values ('PS3333', 'Prolonged Data Deprivation: Four Case Studies',
'psychology', '0736', $19.99, $2000.00, 4072,
'What happens when the data runs dry?  Searching evaluations of information-shortage effects on heavy users.',
'06/12/88', 1)
go
insert titles
values ('BU1111', 'Cooking with Computers: Surreptitious Balance Sheets',
'business', '1389', $11.95, $5000.00, 3876,
'Helpful hints on how to use your electronic resources to the best advantage.', '06/09/88', 1)
go
insert titles
values ('MC2222', 'Silicon Valley Gastronomic Treats',
'mod_cook', '0877', $19.99, $0.00, 2032,
'Favorite recipes for quick, easy, and elegant meals, tried and tested by people who never have time to eat, let alone cook.',
'06/09/89', 1)
go
insert titles
values ('TC7777', 'Sushi, Anyone?',
'trad_cook', '0877', $14.99, $8000.00, 4095,
'Detailed instructions on improving your position in life by learning how to make authentic Japanese sushi in your spare time.  5-10% increase in number of friends per recipe reported from beta test.',
'06/12/87', 1)
go
insert titles
values ('TC4203', 'Fifty Years in Buckingham Palace Kitchens',
'trad_cook', '0877', $11.95, $4000.00, 15096,
'More anecdotes from the Queen''s favorite cook describing life among English royalty.  Recipes, techniques, tender vignettes.',
'06/12/85', 1)
go
insert titles
values ('PC1035', 'But Is It User Friendly?',
'popular_comp', '1389', $22.95, $7000.00, 8780,
'A survey of software for the naive user, focusing on the "friendliness" of each.',
'06/30/86', 1)
go
insert titles
values ('BU2075', 'You Can Combat Computer Stress!',
'business', '0736', $2.99, $10125.00, 18722,
'The latest medical and psychological techniques for living with the electronic office.  Easy-to-understand explanations.',
'06/30/85', 1)
go
insert titles
values ('PS2091', 'Is Anger the Enemy?',
'psychology', '0736', $10.95, $2275.00, 2045,
'Carefully researched study of the effects of strong emotions on the body.  Metabolic charts included.',
'06/15/89', 1)
go
insert titles
values ('PS2106', 'Life Without Fear',
'psychology', '0736', $7.00, $6000.00, 111,
'New exercise, meditation, and nutritional techniques that can reduce the shock of daily interactions. Popular audience.  Sample menus included, exercise video available separately.',
'10/05/90', 1)
go
insert titles
values ('MC3021', 'The Gourmet Microwave',
'mod_cook', '0877', $2.99, $15000.00, 22246,
'Traditional French gourmet recipes adapted for modern microwave cooking.',
'06/18/85', 1)
go
insert titles
values ('TC3218',
'Onions, Leeks, and Garlic: Cooking Secrets of the Mediterranean',
'trad_cook', '0877', $20.95, $7000.00, 375,
'Profusely illustrated in color, this makes a wonderful gift book for a cuisine-oriented friend.',
'10/21/90', 1)
go

insert titles
values ('BU7832', 'Straight Talk About Computers',
'business', '1389', $19.99, $5000.00, 4095,
'Annotated analysis of what computers can do for you: a no-hype guide for the critical user.',
'06/22/87', 1)
go
insert titles
values ('PS1372',
'Computer Phobic and Non-Phobic Individuals: Behavior Variations',
'psychology', '0877', $21.59, $7000.00, 375,
'A must for the specialist, this book examines the difference between those who hate and fear computers and those who think they are swell.',
'10/21/90', 1)
go


insert roysched
values ('BU1032', 0, 5000, 10)
go
insert roysched
values ('BU1032', 5001, 50000, 12)
go
insert roysched
values ('PC1035', 0, 2000, 10)
go
insert roysched
values ('PC1035', 2001, 3000, 12)
go
insert roysched
values ('PC1035', 3001, 4000, 14)
go
insert roysched
values ('PC1035', 4001, 10000, 16)
go
insert roysched
values ('PC1035', 10001, 50000, 18)
go
insert roysched
values ('BU2075', 0, 1000, 10)
go
insert roysched
values ('BU2075', 1001, 3000, 12)
go
insert roysched
values ('BU2075', 3001, 5000, 14)
go
insert roysched
values ('BU2075', 5001, 7000, 16)
go
insert roysched
values ('BU2075', 7001, 10000, 18)
go
insert roysched
values ('BU2075', 10001, 12000, 20)
go
insert roysched
values ('BU2075', 12001, 14000, 22)
go
insert roysched
values ('BU2075', 14001, 50000, 24)
go
insert roysched
values ('PS2091', 0, 1000, 10)
go
insert roysched
values ('PS2091', 1001, 5000, 12)
go
insert roysched
values ('PS2091', 5001, 10000, 14)
go
insert roysched
values ('PS2091', 10001, 50000, 16)
go
insert roysched
values ('PS2106', 0, 2000, 10)
go
insert roysched
values ('PS2106', 2001, 5000, 12)
go
insert roysched
values ('PS2106', 5001, 10000, 14)
go
insert roysched
values ('PS2106', 10001, 50000, 16)
go
insert roysched
values ('MC3021', 0, 1000, 10)
go
insert roysched
values ('MC3021', 1001, 2000, 12)
go
insert roysched
values ('MC3021', 2001, 4000, 14)
go
insert roysched
values ('MC3021', 4001, 6000, 16)
go
insert roysched
values ('MC3021', 6001, 8000, 18)
go
insert roysched
values ('MC3021', 8001, 10000, 20)
go
insert roysched
values ('MC3021', 10001, 12000, 22)
go
insert roysched
values ('MC3021', 12001, 50000, 24)
go
insert roysched
values ('TC3218', 0, 2000, 10)
go
insert roysched
values ('TC3218', 2001, 4000, 12)
go
insert roysched
values ('TC3218', 4001, 6000, 14)
go
insert roysched
values ('TC3218', 6001, 8000, 16)
go
insert roysched
values ('TC3218', 8001, 10000, 18)
go
insert roysched
values ('TC3218', 10001, 12000, 20)
go
insert roysched
values ('TC3218', 12001, 14000, 22)
go
insert roysched
values ('TC3218', 14001, 50000, 24)
go
insert roysched
values ('PC8888', 0, 5000, 10)
go
insert roysched
values ('PC8888', 5001, 10000, 12)
go
insert roysched
values ('PC8888', 10001, 15000, 14)
go
insert roysched
values ('PC8888', 15001, 50000, 16)
go
insert roysched
values ('PS7777', 0, 5000, 10)
go
insert roysched
values ('PS7777', 5001, 50000, 12)
go
insert roysched
values ('PS3333', 0, 5000, 10)
go
insert roysched
values ('PS3333', 5001, 10000, 12)
go
insert roysched
values ('PS3333', 10001, 15000, 14)
go
insert roysched
values ('PS3333', 15001, 50000, 16)
go
insert roysched
values ('BU1111', 0, 4000, 10)
go
insert roysched
values ('BU1111', 4001, 8000, 12)
go
insert roysched
values ('BU1111', 8001, 10000, 14)
go
insert roysched
values ('BU1111', 12001, 16000, 16)
go
insert roysched
values ('BU1111', 16001, 20000, 18)
go
insert roysched
values ('BU1111', 20001, 24000, 20)
go
insert roysched
values ('BU1111', 24001, 28000, 22)
go
insert roysched
values ('BU1111', 28001, 50000, 24)
go
insert roysched
values ('MC2222', 0, 2000, 10)
go
insert roysched
values ('MC2222', 2001, 4000, 12)
go
insert roysched
values ('MC2222', 4001, 8000, 14)
go
insert roysched
values ('MC2222', 8001, 12000, 16)
go
insert roysched
values ('MC2222', 8001, 12000, 16)
go
insert roysched
values ('MC2222', 12001, 20000, 18)
go
insert roysched
values ('MC2222', 20001, 50000, 20)
go
insert roysched
values ('TC7777', 0, 5000, 10)
go
insert roysched
values ('TC7777', 5001, 15000, 12)
go
insert roysched
values ('TC7777', 15001, 50000, 14)
go
insert roysched
values ('TC4203', 0, 2000, 10)
go
insert roysched
values ('TC4203', 2001, 8000, 12)
go
insert roysched
values ('TC4203', 8001, 16000, 14)
go
insert roysched
values ('TC4203', 16001, 24000, 16)
go
insert roysched
values ('TC4203', 24001, 32000, 18)
go
insert roysched
values ('TC4203', 32001, 40000, 20)
go
insert roysched
values ('TC4203', 40001, 50000, 22)
go
insert roysched
values ('BU7832', 0, 5000, 10)
go
insert roysched
values ('BU7832', 5001, 10000, 12)
go
insert roysched
values ('BU7832', 10001, 15000, 14)
go
insert roysched
values ('BU7832', 15001, 20000, 16)
go
insert roysched
values ('BU7832', 20001, 25000, 18)
go
insert roysched
values ('BU7832', 25001, 30000, 20)
go
insert roysched
values ('BU7832', 30001, 35000, 22)
go
insert roysched
values ('BU7832', 35001, 50000, 24)
go
insert roysched
values ('PS1372', 0, 10000, 10)
go
insert roysched
values ('PS1372', 10001, 20000, 12)
go
insert roysched
values ('PS1372', 20001, 30000, 14)
go
insert roysched
values ('PS1372', 30001, 40000, 16)
go
insert roysched
values ('PS1372', 40001, 50000, 18)
go
insert stores
values ('7066', 'Barnum''s', '7 Thunderbird Dr.', 'Twentynine Palms', 'CA',
	'USA', '98198', 'Net 30')
go
insert stores
values ('7067', 'News & Brews', '577 First St.', 'Los Gatos', 'CA',
	'USA', '96745', 'Net 30')
go
insert stores
values ('7131', 'Doc-U-Mat: Quality Laundry and Books', '2831 Page St.',
	'Renton', 'WA', 'USA', '98058', 'Net 60')
go
insert stores
values ('8042', 'Bookbeat', '679 Carson St.', 'Portland', 'OR', 'USA',
	'97231', 'Net 30')
go
insert stores
values ('6380', 'Eric the Read Books', '788 Catamaugus Ave.', 'Seattle', 'WA',
	'USA', '98056', 'Net 60')
go
insert stores
values ('7896', 'Fricative Bookshop', '89 Madison St.', 'Fremont', 'CA',
	'USA', '94539', 'Net 60')
go
insert stores
values ('5023', 'Thoreau Reading Discount Chain', '20435 Walden Expressway',
	'Concord', 'MA',
	'USA', '01776', 'Net 60') 
go

set identity_insert sales on
go
insert sales (stor_id, ord_num, date) values ('7066', 100001, '10/12/96')
go
set identity_insert sales off
go
insert sales values ('5023', '10/31/95')
go
insert sales values ('5023', '11/06/95')
go
insert sales values ('8042', '07/13/96')
go
insert sales values ('7896', '08/14/96')
go
insert sales values ('7131', '11/16/96')
go
insert sales values ('5023', '12/12/96')
go
insert sales values ('7067', '01/02/97')
go
insert sales values ('5023', '12/01/96')
go
insert sales values ('5023', '03/18/97')
go
insert sales values ('7131', '09/08/96')
go
insert sales values ('7066', '10/27/95')
go
insert sales values ('8042', '03/20/97')
go
insert sales values ('8042', '03/20/97')
go
insert sales values ('8042', '02/20/97')
go
insert sales values ('8042', '01/13/97')
go
insert sales values ('7896', '02/14/97')
go
insert sales values ('5023', '02/15/97')
go
insert sales values ('7131', '12/20/95')
go
insert sales values ('5023', '07/27/94')
go
insert sales values ('7066', '08/05/96')
go
insert sales values ('5023', '03/21/97')
go
insert sales values ('8042', '05/23/95')
go
insert sales values ('7067', '06/13/95')
go
insert sales values ('5023', '03/21/97')
go
insert sales values ('5023', '03/21/97')
go
insert sales values ('5023', '03/21/97')
go
insert sales values ('6380', '12/13/94')
go
insert sales values ('6380', '02/17/95')
go
insert store_employees values ('7066', '415-92-7301', '415-92-7301', 'Chichikov', 'P.', '619 336-8978', '20 Alfalfa Ave.', 'Twentynine Palms',
'CA', 'USA', '92277')
go
insert store_employees values ('7066', '202-93-0009', '415-92-7301', 
'Spindleshanks', 'Daisy', '619 336-8900', '14 Wild Cat Way', 'Twentynine 
Palms', 'CA', 'USA', '92277')
go
insert store_employees values ('7066', '444-89-2342', '415-92-7301',
'Ratsbane', 'Ian', '619 344-9232', '1827 Roadrunner Dr.', 'Twentynine Palms', 
'CA', 'USA', '92278')
go
insert store_employees values ('7066', '332-78-2382', '415-92-7301',
'Bayless', 'Chuck', '619 777-4356', '7 Maynard Dr.', 'Twentynine Palms', 
'CA', 'USA', '92277')
go
insert store_employees values ('7066', '898-00-2383', '415-92-7301',
'Pumpion', 'Tammy', '619 222-3434', '10089 Lazy Joe Ave.', 'Twentynine 
Palms', 'CA', 'USA', '92277')
go
insert store_employees values ('7066', '222-90-3737', '415-92-7301', 
'Barnum', 'Arthur', '619 333-3232', '522 Lupine Ave.', 'Twentynine Palms',
'CA', 'USA', '92277')
go
insert store_employees values ('7066', '939-32-1212', '415-92-7301', 
'Ronald', 'Bill', '619 333-2323', '69 Coyote Court', 'Twentynine Palms', 
'CA', 'USA', '92277')
go
insert store_employees values ('7067', '343-38-9494', '343-38-9494',
'St. Augustine', 'Fiona', '408 222-8383', '17 Call of the Wild Rd.', 
'Los Gatos', 'CA', 'USA', '95030')
go
insert store_employees values ('7067', '222-90-3483', '343-38-9494',
'Sebastian', 'Basil', '408 334-8928', '29 Dharma Rd.', 'Los Gatos',
'CA', 'USA', '95030')
go
insert store_employees values ('7067', '121-00-3823', '343-38-9494',
'Marchmain', 'Albin', '408 343-8934', '1001 Top of the Hill Ct.', 
'Los Gatos', 'CA', 'USA', '95030')
go
insert store_employees values ('7067', '232-29-8938', '343-38-9494',
'Barlow', 'Hilary', '408 232-3332', '2 Topping Way', 'Los Gatos', 'CA',
'USA', '95032')
go
insert store_employees values ('7067', '232-89-9393', '343-38-9494', 
'Dieuberi', 'Gustav', '408 675-8938', '30 Mount Madonna Rd.', 
'Los Gatos', 'CA', 'USA', '95030')
go
insert store_employees values ('7131', '565-67-3920', '565-67-3920',
'Lavator', 'Marie', '206 328-2838', '14 Peter Grubb Rd. SE', 'Renton',
'WA', 'USA', '98058')
go
insert store_employees values ('7131', '848-34-4838', '565-67-3920',
'Sope', 'Inez', '206 438-3434', '1238 Index Ave. SE', 'Renton', 'WA',
'USA', '98058')
go
insert store_employees values ('7131', '232-38-2232', '565-67-3920',
'Tubb', 'Wally', '206 323-2828', '180 Moses Lane S', 'Renton', 'WA',
'USA', '98058')
go
insert store_employees values ('7131', '111-90-3283', '565-67-3920',
'Basin', 'Chalker', '206 323-7777', '192 Naches Ave. N', 'Renton',
'WA', 'USA', '98055')
go
insert store_employees values ('7131', '323-32-4444', '565-67-3920',
'Waters', 'Johnny', '206 323-9020', '1 Pelly Ave. N', 'Renton', 'WA',
'USA', '98055')
go
insert store_employees values ('7131', '238-32-0079', '565-67-3920',
'Scrubb', 'Billy', '206 444-3232', '90 Vashion St. NE', 'Renton', 'WA',
'USA', '98059')
go
insert store_employees values ('7131', '349-00-9393', '565-67-3920',
'Tuwel', 'Terry', '206 323-3233', '66 Sunset Blvd. SW', 'Renton', 'WA',
'USA', '98055')
go
insert store_employees values ('8042', '723-99-9329', '723-99-9329',
'Crookshank', 'Flannery', '503 323-9090', 'SW 222 Laber Ct.', 'Portland',
'OR', 'USA', '97221')
go
insert store_employees values ('8042', '343-32-0034', '723-99-9329',
'Sitwell', 'Davenport', '503 333-9494', '14 SE Krause Lane', 'Portland',
'OR', 'USA', '97236')
go
insert store_employees values ('8042', '877-12-9393', '723-99-9329',
'Bartholomew', 'Curan', '503 333-9332', '18 SE Knee St.', 'Portland',
'OR', 'USA', '97266')
go
insert store_employees values ('8042', '323-99-0009', '723-99-9329',
'Yaddo', 'Mary', '503 333-4844', 'NE Klickitat St.', 'Portland', 'OR',
'USA', '97212')
go
insert store_employees values ('8042', '434-94-3203', '723-99-9329',
'Peacock', 'Mavis', '503 494-3413', '4978 SW Huns Rd.', 'Portland',
'OR', 'USA', '97223')
go
insert store_employees values ('8042', '232-94-5885', '723-99-9329',
'Baldwin', 'Dorothy', '503 333-9494', '9 N. Image Canoe Ave.', 
'Portland', 'OR', 'USA', '97217')
go
insert store_employees values ('8042', '323-09-5872', '723-99-9329',
'Corbit', 'P.', '503 335-3491', '8989 NW Industry St.', 'Portland',
'OR', 'USA', '97210')
go
insert store_employees values ('8042', '323-54-3434', '723-99-9329',
'Pilkinton', 'Faith', '503 333-4531', '18 SW Inez St.', 'Portland',
'OR', 'USA', '97224')
go
insert store_employees values ('8042', '331-90-8484', '723-99-9329',
'Botteghe', 'Obscura', '503 889-2832', '555 SW Keerins Ct.', 'Portland',
'OR', 'USA', '97223')
go
insert store_employees values ('8042', '884-32-8282', '723-99-9329',
'Martineau', 'Tristan', '503 323-5954', '346 N. Leade Rd.', 
'Portland', 'OR', 'USA', '97203')
go
insert store_employees values ('8042', '112-90-3829', '723-99-9329',
'Laughton', 'Karla', '503 323-5929', '900 N. Magpie St.', 
'Portland', 'OR', 'USA', '97202')
go
insert store_employees values ('8042', '434-23-9292', '723-99-9329',
'MacLeish', 'Cochran', '503 433-9493', '1722 SE Ogden Ct.', 'Portland',
'OR', 'USA', '97202')
go
insert store_employees values ('6380', '433-01-3922', '433-01-3922',
'Horgran', 'Eric', '206 323-4983', '18 Thud Dr. S.', 'Seattle',
'WA', 'USA', '98198')
go
insert store_employees values ('6380', '232-30-9999', '433-01-3922',
'Farnsdale', 'Finwick', '206 434-4949', '2 Bellevue Ave.', 'Seattle',
'WA', 'USA', '98122')
go
insert store_employees values ('6380', '333-90-3828', '433-01-3922',
'Wolfe', 'Wanda', '206 323-3333', '2 S. Boze St. #15', 'Seattle', 'WA',
'USA', '98118')
go
insert store_employees values ('6380', '322-09-2122', '433-01-3922',
'Begude', 'Nina', '206 333-9023', '1297 W. Cay Way', 'Seattle',
'WA', 'USA', '98108')
go
insert store_employees values ('6380', '342-78-2832', '433-01-3922',
'Howe', 'Saphron', '206 323-4933', '9827 Des Moines Dr.',
'Seattle', 'WA', 'USA', '98108')
go
insert store_employees values ('6380', '882-00-3234', '433-01-3922',
'Salidin', 'Uma', '206 390-8328', '13 Echo Lake Place', 'Seattle',
'WA', 'USA', '98126')
go
insert store_employees values ('6380', '321-89-8832', '433-01-3922',
'Marsicano', 'Evan', '206 322-9392', '7 Dancer Ave. SW', 'Seattle',
'WA', 'USA', '98126')
go
insert store_employees values ('6380', '762-32-5555', '433-01-3922',
'Boulignini', 'Gus', '206 323-9396', '308 S. Fidalgo St.', 'Seattle', 
'WA', 'USA', '98108')
go
insert store_employees values ('7896', '433-01-3921', '433-01-3921',
'Malraison', 'Marcel', '206 889-9983', '2298 Berry Dr.', 'Fremont', 
'CA', 'USA', '94555')
go
insert store_employees values ('7896', '322-32-8382', '433-01-3921',
'West', 'Diana', '206 898-3233', '20-B Knute St.', 'Fremont', 'CA',
'USA', '94536')
go
insert store_employees values ('7896', '328-74-8748', '433-01-3921',
'Cazalis', 'Mari', '206 326-6785', '18 May Dr. #7', 'Fremont',
'CA', 'USA', '94555')
go
insert store_employees values ('7896', '325-87-6766', '433-01-3921',
'Zorronius', 'Gaius', '206 363-8988', '1967 Claude Dr.', 'Fremont',
'CA', 'USA', '94555')
go
insert store_employees values ('7896', '323-67-5646', '433-01-3921',
'Podding', 'Marvin', '206 438-7858', '242 Ram Ct. #123', 'Fremont', 
'CA', 'USA', '94539')
go
insert store_employees values ('7896', '673-03-6728', '433-01-3921',
'Phelan', 'Micky', '206 323-7676', '1212 Spinn Ct.', 'Fremont', 'CA',
'USA', '94539')
go
insert store_employees values ('7896', '326-77-6482', '433-01-3921',
'Bokanowski', 'Peter', '206 432-4832', '13 Sparto Dr.', 'Fremont', 'CA',
'USA', '94539')
go
insert store_employees values ('7896', '653-48-2975', '433-01-3921',
'Poodals', 'F.W.', '206 387-6863', '739 Sendak Dr.', 'Fremont',
'CA', 'USA', '94538')
go
insert store_employees values ('7896', '320-37-4682', '433-01-3921',
'Scrubbs', 'Randy', '206 323-3874', '18 Washo Dr. #A', 'Fremont', 'CA',
'USA', '94539')
go
insert store_employees values ('7896', '323-67-4762', '433-01-3921',
'Mullins', 'M.', '206 382-7862', '1717 Zircon Ter.', 'Fremont', 'CA',
'USA', '94555')
go
insert store_employees values ('7896', '326-76-3863', '433-01-3921',
'Clarac', 'Sebastian', '206 387-6732', '5622 Zin St. #78', 'Fremont',
'CA', 'USA', '94539')
go
insert store_employees values ('5023', '534-92-2910', '534-92-2910',
'Armand', 'Mary', '510 323-5478', '1912 Badger Ln.', 'Concord', 'CA',
'USA', '94521')
go
insert store_employees values ('5023', '342-38-2782', '534-92-2910',
'Blanzat', 'Gomez', '510 382-3828', '4229 Tiffany Pl.', 'Concord', 'CA',
'USA', '94518')
go
insert store_employees values ('5023', '322-39-3222', '534-92-2910',
'Wingate', 'Patrick', '510 322-5873', '16 Mahoo Ln.', 'Concord', 'CA',
'USA', '94521')
go
insert store_employees values ('5023', '932-20-4389', '534-92-2910',
'Burke', 'Aldous', '510 433-4829', '12 Ponder Dr. #4', 'Concord', 'CA',
'USA', '94520')
go
insert store_employees values ('5023', '322-43-2828', '534-92-2910',
'Roughhead', 'Jonathan', '510 323-4782', '2 Athos Ct.', 'Concord', 
'CA', 'USA', '94521')
go
insert store_employees values ('5023', '832-32-3289', '534-92-2910',
'Johnson', 'Alexis', '510 323-3824', '927 Aramis Ct.', 'Concord', 
'CA', 'USA', '94520')
go
insert store_employees values ('5023', '432-32-4444', '534-92-2910',
'Blitzstein', 'Jack', '510 323-3874', '2 Porthos Ct.', 'Concord', 
'CA', 'USA', '94519')
go
insert store_employees values ('5023', '543-43-8438', '534-92-2910',
'Darby', 'Andy', '510 323-3874', '222 Juniper Ct.', 'Concord', 'CA',
'USA', '94519')
go
insert store_employees values ('5023', '423-42-9933', '534-92-2910',
'Askanzi', 'Robert', '510 422-3232', '222 Juniper Ct.', 'Concord',
'CA', 'USA', '94512')
go
insert store_employees values ('5023', '838-28-1982', '534-92-2910',
'Zavatta', 'Virginia', '510 423-4932', '629 Wind Way', 'Concord',
'CA', 'USA', '94521')
go
insert store_employees values ('5023', '433-43-3838', '534-92-2910',
'Fife', 'Ben', '510 322-8427', '782 Sapling Ct.', 'Concord', 'CA',
'USA', '94519')
go
insert salesdetail values ('7896', 100017, 'TC3218', 75, 40)
go
insert salesdetail values ('7896', 100017, 'TC7777', 75, 40)
go
insert salesdetail values ('7131', 100006, 'TC3218', 50, 40)
go
insert salesdetail values ('7131', 100006, 'TC7777', 80, 40)
go
insert salesdetail values ('5023', 100022, 'TC3218', 85, 40)
go
insert salesdetail values ('8042', 100016, 'PS3333', 90, 45)
go
insert salesdetail values ('8042', 100016, 'TC3218', 40, 45)
go
insert salesdetail values ('8042', 100016, 'PS2106', 30, 45)
go
insert salesdetail values ('8042', 100023, 'PS2106', 50, 45)
go
insert salesdetail values ('8042', 100015, 'PS2106', 31, 45)
go
insert salesdetail values ('8042', 100016, 'MC3021', 69, 45)
go
insert salesdetail values ('5023', 100010, 'PC1035', 1000, 46.7)
go
insert salesdetail values ('5023', 100009, 'BU2075', 500, 46.7)
go
insert salesdetail values ('5023', 100009, 'BU1032', 200, 46.7)
go
insert salesdetail values ('5023', 100009, 'BU7832', 150, 46.7)
go
insert salesdetail values ('5023', 100009, 'PS7777', 125, 46.7)
go
insert salesdetail values ('5023', 100020, 'TC7777', 1000, 46.7)
go
insert salesdetail values ('5023', 100020, 'BU1032', 1000, 46.7)
go
insert salesdetail values ('5023', 100020, 'PC1035', 750, 46.7)
go
insert salesdetail values ('7131', 100011, 'BU1032', 200, 46.7)
go
insert salesdetail values ('7066', 100001, 'BU7832', 100, 46.7)
go
insert salesdetail values ('7066', 100012, 'PS7777', 200, 46.7)
go
insert salesdetail values ('7066', 100012, 'PC1035', 300, 46.7)
go
insert salesdetail values ('7066', 100012, 'TC7777', 350, 46.7)
go
insert salesdetail values ('5023', 100025, 'PS2091', 1000, 46.7)
go
insert salesdetail values ('7067', 100008, 'PS2091', 200, 46.7)
go
insert salesdetail values ('7067', 100008, 'PS7777', 250, 46.7)
go
insert salesdetail values ('7067', 100008, 'PS3333', 345, 46.7)
go
insert salesdetail values ('7067', 100008, 'BU7832', 360, 46.7)
go
insert salesdetail values ('5023', 100022, 'PS2091', 845, 46.7)
go
insert salesdetail values ('5023', 100022, 'PS7777', 581, 46.7)
go
insert salesdetail values ('5023', 100027, 'PS1372', 375, 46.7)
go
insert salesdetail values ('7067', 100008, 'BU1111', 175, 46.7)
go
insert salesdetail values ('5023', 100022, 'BU7832', 885, 46.7)
go
insert salesdetail values ('5023', 100025, 'BU7832', 900, 46.7)
go
insert salesdetail values ('5023', 100009, 'TC4203', 550, 46.7)
go
insert salesdetail values ('7131', 100011, 'TC4203', 350, 46.7)
go
insert salesdetail values ('7896', 100017, 'TC4203', 275, 46.7)
go
insert salesdetail values ('7066', 100012, 'TC4203', 500, 46.7)
go
insert salesdetail values ('7067', 100008, 'TC4203', 512, 46.7)
go
insert salesdetail values ('7131', 100011, 'MC3021', 400, 46.7)
go
insert salesdetail values ('5023', 100009, 'PC8888', 105, 46.7)
go
insert salesdetail values ('5023', 100020, 'PC8888', 300, 46.7)
go
insert salesdetail values ('7066', 100012, 'PC8888', 350, 46.7)
go
insert salesdetail values ('7067', 100008, 'PC8888', 335, 46.7)
go
insert salesdetail values ('7131', 100006, 'BU1111', 500, 46.7)
go
insert salesdetail values ('7896', 100017, 'BU1111', 340, 46.7)
go
insert salesdetail values ('5023', 100009, 'BU1111', 370, 46.7)
go
insert salesdetail values ('5023', 100025, 'PS3333', 750, 46.7)
go
insert salesdetail values ('8042', 100014, 'BU7832', 300, 51.7)
go
insert salesdetail values ('8042', 100004, 'BU2075', 150, 51.7)
go
insert salesdetail values ('8042', 100004, 'BU1032', 300, 51.7)
go
insert salesdetail values ('8042', 100004, 'PC1035', 400, 51.7)
go
insert salesdetail values ('8042', 100016, 'PS7777', 180, 51.7)
go
insert salesdetail values ('8042', 100014, 'TC4203', 250, 51.7)
go
insert salesdetail values ('8042', 100004, 'TC4203', 226, 51.7)
go
insert salesdetail values ('8042', 100004, 'MC3021', 400, 51.7)
go
insert salesdetail values ('8042', 100023, 'BU1111', 390, 51.7)
go
insert salesdetail values ('5023', 100007, 'MC3021', 5000, 50)
go
insert salesdetail values ('5023', 100020, 'PC8888', 2000, 50)
go
insert salesdetail values ('5023', 100020, 'BU2075', 2000, 50)
go
insert salesdetail values ('5023', 100018, 'PC1035', 2000, 50)
go
insert salesdetail values ('5023', 100002, 'PC1035', 2000, 50)
go
insert salesdetail values ('5023', 100002, 'PS7777', 1500, 50)
go
insert salesdetail values ('5023', 100025, 'BU2075', 3000, 50)
go
insert salesdetail values ('5023', 100025, 'TC7777', 1500, 50)
go
insert salesdetail values ('5023', 100026, 'BU2075', 3000, 50)
go
insert salesdetail values ('5023', 100026, 'BU2075', 3000, 50)
go
insert salesdetail values ('5023', 100022, 'PS3333', 2687, 50)
go
insert salesdetail values ('5023', 100022, 'TC7777', 1090, 50)
go
insert salesdetail values ('5023', 100022, 'PC1035', 2138, 50)
go
insert salesdetail values ('5023', 100027, 'MC2222', 2032, 50)
go
insert salesdetail values ('5023', 100027, 'BU1111', 1001, 50)
go
insert salesdetail values ('5023', 100002, 'BU1111', 1100, 50)
go
insert salesdetail values ('5023', 100020, 'BU7832', 1400, 50)
go
insert salesdetail values ('5023', 100010, 'TC4203', 2700, 50)
go
insert salesdetail values ('5023', 100018, 'TC4203', 2500, 50)
go
insert salesdetail values ('5023', 100020, 'TC4203', 3500, 50)
go
insert salesdetail values ('5023', 100010, 'MC3021', 4500, 50)
go
insert salesdetail values ('5023', 100009, 'MC3021', 1600, 50)
go
insert salesdetail values ('5023', 100020, 'MC3021', 2550, 50)
go
insert salesdetail values ('5023', 100002, 'MC3021', 3000, 50)
go
insert salesdetail values ('5023', 100026, 'MC3021', 3200, 50)
go
insert salesdetail values ('5023', 100010, 'BU2075', 2200, 50)
go
insert salesdetail values ('5023', 100018, 'BU1032', 1500, 50)
go
insert salesdetail values ('5023', 100027, 'PC8888', 1005, 50)
go
insert salesdetail values ('7896', 100005, 'BU2075', 42, 50.5)
go
insert salesdetail values ('7896', 100005, 'PC1035', 25, 50.5)
go
insert salesdetail values ('7131', 100019, 'BU2075', 35, 50.5)
go
insert salesdetail values ('7067', 100024, 'PC1035', 34, 50.5)
go
insert salesdetail values ('7067', 100024, 'TC4203', 53, 50.5)
go
insert salesdetail values ('8042', 100013, 'BU2075', 30, 55.5)
go
insert salesdetail values ('8042', 100013, 'BU1032', 94, 55.5)
go
insert salesdetail values ('7066', 100021, 'BU2075', 200, 57.2)
go
insert salesdetail values ('7896', 100005, 'TC4203', 350, 57.2)
go
insert salesdetail values ('7066', 100021, 'TC4203', 230, 57.2)
go
insert salesdetail values ('7066', 100021, 'MC3021', 200, 57.2)
go
insert salesdetail values ('7131', 100019, 'MC3021', 137, 57.2)
go
insert salesdetail values ('7067', 100024, 'MC3021', 270, 57.2)
go
insert salesdetail values ('7067', 100024, 'BU2075', 230, 57.2)
go
insert salesdetail values ('7131', 100019, 'BU1032', 345, 57.2)
go
insert salesdetail values ('7067', 100024, 'BU1032', 136, 57.2)
go
insert salesdetail values ('8042', 100013, 'TC4203', 300, 62.2)
go
insert salesdetail values ('8042', 100013, 'MC3021', 270, 62.2)
go
insert salesdetail values ('8042', 100013, 'PC1035', 133, 62.2)
go
insert salesdetail values ('5023', 100003, 'TC4203', 2500, 60.5)
go
insert salesdetail values ('5023', 100003, 'BU2075', 4000, 60.5)
go
insert salesdetail values ('6380', 100028, 'BU2075', 200, 57.2)
go
insert salesdetail values ('6380', 100028, 'MC3021', 250, 57.2)
go
insert salesdetail values ('6380', 100029, 'PS3333', 200, 46.7)
go
insert salesdetail values ('6380', 100029, 'PS7777', 500, 46.7)
go
insert salesdetail values ('6380', 100029, 'TC3218', 125, 46.7)
go
insert salesdetail values ('6380', 100017, 'BU2075', 135, 46.7)
go
insert salesdetail values ('6380', 100017, 'BU1032', 320, 46.7)
go
insert salesdetail values ('6380', 100017, 'TC4203', 300, 46.7)
go
insert salesdetail values ('6380', 100017, 'MC3021', 400, 46.7)
go
insert titleauthor
values ('409-56-7008', 'BU1032', 1, 60)
go
insert titleauthor
values ('486-29-1786', 'PS7777', 1, 100)
go

insert titleauthor
values ('712-45-1867', 'MC2222', 1, 100)
go
insert titleauthor
values ('172-32-1176', 'PS3333', 1, 100)
go
insert titleauthor
values ('213-46-8915', 'BU1032', 2, 40)
go
insert titleauthor
values ('238-95-7766', 'PC1035', 1, 100)
go
insert titleauthor
values ('213-46-8915', 'BU2075', 1, 100)
go
insert titleauthor
values ('998-72-3567', 'PS2091', 1, 50)
go
insert titleauthor
values ('899-46-2035', 'PS2091', 2, 50)
go
insert titleauthor
values ('998-72-3567', 'PS2106', 1, 100)
go
insert titleauthor
values ('722-51-5454', 'MC3021', 1, 75)
go
insert titleauthor
values ('899-46-2035', 'MC3021', 2, 25)
go
insert titleauthor
values ('807-91-6654', 'TC3218', 1, 100)
go
insert titleauthor
values ('274-80-9391', 'BU7832', 1, 100)
go
insert titleauthor
values ('427-17-2319', 'PC8888', 1, 50)
go
insert titleauthor
values ('846-92-7186', 'PC8888', 2, 50)
go
insert titleauthor
values ('756-30-7391', 'PS1372', 1, 75)
go
insert titleauthor
values ('724-80-9391', 'PS1372', 2, 25)
go
insert titleauthor
values ('724-80-9391', 'BU1111', 1, 60)
go
insert titleauthor
values ('267-41-2394', 'BU1111', 2, 40)
go
insert titleauthor
values ('672-71-3249', 'TC7777', 1, 40)
go
insert titleauthor
values ('267-41-2394', 'TC7777', 2, 30)
go
insert titleauthor
values ('472-27-2349', 'TC7777', 3, 30)
go
insert titleauthor
values ('648-92-1872', 'TC4203', 1, 100)
go
insert discounts
values ('Initial Customer', NULL, NULL, NULL, 10.5)
go
insert discounts 
values ('Volume Discount', NULL, 100, 1000, 6.7)
go
insert discounts
values ('Huge Volume Discount', NULL, 1001, NULL, 10)
go
insert discounts 
values ('Customer Discount', '8042', NULL, NULL, 5.0)
go
insert blurbs values ('486-29-1786', 'If Chastity Locksley didn''t
exist, this troubled world would have created her!  Not only did she
master the mystic secrets of inner strength to conquer adversity when
she encountered it in life, but, after "reinventing herself", as she
says, by writing "Emotional Security: A New Algorithm" following the
devastating loss of her cat Old Algorithm, she also founded Publish or
Perish, the page-by-page, day-by-day, write-yourself-to-wellness
encounter workshops franchise empire, the better to share her inspiring
discoveries with us all.  Her "Net Etiquette," a brilliant social
treatise in its own right and a fabulous pun, is the only civilized
alternative to the gross etiquette often practiced on the public
networks.')
insert blurbs values ('648-92-1872', 'A chef''s chef and a raconteur''s
raconteur, Reginald Blotchet-Halls calls London his second home. "Th''
palace kitchen''s me first ''ome, act''lly!" Blotchet-Halls'' astounding
ability to delight our palates with palace delights is matched only by
his equal skill in satisfying our perpetual hunger for delicious
back-stairs gossip by serving up tidbits and entrees literally fit for
a king!') insert blurbs values ('998-72-3567', 'Albert Ringer was born
in a trunk to circus parents, but another kind of circus trunk played a
more important role in his life years later.  He grew up as an
itinerant wrestler and roustabout in the reknowned Ringer Brothers and
Betty and Bernie''s Circus.  Once known in the literary world only as
Anne Ringer''s wrestling brother, he became a writer while recuperating
from a near-fatal injury received during a charity benefit bout with a
gorilla.  "Slingshotting" himself from the ring ropes, Albert flew
over the gorilla''s head and would have landed head first on the
concrete.  He was saved from certain death by Nana, an elephant he
befriended as a child, who caught him in her trunk.  Nana held him so
tightly that three ribs cracked and he turned blue from lack of
oxygen.  "I was delirious.  I had an out-of-body experience!  My whole
life passed before me.  I promised myself "If I get through this, I''ll
use my remaining time to share what I learned out there."  I owe it all
to Nana!"')
insert blurbs values ('899-46-2035', 'Anne Ringer ran away from the
circus as a child.  A university creative writing professor and her
family took Anne in and raised her as one of their own.  In this warm
and television-less setting she learned to appreciate the great
classics of literature.  The stream of aspiring and accomplished
writers that flowed constantly through the house confirmed her
repudiation of the circus family she''d been born into: "Barbarians!"
The steadily growing recognition of her literary work was, to her,
vindication.  When her brother''s brush with death brought them together
after many years, she took advantage of life''s crazy chance thing and
broke the wall of anger that she had constructed to separate them.
Together they wrote, "Is Anger the Enemy?" an even greater
blockbuster than her other collaborative work, with Michel DeFrance,
"The Gourmet Microwave."')
insert blurbs values ('672-71-3249', 'They asked me to write about
myself and my book, so here goes:  I started a restaurant called "de
Gustibus" with two of my friends.  We named it that because you really
can''t discuss taste.  We''re very popular with young business types
because we''re young business types ourselves.  Whenever we tried to go
out to eat in a group we always got into these long tiresome
negotiations: "I just ate Italian," or "I ate Greek yesterday," or
I NEVER eat anything that''s not organic!"  Inefficient.  Not what
business needs today.  So, it came to us that we needed a restaurant we
could all go to every day and not eat the same thing twice in a row
maybe for a year!  We thought, "Hey, why make people choose one kind
of restaurant over another, when what they really want is a different
kind of food?"  At de Gustibus you can eat Italian, Chinese, Japanese,
Greek, Russian, Tasmanian, Iranian, and on and on all at the same
time.  You never have to choose.  You can even mix and match!  We just
pooled our recipes, opened the doors, and never looked back.  We''re a
big hit, what can I say?  My recipes in "Sushi, Anyone?" are used at
de Gustibus.  They satisfy crowds for us every day.  They will work for
you, too.  Period!')
insert blurbs values ('409-56-7008', 'Bennet was the classic too-busy
executive.  After discovering computer databases he now has the time to
run several successful businesses and sit on three major corporate
boards.  Bennet also donates time to community service organizations.
Miraculously, he also finds time to write and market executive-oriented
in-depth computer hardware and software reviews.  "I''m hyperkinetic,
so being dynamic and fast-moving is a piece of cake.  But being
organized isn''t easy for me or for anyone I know.  There''s just one
word for that: ''databases!'' Databases can cure you or kill you.  If you
get the right one, you can be like me.  If you get the wrong one, watch
out.  Read my book!"')
go


