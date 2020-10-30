result=1
operation="+"

(tail -f channel) |
while true; do
    read line;
    case $line in
        QUIT)
            echo Я тоже
            killall tail
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
            killall tail
            exit 1
        ;;
    esac
done
