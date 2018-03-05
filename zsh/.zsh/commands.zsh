#! /usr/bin/env zsh

alias q=exit # very useful in emacs terminal

(( $+commands[ghcjs] )) && (( ! $+commands[ghcjsi] )) && alias ghcjsi='ghcjs --interactive'

(( $+commands[youtube-dl] )) && alias ydl='youtube-dl'

alias dl='curl -C - -L -O'

# coding competitions
function cpprun () {
    if [[ -z "$@" ]]; then
        return
    fi

    NAME=$(basename $1 .cpp)
    CPP=$NAME.cpp
    EXE=$NAME.exe
    INPUT=$NAME.input
    OUTPUT=$NAME.output
    RESULT=$NAME.result

    # compile
    g++ -W -Wall -Werror -Weffc++ -std=c++14 -O2 -fomit-frame-pointer $CPP -o $EXE

    if [[ $? -ne 0 ]]; then
        return 1
    fi

    # execute and compare
    time ./$EXE < $INPUT >! $RESULT
    diff $OUTPUT $RESULT > /dev/null

    if [[ $? -eq 0 ]]; then
        echo $fg[green] "Result ($RESULT) matches the expected output ($OUTPUT)" $fg[white]
    else
        echo $fg[red] "Result ($RESULT) does NOT match the expected output ($OUTPUT)" $fg[white]
    fi

    rm $EXE
}

function cppinput () {
    cat > "$(basename $1 .cpp).input"
}

function cppoutput () {
    cat > "$(basename $1 .cpp).output"
}

function cppshow () {
    cat "$(basename $1 .cpp).result"
}

function cppgo () {
    touch $1.cpp
    echo "Enter Input data:"
    cppinput $1
    echo "Enter expected Output data:"
    cppoutput $1
}

alias cr='cpprun'
alias ci='cppinput'
alias co='cppoutput'
alias cs='cppshow'
alias cg='cppgo'

# editor aliases
(( $+EDITOR )) && alias e=$EDITOR
alias se=sudoedit
(( $+VISUAL )) && alias v=$VISUAL

(( $+commands[xdg-open] )) && alias o='xdg-open'

# ssh into digitalocean droplets
function do-ssh () {
    if (( ! $+DROPLET )); then
        echo 'Set $DROPLET to use this command'
        return 1
    fi

    ssh root@${DROPLET}
}

# restart and check status
re () {
    if [[ -n $@ ]]; then
        sudo systemctl restart $@ && watch systemctl status $@
    else
        echo 'Usage: re [SERVICES]'
    fi
}

# check status
wa () {
    if [[ -n $@ ]]; then
        watch systemctl status $@
    else
        systemctl status
    fi
}

# pdf reader
(( $+commands[zathura] )) && alias z='zathura --fork'

# ipinfo.io/json
alias ipinfo='curl -s ipinfo.io/json'
