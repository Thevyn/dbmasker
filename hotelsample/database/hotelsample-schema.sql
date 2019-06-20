-- Generated with g9.
--
-- Run this schema script against Derby as follows:
-- java org.apache.derby.tools.ij hotelsample-schema.sql


-- CREATE TABLE statements including basic column definitions

CREATE TABLE Booking (
  fromDate date,
  toDate date,
  id integer generated by default as identity NOT NULL,
  customer_customerNo integer NOT NULL,
  hotel_id integer NOT NULL,
  roomCategory_id integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE Customer (
  creditCard varchar(16),
  customerNo integer NOT NULL,
  email varchar(40),
  name varchar(40),
  password varchar(40),
  phone varchar(20),
  LOCK_FLAG integer,
  PRIMARY KEY (customerNo)
);

CREATE TABLE Hotel (
  id integer NOT NULL,
  location varchar(30),
  logo varchar(40),
  name varchar(40),
  chain_id integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE HotelChain (
  name varchar(40) NOT NULL,
  id integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE HotelRoomCategory (
  actualPrice integer,
  fromDate date NOT NULL,
  toDate date,
  hotel_id integer NOT NULL,
  roomCategory_id integer NOT NULL,
  LOCK_FLAG integer,
  CONSTRAINT HotelRoomCategory_PK PRIMARY KEY (hotel_id,roomCategory_id,fromDate)
);

CREATE TABLE Address (
  homeAddress varchar(40),
  postalCode integer,
  id integer NOT NULL,
  customer_customerNo integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE Room (
  roomNo integer,
  floor integer,
  balcony smallint,
  heading integer CHECK (heading IN (1,2,3,4)),
  id integer NOT NULL,
  category_id integer NOT NULL,
  hotel_id integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE RoomCategory (
  bedType integer CHECK (bedType IN (1,2,3,4,5)),
  guests integer,
  id integer NOT NULL,
  initialPrice integer,
  maxDiscount integer,
  roomQuality integer CHECK (roomQuality IN (1,2,3)),
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);

CREATE TABLE TemplateBooking (
  id integer NOT NULL,
  customer_customerNo integer NOT NULL,
  hotel_id integer NOT NULL,
  roomCategory_id integer NOT NULL,
  LOCK_FLAG integer,
  PRIMARY KEY (id)
);
