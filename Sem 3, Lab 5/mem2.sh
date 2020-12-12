array=()
sequence=(1 2 3 4 5 6 7 8 9 10)
counter=0
echo "" > report2.log

while true; do
    array+=(${sequence[@]})
    let counter++
    if [[ $counter == 100000 ]]; then
        # echo "${#array[@]}"
        counter=0
        echo "${#array[@]}" >> report2.log
    fi
done

