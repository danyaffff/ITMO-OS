while true; do
    read line
    case $line in
        "TERM")
            kill -SIGTERM $1
            echo Я спать
            sleep 1
            exit 0
        ;;
        "+")
            kill -USR1 $1
        ;;
        "*")
            kill -USR2 $1
        ;;
    esac
done
