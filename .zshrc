# vim: set expandtab : 
# Created by newuser for 4.3.17

############zplug###########
if [ -f "$HOME/.zplug/zplug" ]; then

source ~/.zplug/zplug
zplug "zsh-users/zsh-syntax-highlighting", nice:19
zplug "plugins/git",   from:oh-my-zsh, if:"which git"
zplug "plugins/ruby",   from:oh-my-zsh, if:"which ruby"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

fi

########コモンな設定########
#本体の設定
setopt NO_beep
#lessに色を付ける
export LESS='-R'
#エイリアスたち
alias l="ls"
alias ls="ls --color=auto"
alias ll="ls -l"
alias la="ls -a"
alias vi="vim"
alias v="vim"
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
#   && ${cmd} != (c|cd)
    && ${cmd} != (m|man)
    && ${cmd} != (qrencode)
    ]]
}

setopt correct

########   rbebv    ########
if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

########環境変数設定########
# $TERM偽装。フルカラー化。
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
#大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#sshホスト名補完
if [ -r ~/.ssh/config ]; then
    _cache_hosts=(`ruby -ne 'if /^Host\s+(.+)$/; print $1.strip, "\n"; end' ~/.ssh/config`)
    #_cache_hosts=(`grep 'Host\s' ~/.ssh/config |  sed -e 's:^Host\s\(\S\+\)\s*$:\1:g'`)
fi
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
    kterm*|xterm*|rxvt*)
        precmd() {
            echo -ne "\033]0;${USER}@${HOST}\007"
        }
        ;;
esac

########操作方法########
connect() {
    xrandr --output LVDS1 --off --output VGA1 --auto --right-of DP2 --output DP2 --rotate right --auto
}
disconnect() {
    xrandr  --output VGA1 --off --output DP2 --off --output LVDS1 --auto
}

return 0
