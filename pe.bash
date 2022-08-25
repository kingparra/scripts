pe() {
	stdin=$(</dev/stdin)
	for exp in "$@"; do
		eval "stdin=\${stdin$exp}"
	done
	echo "$stdin"
}


tcase1() {
	if [[ "$(pe ,,  //1/2 <<< "THIS STRING 1")" == "this string 2" ]]; then
		echo "it works!"
	else
		echo "what the hell, man" >&2
	fi
}

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
	pe "$@"
else
	tcase1
fi
