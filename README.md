# ffid
Find Facebook ID: a shell command to find users's Facebook ID.

 # Installation
Create or edit the RC File of your shell (`~/.bashrc` if you use Bash or `~/.zshrc` if you use ZSH) (_for MAC users edit `~/.bash_profile` file instead `~/.bashrc`._ file) and append the following code:
 
 ```bash
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
```
Now restare your terminal.

# Usage
Just run:

`$ ffid <facebook nickname>`
