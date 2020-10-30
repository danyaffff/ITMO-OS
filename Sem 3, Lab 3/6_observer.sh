result=1
operation="+"

terminate() {
    echo Я тоже
    exit 0
}

plus() {
    operation="+"
}

asterisk() {
    operation="*"
}

trap 'terminate' SIGTERM
trap 'plus' USR1
trap 'asterisk' USR2

while true; do
    case $operation in
        "+")
            let "result+=2"
        ;;
        "*")
            let "result*=2"
        ;;
    esac
    sleep 1
    echo $result
done
