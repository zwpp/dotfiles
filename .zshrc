# config:UTF-8
# Created by newuser for 4.3.17

########コモンな設定########
#本体の設定
setopt NO_beep
#lessに色を付ける
export LESS='-R'
#エイリアスたち
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias vi="vim"
#コマンド履歴
HISTFILE=~/.history_zsh
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt hist_ignore_dups
setopt hist_ignore_space

zshaddhistory() {
	local line=${1%%$'\n'}
	local cmd=${line%% *}

    # 以下の条件をすべて満たすものだけをヒストリに追加する
	[[ ${cmd} != (l|l[sal])
#		&& ${cmd} != (c|cd)
		&& ${cmd} != (m|man)
		&& ${cmd} != (qrencode)
	]]
}

setopt correct
########環境変数設定########
# $TERM偽装。フルカラー化。fxxkin gterm
if [ $TERM = "xterm" ] ; then
    export TERM="xterm-256color"
fi
# $LANG設定
if [ $TERM = "linux" ] ; then
    export LANG="C"
  else
    export LANG=ja_JP.UTF-8
fi
# $PATH設定
export PATH=$PATH:/opt/android-sdk-linux/tools:/opt/android-sdk-linux/platform-tools:/opt/etrobo/bin
export PATH="$HOME/local:$PATH"

########補完機能########
#補完メッセージ
zstyle ':completion:*' format '%F{123}Completing %B%d%b%f'
zstyle ':completion:*' group-name ''

#sshホスト名補完
_cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`)
#ユーザー補完関数置き場
fpath=(~/.zsh/completion $fpath)

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

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

