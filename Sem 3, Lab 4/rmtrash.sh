trash=~/.trash
trashlog=~/.trash.log
filename=$1
version=0

if [ ! -d $trash ]; then
    mkdir $trash
fi

if [ ! -f $trashlog ]; then
    touch $trashlog
fi

trashname=$filename-$version
while [ -f $trash/$trashname ]; do
    (( version++ ))
    trashname=$filename-$version
done

ln $filename $trash/$trashname
rm $filename && echo $(realpath $filename) $trashname >> $trashlog
