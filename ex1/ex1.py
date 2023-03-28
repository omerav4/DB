import csv
from io import TextIOWrapper
from zipfile import ZipFile

all_tables = ["Country", "University", "Enrollment_stats", "enrollment"]
columns_in_enrollment_table = {
    0: "country",
    1: "countrycode",
    2: "region",
    3: "incomegroup",
    4: "iau_id1",
    5: "eng_name",
    6: "orig_name",
    7: "foundedyr",
    8: "yrclosed",
    9: "private01",
    10: "latitude",
    11: "longitude",
    12: "phd_granting",
    13: "divisions",
    14: "specialized",
    15: "year",
    16: "students5_estimated"
}

country_columns = ["countrycode", "country", "region", "incomegroup"]
university_columns = ["iau_id1", "eng_name", "orig_name", "foundedyr", "yrclosed", "private01", "divisions",
                      "phd_granting", "specialized", "countrycode", "latitude", "longitude"]
enrollment_stats_columns = ["iau_id1", "year", "students5_estimated"]

# opens files.
outfiles, outwriters, sets_of_tables = {}, {}, {}
for table in all_tables:
    outfiles[table] = open(f"{table}.csv", 'w', encoding='UTF8')
    outwriters[table] = csv.writer(outfiles[table], delimiter=",", quoting=csv.QUOTE_MINIMAL)

country_table, university_table, enrollment_stats_table = {}, {}, {}


def convert_list_to_dict(row_list):
    row_dict = {}
    for column in columns_in_enrollment_table:
        row_dict[columns_in_enrollment_table[column]] = row_list[column]
    return row_dict


# splits row into the different csv table files
def process_row(row):
    row = convert_list_to_dict(row) # each row is a list of string
    country_table[row['countrycode']] = [row[column] for column in country_columns]
    university_table[row['iau_id1']] = [row[column] for column in university_columns]
    enrollment_stats_table[(row['iau_id1'], row['year'])] = [row[column] for column in enrollment_stats_columns]


# process_file goes over all rows in original csv file, and sends each row to process_row()
def process_file():
    with ZipFile('enrollment.zip') as zf:
        with zf.open(f'enrollment.csv', 'r') as infile:
            reader = csv.reader(TextIOWrapper(infile, 'utf-8'))
            for row in reader:
                process_row(row)
                outwriters['enrollment'].writerow(row)

    for row in country_table:
        outwriters['Country'].writerow(country_table[row])
    for row in university_table:
        outwriters['University'].writerow(university_table[row])
    for row in enrollment_stats_table:
        outwriters['Enrollment_stats'].writerow(enrollment_stats_table[row])

    for table in outwriters:
        outfiles[table].close()


# return the list of all tables
def get_names():
    return all_tables


if __name__ == "__main__":
    process_file()
