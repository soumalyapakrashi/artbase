/* Create the 'artbase' database */
CREATE DATABASE artbase;

/* Select the 'artbase' database for further operations */
USE artbase;

/* Setup the ARTIST table */
CREATE TABLE ARTIST (
	aid INT PRIMARY,
    name VARCHAR(100) NOT NULL,
    birth_place VARCHAR(100) NOT NULL,
    age INT CHECK (age > 0 AND age < 130),
    statement VARCHAR(1000) NOT NULL,
    picture VARCHAR(200),
    INDEX (name)
);

/* Setup the ARTIST_STYLE table */
CREATE TABLE ARTIST_STYLE (
	aid INT NOT NULL REFERENCES ARTIST(aid),
    style VARCHAR(50) NOT NULL,
    INDEX (aid)
);

/* Setup ARTIST_SOCIAL table */
CREATE TABLE ARTIST_SOCIAL (
	aid INT NOT NULL REFERENCES ARTIST(aid),
    social_link VARCHAR(255) NOT NULL,
    INDEX (aid)
);

/* Setup ARTWORK table */
CREATE TABLE ARTWORK (
	title VARCHAR(255) PRIMARY,
    type VARCHAR(100) NOT NULL,
    aid INT NOT NULL REFERENCES ARTIST(aid),
    year DECIMAL(4),
    size VARCHAR(50) NOT NULL,
    price INT CHECK (price > 0),
    status CHAR(4) CHECK (status = 'Sale' OR status = 'View' OR status = 'Sold')
);

/* Setup ARTWORK_KIND table */
CREATE TABLE ARTWORK_KIND (
	title VARCHAR(255) NOT NULL REFERENCES ARTWORK(title),
    kind VARCHAR(100) NOT NULL,
    INDEX (title)
);

/* Setup CUSTOMER table */
CREATE TABLE CUSTOMER (
	cid INT PRIMARY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);

/* Setup CUSTOMER_ARTIST table */
CREATE TABLE CUSTOMER_ARTIST (
	cid INT NOT NULL REFERENCES CUSTOMER(cid),
    aid INT NOT NULL REFERENCES ARTIST(aid)
);

/* Setup CUSTOMER_KIND table */
CREATE TABLE CUSTOMER_KIND (
	cid INT NOT NULL REFERENCES CUSTOMER(cid),
    kind VARCHAR(100) NOT NULL
);

/* Setup CUSTOMER_TRANSACTION table */
CREATE TABLE CUSTOMER_TRANSACTION (
	tid INT PRIMARY,
    cid INT NOT NULL REFERENCES CUSTOMER(cid),
    title VARCHAR(255) NOT NULL UNIQUE REFERENCES ARTWORK(title),
    purchase_price INT NOT NULL
);

/* Setup ARTIST_TRANSACTION table */
CREATE TABLE ARTIST_TRANSACTION (
	tid INT PRIMARY,
    aid INT NOT NULL REFERENCES ARTIST(aid),
    title VARCHAR(255) NOT NULL UNIQUE REFERENCES ARTWORK(title),
    INDEX (title)
);

/* Setup ACCOUNT table */
CREATE TABLE ACCOUNT (
	id INT NOT NULL UNIQUE,
    email VARCHAR(255) PRIMARY,
    password VARCHAR(255) NOT NULL
);