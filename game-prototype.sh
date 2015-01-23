#!/bin/sh

# Print the title of the selected page.
sqlite3 -list game.db "SELECT title FROM pages WHERE page = $1;"

# Print all the lines of the description of the selected page.
sqlite3 -list game.db "SELECT part_of_description FROM descriptions WHERE page = $1 ORDER BY id ASC;"

# Add a space to make it readable.
echo

# Print all of the pages that can be turned to from the selected page.
sqlite3 -list game.db -separator "  " "SELECT page_to, description FROM turns WHERE page = $1;"

