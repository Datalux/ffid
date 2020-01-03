ffid() {

	if [ -z "$@" ]
	then
		>&2 echo "ffid: no nickname specified!"
	else
        cmd=$(curl -s https://www.facebook.com/${@} | grep -o 'entity_id[^[:blank:]]*' | awk -F':' '{print $2}' | awk -F '}' '{print $1}')
        if [[ -n $cmd ]]; then
            echo "$cmd"
        else
            >&2 echo "ffid: invalid nickname. Usage: ffid <facebook nickname>" 
        fi
	fi
}

alias ffid=ffid 