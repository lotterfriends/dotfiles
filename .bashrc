
# add bin to path 
PATH="$PATH:~/bin"

alias la="ls -la"
alias ll="ls -l"
alias l="ls -l"

function extract() {
     if [ -f $1 ] ; then
         case $1 in
            *.tar.bz2)   
                tar xvjf $1     
                ;;
            *.tar.gz)    
                tar xvzf $1     
                ;;
            *.bz2)       
                bunzip2 $1      
                ;;
            *.rar)
                unrar x $1      
                ;;
            *.gz)
                gunzip $1       
                ;;
            *.tar)
                tar xvf $1      
                ;;
            *.tbz2)
                tar xvjf $1     
                ;;
            *.tgz)
                tar xvzf $1     
                ;;
            *.zip)
                unzip $1        
                ;;
            *.Z)
                uncompress $1   
                ;;
            *.7z)
                7z x $1         
                ;;
            *)  
                echo "'$1' cannot be extracted via extract" 
                ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}


# sudo apt-get install source-highlight
function catj() {
	cat "$1" | source-highlight -s js -f esc	
}

function catsh() {
	cat "$1" | source-highlight -s sh -f esc	
}

function cathtml() {
	cat "$1" | source-highlight -s html -f esc	
}

function catphp() {
	cat "$1" | source-highlight -s php -f esc
}

# Colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

# show repo infos in PS1
parse_git_branch () {
        git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git » \1)#'
}
parse_svn_branch() {
        parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn » "$1")" }'
}
parse_svn_url() {
        svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
parse_svn_repository_root() {
        svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

if [[ ${EUID} == 0 ]] ; then
        # root
        export PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[31m\]$(parse_git_branch)$(parse_svn_branch)\[\033[01;34m\]\[\033[00m\] '
else
        # normal user
        export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[31m\]$(parse_git_branch)$(parse_svn_branch)\[\033[01;34m\]\[\033[00m\] '
fi


