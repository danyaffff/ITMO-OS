previous_ppid=-1
total_art=0
counter=0

while read line ; do
    ppid=$(echo $line | cut -d ":" -f 2 | awk -F "=" '{print $2}')
    art=$(echo $line | cut -d ":" -f 3 | awk -F "=" '{print $2}')

    if [[ $previous_ppid != -1 && $ppid != $previous_ppid ]]; then
	echo Average_Running_Children_of_ParentID=
	$previous_ppid is $(echo "scale=2; x=$total_art / $counter; if(x<1&&x!=0) print 0; x" | bc)
        total_art=0
        counter=0
    fi

    echo $line

    total_art=$(echo "scale=2; x=$total_art+$art; if(x<1&&x!=0) print 0; x" | bc)
    ((counter+=1))
    previous_ppid=$ppid
done < out4.txt > out5.txt

echo Average_Running_Children_of_ParentID=
$previous_ppid is $(echo "scale=2; x=$total_art / $counter; if(x<1&&x!=0) print 0; x" | bc) >> out5.txt
