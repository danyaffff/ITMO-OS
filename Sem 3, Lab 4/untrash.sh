trash=~/.trash
trashlog=~/.trash.log
filename=$1

restore() {
    path=$1
    file=$2
    ln $trash/$file $path
}

if [ $# != 1 ]; then
    exit 1
fi

if [ ! -d $trash ]; then
    exit 1
fi

if [ ! -f $trashlog ]; then
    exit 1
fi

if [ -z $(grep $1 $trash) ]; then
    exit 1
fi

grep $filename $trashlog |
while read filepath; do
    file=$(echo $filepath | cut -d " " -f 1)
    trashed=$(echo $filepath | cut -d " " -f 2)

    echo "Restore $trashed ? (y/n)"

    read answer < /dev/tty
    if [ $answer == "y" ]; then
        dir=$(dirname $file) &&
        if [ -d $dir ]; then
            $(restore $file $trashed)
        else
            $(restore $HOME/$filename $trashed) &&
            echo "Restored in $HOME"
        fi &&
        rm $trash/$trashed && {
            sed -i "#$filepath#d" $trashlog
            echo "Restored $file"
        }
    fi
done
