echo "-------------"
echo "|  1. nano   |"
echo "|  2. vi     |"
echo "|  3. links  |"
echo "|  0. exit   |"
echo "--------------"
echo "command >> "
read command
case "$command" in
    1) nano ;;
    2) vi ;;
    3) links ;;
    0) exit
esac
