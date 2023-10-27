if status is-interactive
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/think/anaconda3/bin/conda
    eval /home/think/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
set EDITOR neovim

#alias add_project="set -a -U PROJECT_PATH"
function add_project
	set -a -U PROJECT_PATH (realpath $argv)
end


function dev_project
#:tmux new-session -A -c ./backend/ -s backend
	set result (printf '%s\n' $PROJECT_PATH | fzf)
	echo result is $result
	tmux new-session -A -c $result -s (path basename $result) nvim .
end

alias nnn="nnn -H"

alias choose_file="tmux split-window -h nnn -H -p -"

