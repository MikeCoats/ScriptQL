alias q="sqlite3 -list d"
s=SELECT;f=FROM;w="WHERE p=$1"
m="$s m $f m WHERE i";e="EXISTS ($s*$f t $w);"
q "$s t $f p $w;"
q "$s d $f d $w ORDER BY i ASC;"
echo
q "$m=1 AND NOT $e"
q "$m=2 AND $e"
q -separator "  " "$s t,d $f t $w;"
