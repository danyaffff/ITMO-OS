search() {
    find /proc -maxdepth 2 -name "io" -type f -exec grep -H -i -s "rchar" {} \; | sort -n -r -k 2 > $1
}

search temp1
sleep 60
search temp2

touch temp3

while read line; do
    pid=$(echo $line | awk -F "/" '{print $3}')
    already_written=$(echo $line | awk '{print $2}')
    writted_now=$(grep -s "/proc/$pid/" temp2 | awk '{print $2}')
    if [[ $writted_now ]]; then
        was_writted=$(echo "$writted_now-$already_written"| bc)
        echo $pid $was_writted >> temp3
    fi
done < temp1

cat temp3 | sort -n -r -k 2 | head -n 3 | awk '{print $1 " : " $2}'
