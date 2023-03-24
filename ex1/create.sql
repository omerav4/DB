create table enrollment(
	country varchar, 
	countrycode varchar, 
	region varchar, 
	incomegroup varchar, 
	iau_id1 varchar, 
	eng_name varchar, 
	orig_name varchar, 
	foundedyr varchar, 
	yrclosed varchar, 
	private01 varchar, 
	latitude varchar, 
	longitude varchar, 
	phd_granting varchar, 
	divisions varchar, 
	specialized varchar, 
	year varchar, 
	students5_estimated varchar
);

create table Country(
    countrycode varchar primary key,
    country varchar,
    region varchar,
    incomegroup varchar
);

create table University(
    iau_id1 varchar primary key,
	eng_name varchar,
	orig_name varchar,
	foundedyr varchar,
	yrclosed varchar,
	private01 varchar
);

create table Enrollment_stats(
    year varchar primary key,
	students5_estimated varchar,
    phd_granting varchar,
	divisions varchar,
	specialized varchar
);

create table Located_at(
    iau_id1 varchar primary key,
	country_code varchar,
    latitude varchar,
	longitude varchar
);

create table University_annual_stats(
    iau_id1 varchar primary key,
	year varchar,
	primary key (iau_id1, year)
);

