full_string=""
while :; do
    read current_string
    if [[ "$current_string" == "q" ]]; then
        break
    fi
    full_string+="$current_string"
done
echo "$full_string"
