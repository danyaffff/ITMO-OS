awk -F ':' '{ print $1 " " $3 }' /etc/passwd |
sort -n -t ' ' -k 2 |
column -t
