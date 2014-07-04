# Created by newuser for 4.3.17

########$B%3%b%s$J@_Dj(B########
#$B%(%$%j%"%9$?$A(B
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
#$B%3%^%s%IMzNr(B
HISTFILE=~/.history_zsh
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups

setopt correct
export LESS='-R'
setopt NO_beep
########$B4D6-JQ?t@_Dj(B########
# $TERM$B56Au!#%U%k%+%i!<2=!#(Bfxxkin gterm
if [ $TERM = "xterm" ] ; then
    export TERM="xterm-256color"
  else
    export LANG="C"
fi
# $LANG$B@_Dj(B
if [ $TERM = "linux" ] ; then
    export LANG="C"
  else
    export LANG=ja_JP.UTF-8
fi
# $PATH$B@_Dj(B
export PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/etrobo/bin

########$BJd405!G=(B########
#$BJd40%a%C%;!<%8(B
zstyle ':completion:*' format '%F{123}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

#ssh$B%[%9%HL>Jd40(B
_cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`)
#$BJd405!G=M-8z2=(B
autoload -U compinit
compinit

########$BI=<(ItJ,(B########
#$B%+%i%U%k$K$9$k!#(B
autoload colors
colors
#$B%W%m%s%W%H%U%)!<%^%C%H(B
local p_dir="%F{117}[%~]%f%b"$'\n'
local p_info="%n@%m"
local p_mark="%(?,%F{121},%F{214})%B%(!,#,$)%b%f "
PROMPT="$p_dir$p_info $p_mark"
PROMPT2="$p_info $p_mark >"
SPROMPT="%R -> %r ? (y/n/a/e): "
case "${TERM}" in
kterm*|xterm*)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST}\007"
	}
	;;
esac

########$BA`:nJ}K!(B########
#bindkey -v
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end  history-search-end
#bindkey "" history-beginning-search-backward-end
#bindkey "" history-beginning-search-forward-end

