max_ram=-1
pid_max_ram=-1
for proc in $(ps ax -o pid | sed 1d); do
	pid=$(grep -P -s "^Pid:" /proc/$proc/status | grep -s -o -P '\d*')
	vmrss=$(grep -P -s "^VmRSS:" /proc/$proc/status | grep -s -o -P '\d*')

	if [[ -z $vmrss ]]; then
		continue;
	fi

	if [[ $vmrss -gt $max_ram ]]; then
		max_ram=$vmrss
		pid_max_ram=$pid
	fi
done

echo "$pid_max_ram : $max_ram"
