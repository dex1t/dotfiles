# load other files
[ -f ~/.zshrc.private ] && source ~/.zshrc.private
[ -f ~/.zshrc.alias ] && source ~/.zshrc.alias
[ -f ~/.zshrc.peco ] && source ~/.zshrc.peco

# Environment variable configuration
export LANG=ja_JP.UTF-8

# Default shell configuration
autoload colors
colors

# 晴れと雨マーク
setopt prompt_subst
PROMPT="%{${fg[cyan]}%}[${HOST%%.*} %2~]%{${reset_color}%}%(?.%{$fg[yellow]%}.%{$fg[blue]%})%(?!☀ !☂ )%{${reset_color}%} "

# auto change directory
setopt auto_cd

# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound when complete list displayed
setopt nolistbeep

# Keybind configuration
bindkey -e

# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt share_history # 履歴を共有する。 
setopt hist_ignore_dups # 直前のコマンドの重複を削除する。 
setopt hist_save_no_dups # 重複するコマンドが保存される時、古い方を削除する。 
setopt hist_expire_dups_first   # 古い履歴を削除する必要がある場合、まず重複しているものから削除する。 
setopt hist_find_no_dups    # 履歴検索で重複しているものを表示しない。 
setopt append_history # 履歴を上書きしないで追加する。 
setopt hist_no_store # historyコマンドは除去する。 

# zsh editor
autoload zed

# terminal configuration
unset LSCOLORS
case "${TERM}" in
xterm)
    export TERM=xterm-color
    ;;
kterm)
    export TERM=kterm-color
    # set BackSpace control character
    stty erase
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors \
        'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac

#補完機能を使用する
autoload -U compinit promptinit
compinit -u
zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1

# 補完時に大小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

#補完でカラーを使用する
zstyle ':completion:*' list-colors "${LS_COLORS}"

#zsh補完 git
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

#gitプロンプト表示
autoload -Uz add-zsh-hook
autoload -Uz colors
colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"

    if [[ -e $PWD/.git/refs/stash ]]; then
        stashes=$(git stash list 2>/dev/null | wc -l)
        psvar[2]="☁ ${stashes// /}"
    fi
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f%F{cyan}%2v%f|)"

# git alias complete
setopt no_complete_aliases

# Homebrew PATH
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# PATH
export PATH=$PATH:/System/Library/Frameworks/Ruby.framework/Versions/Current/usr/bin
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/opt/mine:$PATH
export PATH=$HOME/.rbenv/versions/2.7.4/bin:$PATH

# for android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# for node
export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for heroku
export PATH="/usr/local/heroku/bin:$PATH"

# for direnv
eval "$(direnv hook zsh)"

# for go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

# for pyenv
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
export PATH="/usr/local/opt/mysql@5.6/bin:$PATH"

