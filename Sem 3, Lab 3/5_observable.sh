while true; do
    read line
    echo $line > channel

    if [[ $line == "QUIT" ]]; then
        echo Я спать
        exit 0
    fi

    if [[ $line != "+" && $line != "*" && ! $line =~ [0-9]+ ]]; then
        echo ":("
    fi
done
