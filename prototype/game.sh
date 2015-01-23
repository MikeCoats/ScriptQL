#!/bin/sh

# Print the title of the selected page.
sqlite3 -list game.db "SELECT title FROM pages WHERE page = $1;"

# Print all the lines of the description of the selected page.
sqlite3 -list game.db "SELECT part_of_description FROM descriptions WHERE page = $1 ORDER BY id ASC;"

# Add a space to make it readable.
echo

# Add a game over message if there are no pages to turn to from here.
sqlite3 -list game.db "SELECT message FROM messages WHERE id = 1 AND NOT EXISTS (SELECT * FROM turns WHERE page = $1);"

# Add a prompt if there are pages to turn to.
sqlite3 -list game.db "SELECT message FROM messages WHERE id = 2 AND EXISTS (SELECT * FROM turns WHERE page = $1);"

# Print all of the pages that can be turned to from the selected page.
sqlite3 -list game.db -separator "  " "SELECT page_to, description FROM turns WHERE page = $1;"

