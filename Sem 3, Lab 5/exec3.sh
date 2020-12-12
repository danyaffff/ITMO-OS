K=$1
N=$2

for (( i=0; i < K; i++ )); do
    ./newmem.sh $N &
    sleep 1
done
