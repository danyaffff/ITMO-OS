start=$(date '+%F_%R')

mkdir ~/test && {
    echo "catalog test was created successfully" > ~/report;
    touch ~/test/$start;
}

ping -c 1 www.net_nikogo.ru &> /dev/null ||
echo "$start Error to connect" >> ~/report
