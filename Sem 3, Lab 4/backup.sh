last_backup_date=$(
    ls ~ |
    grep -E "^Backup-" |
    sort -n -r |
    head -1 |
    sed "s/Backup-//")
last_backup=~/Backup-$last_backup_date

current_date=$(date +"%F")
current_date_from_1970=$(date -d "$current_date" +"%s")
last_backup_date_from_1970=$(date -d $last_backup_date +"%s")
time_difference=$(echo "($current_date_from_1970 - $last_backup_date_from_1970) / (60 * 60 * 24)" | bc)
report=~/.backup-report

if [[ $time_difference < 7 ]] && [ ! -z $last_backup_date ]; then
    changes=""
    for file in $(ls ~/source); do
        if [ -f $last_backup/$file ]; then
            size_in_source=$(wc -c ~/source/$file | awk '{print $1}')
            size_in_backup=$(wc -c $last_backup/$file | awk '{print $1}')
            size_difference=$(echo "$size_in_source - $size_in_backup" | bc)

            if [ $size_difference != 0 ]; then
                mv $last_backup/$file $last_backup/$file.$current_date
                cp ~/source/$file $last_backup
                changes="$changes$file $file.$current_date"
            fi
        else
            cp ~/source/$file $last_backup
            changes="$changes\nFile $file copied."
        fi
    done
    changes=$(echo $changes | sed "s/^\n//")
    if [ ! -z $changes ]; then
        echo -e "Backup-$last_backup_date updated:\n$changes" >> $report
    fi
else
    mkdir ~/Backup-$current_date
    for file in $(ls ~/source); do
        cp ~/source/$file ~/Backup-$current_date
    done
    files=$(ls ~/source)
    echo -e "Backup-$current_date was created:\n$files" >> $report
fi
