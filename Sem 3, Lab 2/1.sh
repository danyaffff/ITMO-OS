ps x -o pid,cmd | awk  '{ print $1 ":" $2 }' | wc -l > out.txt

ps x -o pid,cmd | awk  '{ print $1 ":" $2 }' | sed 1d >> out.txt
