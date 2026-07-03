function fish_prompt
	set -l green (set_color green)
    	set -l blue (set_color blue)
    	set -l purple (set_color magenta)
    	set -l normal (set_color normal)

	echo -s $green $USER $normal @ $blue (prompt_hostname) $purple " " $PWD ": " $normal
end
