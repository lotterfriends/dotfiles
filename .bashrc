
# add bin to path 
PATH="$PATH:~/bin"

# set vim as default editor
export EDITOR=vim

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

# show repo infos in PS1
function parse_git_branch () {
        git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (git » \1)#'
}
function parse_svn_branch() {
        parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk '{print " (svn » "$1")" }'
}
function parse_svn_url() {
        svn info 2>/dev/null | sed -ne 's#^URL: ##p'
}
function parse_svn_repository_root() {
        svn info 2>/dev/null | sed -ne 's#^Repository Root: ##p'
}

if [[ ${EUID} == 0 ]] ; then
        # root
        export PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[31m\]$(parse_git_branch)$(parse_svn_branch)\[\033[01;34m\]\[\033[00m\] '
else
        # normal user
        export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[31m\]$(parse_git_branch)$(parse_svn_branch)\[\033[01;34m\]\[\033[00m\] '
fi


