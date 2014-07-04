# Created by newuser for 4.3.17

########コモンな設定########
#エイリアスたち
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
#コマンド履歴
HISTFILE=~/.history_zsh
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups

setopt correct
export LESS='-R'
setopt NO_beep
########環境変数設定########
# $TERM偽装。フルカラー化。fxxkin gterm
if [ $TERM = "xterm" ] ; then
    export TERM="xterm-256color"
  else
    export LANG="C"
fi
# $LANG設定
if [ $TERM = "linux" ] ; then
    export LANG="C"
  else
    export LANG=ja_JP.UTF-8
fi
# $PATH設定
export PATH=$PATH:/opt/android-sdk-linux/platform-tools:/opt/etrobo/bin

########補完機能########
#補完メッセージ
zstyle ':completion:*' format '%F{123}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

#sshホスト名補完
_cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`)
#補完機能有効化
autoload -U compinit
compinit

########表示部分########
#カラフルにする。
autoload colors
colors
#プロンプトフォーマット
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

########操作方法########
#bindkey -v
#autoload history-search-end
#zle -N history-beginning-search-backward-end history-search-end
#zle -N history-beginning-search-forward-end  history-search-end
#bindkey "" history-beginning-search-backward-end
#bindkey "" history-beginning-search-forward-end

