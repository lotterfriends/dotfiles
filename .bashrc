
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
        git rev-parse --abbrev-ref HEAD 2> /dev/null | sed 's#\(.*\)# (git » \1)#'
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



###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
    source /etc/bash_completion.d/git-completion.bash
fi

# https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash
if [ -f /etc/bash_completion.d/git-flow-completion.bash ]; then
    source /etc/bash_completion.d/git-flow-completion.bash
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi


