result=1
operation="+"

( tail -f channel & echo $! >&3 ) 3>pid |
while true; do
    read line;
    case $line in
        QUIT)
            echo Я тоже
            kill $(<pid)
            exit 0
        ;;
        "+")
            operation="+"
        ;;
        "*")
            operation="*"
        ;;
        [0-9]*)
            case $operation in
                "+")
                    let "result+=$line"
                ;;
                "*")
                    let "result*=$line"
                ;;
            esac
            echo $result
        ;;
        *)
            kill $(<pid)
            exit 1
        ;;
    esac
done
