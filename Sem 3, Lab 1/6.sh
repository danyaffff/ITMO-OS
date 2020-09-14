file="/var/log/anaconda/X.log"
output="${PWD}/full.log"
sed -n 's/(II)/Information:/p' $file | sed 1d > $output
sed -n 's/(WW)/Warning:/p' $file >> $output
