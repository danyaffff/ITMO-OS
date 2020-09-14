count=0
for file in $(ls /var/log/*.log); do
    ((count+="$(wc -l < $file)"))
done
echo $count
