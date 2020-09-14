if [[ "$1" -gt "$2" ]]; then
    if [[ "$1" > "$3"  ]]; then
        echo "$1"
    else
        echo "$3"
    fi
else
    if [[ "$2" -gt "$3"  ]]; then
        echo "$2"
    else
        echo "$3"
    fi
fi
