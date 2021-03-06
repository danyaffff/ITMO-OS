for proc in $(ps ax -o pid); do
    pid=$(grep -P -s "^Pid:" /proc/$proc/status | grep -s -o -P '\d*')
    ppid=$(grep -P -s "^PPid:" /proc/$proc/status | grep -s -o -P '\d*')
    sum_exec_runtime=$(grep -P -s "se.sum_exec_runtime" /proc/$proc/sched | awk '{print $3}')
    nr_switches=$(grep -P -s "nr_switches" /proc/$proc/sched | grep -o -s -P '\d*')
    
    if [[ -z $pid ]]; then
	continue;
    fi

    if [[ -z $ppid ]]; then
        ppid=0
    fi	

    art=$(echo "scale=2; x=$sum_exec_runtime/$nr_switches; if(x<1&&x!=0) print 0; x" | bc)

    echo "ProcessID=$pid : Parent_ProcessID=$ppid : Averange_Running_Time=$art"
done |
    sort --key=2 -V > out4.txt
