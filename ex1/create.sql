create table Country(
    countrycode varchar(3) primary key,
    country varchar NOT NULL,
    region varchar NOT NULL,
    incomegroup varchar NOT NULL check(incomegroup IN ('High income', 'Low income', 'Lower middle income', 'Upper middle income'))
);

create table Universities(
    iau_id1 varchar primary key,
    eng_name varchar NOT NULL,
    orig_name varchar NOT NULL,
    foundedyr integer NOT NULL,
    yrclosed integer,
    check(NULL OR foundedyr <= yrclosed),
    private01 integer check(private01 = 0 OR private01 = 1),
    phd_granting integer NOT NULL check(phd_granting = 0 OR phd_granting = 1),
    divisions integer,
    specialized integer NOT NULL check(specialized = 0 OR specialized = 1),
    countrycode varchar(3) NOT NULL
    references Country(countrycode),
    latitude float,
    longitude float
);

create table enrollment_stats(
    iau_id1 varchar,
    year integer,
    students5_estimated integer,
    primary key(iau_id1, year),
    foreign key(iau_id1)
    references Universities(iau_id1)
);