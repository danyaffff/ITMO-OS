ps x -o pid,cmd | awk  '{ print $1 ":" $2 }' | head -n -2 | wc -l > out.txt
ps x -o pid,cmd | awk  '{ print $1 ":" $2 }' | head -n -2 >> out.txt
