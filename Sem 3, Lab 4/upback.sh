last_backup_date=$(
    ls ~ |
    grep -e "^Backup-" |
    sort -n -r |
    head -1 |
    sed "s/^Backup-//"
)
last_backup=~/Backup-$last_backup_date
restore=~/restore

if [ ! -z $last_backup_date ]; then
    if [ ! -d $restore ]; then
        mkdir $restore
    fi

    for file in $(ls $last_backup | grep -E -v "[0-9]{4}-[0-9]{2}-[0-9]{2}"); do
        cp $last_backup/$file $restore/$file
    done
fi
