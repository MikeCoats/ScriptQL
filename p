#!/bin/sh

# Print the title of the selected page.
sqlite3 -list d "SELECT t FROM p WHERE p = $1;"

# Print all the lines of the description of the selected page.
sqlite3 -list d "SELECT d FROM d WHERE p = $1 ORDER BY i ASC;"

# Add a space to make it readable.
echo

# Add a game over message if there are no pages to turn to from here.
sqlite3 -list d "SELECT m FROM m WHERE i = 1 AND NOT EXISTS (SELECT * FROM t WHERE p = $1);"

# Add a prompt if there are pages to turn to.
sqlite3 -list d "SELECT m FROM m WHERE i = 2 AND EXISTS (SELECT * FROM t WHERE p = $1);"

# Print all of the pages that can be turned to from the selected page.
sqlite3 -list d -separator "  " "SELECT t, d FROM t WHERE p = $1;"

