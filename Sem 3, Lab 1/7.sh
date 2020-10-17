grep -E -h -I -i -o -r -s "[[:alnum:]_-]+@[[:alnum:]]+\.([[:alnum:]]+){1}" "/etc" | tr -s "\n" "," | sed 's/.$/\n/' > "${PWD}/emails.lst"
