The following use case might be a real-life example from one of our customers, please deliver your best possible solution. Please go through the described scenario and write 2 scripts, one in Windows Batch and one in Unix BASH implementing a fix to the issue below. For the development of the scripts you have 24h and are allowed to use Google and any other material as long as the work submitted was written by you.

Use Case: 

-    A database upgrade requires the execution of numbered scripts stored in a folder. E.g. 045.createtable.sql

-    There may be holes in the numbering and there isn't always a . after the number.

-    The database upgrade works by looking up the current version in the database. It then compares this number to the scripts.

-    If the version number from the db matches the highest number from the script then nothing is executed.

-    If the number from the db is lower than the highest number from the scripts, then all scripts that contain a higher number than the db will be executed against the database.

-    In addition the database version table is updated after the install with the latest number.

How would you implement this in order to create an automated solution to the above requirements
