## About this Repo

This is a set of php command line scripts that accepts a csv file and uploads its information to a mysql database. It accepts as an argument the csv file location.


## How to Run

- Open **config.php** file and add information required for your connection to your own Mysql Database.

- Run the **script.sql** file for creating database and tables.


### Uploading the information to your database

- On the console run **php upload.php [filename]** to upload the records to database.

### Getting a list of flyers from a CategoryID

- On the console run **php flyers.php [category_id]** to upload the records to database.
  - *Category_id param must be a number.*

### Getting a list of pages from a FlyerID

- On the console run **php pages.php [flyer_id]** to upload the records to database.
  - *Flyer_id param must be a number.*


