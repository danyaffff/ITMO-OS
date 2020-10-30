./4_cycle.sh & pid1=$!
./4_cycle.sh & pid2=$!
./4_cycle.sh & pid3=$!

renice +19 -p $pid1
renice +5 -p $pid2
renice +5 -p $pid3
echo $pid1

at now + 1 minute <<< kill $pid1
at now + 2 minute <<< kill $pid2 $pid3
