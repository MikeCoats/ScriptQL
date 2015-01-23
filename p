alias s="sqlite3 -list d"
s "SELECT t FROM p WHERE p = $1;"
s "SELECT d FROM d WHERE p = $1 ORDER BY i ASC;"
echo
s "SELECT m FROM m WHERE i = 1 AND NOT EXISTS (SELECT * FROM t WHERE p = $1);"
s "SELECT m FROM m WHERE i = 2 AND EXISTS (SELECT * FROM t WHERE p = $1);"
s -separator "  " "SELECT t, d FROM t WHERE p = $1;"

