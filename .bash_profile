bind 'TAB:menu-complete'
RESET="\[\033[0m\]"
GREY="\[\033[38;5;242m\]"
BLUE="\[\033[38;5;4m\]"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export NODE_EXTRA_CA_CERTS="/opt/homebrew/etc/ca-certificates/cert.pem"
export CURL_CA_BUNDLE="/opt/homebrew/etc/ca-certificates/cert.pem"
export SSL_CERT_FILE="/opt/homebrew/etc/openssl/cert.pem"
export NIX_SSL_CERT_FILE="/etc/ssl/cert.pem"
export WGETRC="$HOME/.wgetrc"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"
export BAT_THEME=gruvbox-light
export SQLC_AUTH_TOKEN=sqlc_01JAHV18ZCS6J4CN9F9KFAJSCP
export PNPM_HOME="/Users/arnavsharma/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
eval "$(fzf --bash)"
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}
parse_git_dirty() {
    [[ $(git status --porcelain 2> /dev/null) ]] && echo "*"
}
parse_git_ahead_behind() {
    local ahead behind
    ahead=$(git rev-list --count @{u}..HEAD 2>/dev/null)
    behind=$(git rev-list --count HEAD..@{u} 2>/dev/null)
    [[ $ahead -gt 0 ]] && echo -n "⇡"
    [[ $behind -gt 0 ]] && echo -n "⇣"
}
git_prompt() {
    local branch=$(parse_git_branch)
    if [[ -n $branch ]]; then
        echo -n " ${GREY}${branch}$(parse_git_dirty)$(parse_git_ahead_behind)${RESET}"
    fi
}
PROMPT_COMMAND=__prompt_command
__prompt_command() {
    PS1="\n${BLUE}\w${RESET}$(git_prompt)\n"
}
alias p="pnpm"
alias dx="pnpm dlx"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias nxt="pnpm dlx create-next-app@latest"
alias v.="fd --type f --hidden | fzf | xargs nvim"
alias ds="docker ps -q | xargs docker stop"
alias db="grep -E "^DATABASE_URL=" .env | sed -e "s/^DATABASE_URL=//""
alias cln="git clone"
alias cm="git add . && git commit -m"
alias gd="git diff"
alias gs="git status"
alias psh="git push"
alias nw="mkdir"
alias rf="rm -rf"
alias fr="rm -rf"
alias srf="sudo rm -rf"
alias sfr="sudo rm -rf"
alias .="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias ssl="openssl genrsa 2048"
alias l="ls -a --color"
alias tre="tree -I 'node_modules|\.git|\.next|\raycast|\.config/raycast' -a"
alias fd="fd --type f --hidden --exclude .git"
alias q='cd "$HOME"'
alias d='cd "$HOME/dotfiles"'
alias dw='cd "$HOME/Downloads"'
alias nx='cd "$HOME/dotfiles/.config/nix-darwin"'
alias z='cd "$HOME/Code/$(ls $HOME/Code | fzf)"'
HISTFILE=~/.bash_history
HISTSIZE=999
HISTFILESIZE=1000
HISTCONTROL=ignoredups:ignorespace:erasedups
shopt -s histappend
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
export BASH_SILENCE_DEPRECATION_WARNING=1
