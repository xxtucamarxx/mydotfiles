# My aliases

# some more ls aliases
alias ll='ls -alch'
alias la='ls -A'
alias l='ls -CFlhtr'

# connects to server
alias server="ssh -p 9022 tucamar@150.165.131.12"


# goes back x dirs
up() { cd "$(eval printf '../%.0s' "{1..$1}")" || exit; }

# gets git token
alias token="cat ~/.gittoken"

# easy git push
lazygit ()
{
  git add .
  git commit -m "${1}"
  git push
}

# extracts files
extract () {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xvjf "$1"    ;;
      *.tar.gz)    tar xvzf "$1"    ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar x "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xvf "$1"     ;;
      *.tbz2)      tar xvjf "$1"    ;;
      *.tgz)       tar xvzf "$1"    ;;
      *.zip)       unzip "$1"       ;;
      *.Z)         uncompress "$1"  ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "don't know how to extract '$1'..." ;;
    esac
  else
      echo "'$1' is not a valid file!"
  fi
}
export PATH="/home/tucamar/.local/bin/:$PATH"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_DEFAULT_COMMAND="fdfind --type f --color=never --hidden"
export FZF_DEFAULT_OPTS="--layout=reverse --border"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--height=70% --preview 'batcat --color=always --line-range :50 {}'"


export FZF_ALT_C_COMMAND="fdfind --type d . --color=never "
export FZF_ALT_C_OPTS="--preview 'exa -TL 3 {}'"

cd_with_fzf(){
  cd $HOME && cd "$(fdfind -t d | fzf --height=50% --layout=reverse --preview="exa -TL 3 {}")"
}

open_with_fzf() {
    fdfind -t f -H -I | fzf --layout=reverse -m --preview="xdg-mime query default {}" | xargs -ro -d "\n" xdg-open 2>&-
}

bind '"\es": "open_with_fzf\n"'
bind '"\C-o": "cd_with_fzf\n"'
