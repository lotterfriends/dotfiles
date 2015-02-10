
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
