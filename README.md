## Home task. Final project for the course "relational databases"

#### Task Instructions

1. Input the data:

- Establish a `pandemic` schema in the database by utilizing an additional SQL command.
- Formalize it as a schema using an additional SQL command.
- Import the [data](https://drive.google.com/file/d/1lHEXJvu2omYRgvSek6mHq-iQ3RmGAQ7e/view) using the Import wizard, as previously demonstrated in topic 3.
  [infectious_cases.csv](https://prod-files-secure.s3.us-west-2.amazonaws.com/89fec302-e51c-45d8-a968-db8bdab456d2/74d1694c-7c06-403a-b8fa-301608033701/infectious_cases.csv)
- Please review the data to maintain context.

> [!TIP] As evident, the Entity and Code attributes are consistently duplicated. Please consider further normalization of this data.

2. Normalize the 'infectious_cases' table. Save two tables containing normalized data within the same schema.

3. Analyze the data:

- For every unique combination of `Entity` and `Code` or its `id`, calculate the average, minimum, maximum, and total count for the `Number_rabies` attribute.

> [!TIP] Please be aware that the `Number_rabies` attribute may contain empty values `` - it's necessary to filter them out initially.

- Sort the results by the average value in descending order.
- Limit the display to only 10 rows.

4. Create a column representing the difference in years.

For the original or normalized table, for the `Year` column, construct using built-in SQL functions:

- An attribute that generates the date of January 1 of the corresponding year.

> [!TIP] 💡 For instance, if an attribute contains the value `1996`, then the value of the new attribute should be `1996-01-01`.

- An attribute equal to the current date.
- An attribute equal to the difference in years between the two columns mentioned above.

> [!TIP] 💡 No enumeration is required for other attributes, such as `Number_malaria`.

5. Develop a custom function.

- Design and utilize a function that constructs the same attribute as in the previous task: the function should accept a year value as input and return the difference in years between the current date and the date created from the year attribute (e.g., year 1996 → `1996-01-01`).

> [!TIP] If you haven't completed the previous task, you can create another function - one that calculates the number of diseases for a specific period. To accomplish this, you'll divide the number of diseases per year by a given number: 12 to obtain the average number of diseases per month, 4 per quarter, or 2 per half-year. Therefore, the function will take two parameters: the number of diseases per year and a divisor of your choice. You should also apply this function by running it on the data. Since not all rows contain a number of diseases, you'll need to filter out those that don't have a numerical value (not equal to '').
