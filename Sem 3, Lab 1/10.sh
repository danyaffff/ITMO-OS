man bash |
sed -r 's/[[:space:]]+/\n/g' |
sort |
uniq -c |
sort -n -r |
awk -F ' ' '{
    if (length($2) >= 4) {
        print $2;
    }
}' |
sed -n 1,3p
