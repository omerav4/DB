import csv
from io import TextIOWrapper
from zipfile import ZipFile

all_tables = ["enrollment", "Country", "University", "Enrollment_stats", "Located_at"]
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
created_tables = {"Country": ["countrycode", "country", "region", "incomegroup"],
                         "University": ["iau_id1", "eng_name", "orig_name", "foundedyr", "yrclosed", "private01",
                                        "divisions", "phd_granting", "specialized"],
                         "Enrollment_stats": ["iau_id1", "year", "students5_estimated"],
                         "Located_at": ["iau_id1", "countrycode", "latitude", "longitude"]}

# opens files.
enrollment_outfile, enrollment_outwriter = {}, {}
for table in all_tables:
    enrollment_outfile[table] = open(f"{table}.csv", 'w', encoding='UTF8')
    enrollment_outwriter[table] = csv.writer(enrollment_outfile, delimiter=",", quoting=csv.QUOTE_MINIMAL)


# splits row into the different csv table files
def process_row(row):
    is_last_row_of_university = True if row[13] != '' else False
    for table in created_tables:
        if table != "Enrollment_stats" and not is_last_row_of_university:
            continue
        current_row = [row[col] for col in columns_in_enrollment_table
                       if columns_in_enrollment_table[col] in columns_in_enrollment_table[table]]
        enrollment_outwriter[table].writerow(current_row)


# process_file goes over all rows in original csv file, and sends each row to process_row()
def process_file():
    with ZipFile('enrollment.zip') as zf:
        with zf.open(f'enrollment.csv', 'r') as infile:
            reader = csv.reader(TextIOWrapper(infile, 'utf-8'))
            for row in reader:
                process_row(row)    # each row is a list of string
                enrollment_outwriter.writerow(row)


# return the list of all tables
def get_names():
    return all_tables


if __name__ == "__main__":
    process_file()
