array=()
sequence=(1 2 3 4 5 6 7 8 9 10)

while true; do
    array+=(${sequence[@]})
    if [[ "${#array[@]}" == "$1" ]]; then
        exit 0
    fi
done

