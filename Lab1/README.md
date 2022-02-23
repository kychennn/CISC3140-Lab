# CISC 3140 MW2 – Spring 2022
# Lab 1 Parsing Structured Data

## Objective:
This task as described focuses on the use of multi-paradigmatic programming languages to design a system that handles a basic end-to-end data analysis workflow.

## Requirements:
The report should show aggregate values that are computed from the CSV file provided. Specifically, write to file (separate files, unless you can figure out how to output to a single file). The following requirements.

o Across all cars, compute the total for each row and add as a new column. The output should show (ranking, car_id, year, car make, car model). Present the list in descending order using the total column and add a new ranking column
	-- script.awk
	-- total.out
	-- ranking.out



o For each Car Make grouping, list the top 3 cars (ranking, car_id, year, car make, car model, total score)

## Downloading data
Add this REPO as a submodule to your git repository and set the folder name as data_lab1.

## Generating a report
Prepare an AWK script that reads input from the CSV file, parses and extracts required fields, and outputs formatted text as described under requirements.

## Create a build script
Running the command make lab1 from the root can ensure that data is up to date and run the AWK processing.
A Makefile, where from the root of your project repository I can run make lab1.
```bash
make lab1
```

## File management
Prepare your project repository for sharing with another developer.

