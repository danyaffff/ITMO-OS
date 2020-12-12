array=()
sequence=(1 2 3 4 5 6 7 8 9 10)
counter=0
echo "" > report.log  # при выполнении второго этапа поменять на report1.log

while true; do
    array+=(${sequence[@]})
    let counter++
    if [[ $counter == 100000 ]]; then
        # echo "${#array[@]}"
        counter=0
        echo "${#array[@]}" >> report.log  # при выполнении второго этапа поменять на report1.log
    fi
done
