if status is-interactive
# Commands to run in interactive sessions can go here
end

set fish_greeting

alias ..="cd .."
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

abbr -a install "sudo pacman -S"
abbr -a remove "sudo pacman -Rns"
abbr -a update "sudo pacman -Syu"
abbr -a search "pacman -Ss"

if type -q eza
	alias ls="eza --long --no-permissions --no-user --no-filesize --header --bytes --time-style="+%Y-%m-%d" --created --group-directories-first"
end
export PATH="$HOME/.local/bin:$PATH"
