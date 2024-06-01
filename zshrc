if [ -z "$TMUX" ]; then
    tmux attach -t 1 || tmux new-session -s 1
fi

autoload -U colors && colors

export PS1="%{ %F{green}%}%~%{ %F{default}%}❯ "

alias h="tmux select-layout even-horizontal"

alias cm="cmake .."
alias cmd="cmake -DCMAKE_BUILD_TYPE=Debug .."
alias ma="make"

alias zh="vi ~/.zshrc"
alias zhe=". ~/.zshrc"

alias vm="vi ~/.vimrc"
alias svm="source ~/.vimrc"

alias gd="cd ~/ALL/MIT\ Courses/6.1100/phase1"
alias gdc="cd ~/ALL/C++"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -am"
alias gp="git push"

alias bk="cd .."
alias ew="exit"
alias tm="tmux"

alias ru="make && ./tracker"

alias bu="./build.sh"
alias bud="./build_debug.sh"

alias sshgpu="ssh -X ewang6@dt-login04.delta.ncsa.illinois.edu"
alias sshmul="ssh -X ewang1@eofe7.mit.edu"

alias sem="cd ~/ALL/MIT\ COURSES/6.1100/semantics; ./semantic_test.sh > out.txt; vi out.txt"

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

addgd() {
    local alias_name=$1
    local current_path="$(pwd)"
    local escaped_path="${current_path// /\\ }"
    echo "alias $alias_name='cd $escaped_path'" >> ~/.zshrc
}

alias gdm='cd /Users/ericwang/ALL/C++/programming\ 6\ -\ template'
