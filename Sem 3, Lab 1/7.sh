grep -E -h -I -i -o -r -s "[[:alnum:]_-]+@[[:alnum:]]+\.([[:alnum:]]+){1}" "/etc" > "${PWD}/emails.lst"
