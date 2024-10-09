if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
  source <(fzf --zsh)
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export NODE_EXTRA_CA_CERTS="/opt/homebrew/etc/ca-certificates/cert.pem"
export CURL_CA_BUNDLE="/opt/homebrew/etc/ca-certificates/cert.pem"
export SSL_CERT_FILE="/opt/homebrew/etc/openssl/cert.pem"
export WGETRC="$HOME/.wgetrc"
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}
source ~/fzf-git.sh
alias br="brew"
alias bri="brew install"
alias bric="brew install --cask"
alias bru="brew update && brew upgrade && brew ls --cask | xargs brew upgrade --cask && brew cleanup"
alias brcl="brew cleanup"
alias at="tmux attach"
alias p="pnpm"
alias dx="pnpm dlx"
alias pa="pnpm add"
alias pad="pnpm add -D"
alias pl="pnpm run lint"
alias pd="pnpm run dev"
alias pb="pnpm run build"
alias pf="pnpm format"
alias ps="pnpm start"
alias pua="pnpm ui:add"
alias pdg="pnpm db:generate"
alias pdm="pnpm db:migrate"
alias pdp="pnpm db:push"
alias pds="pnpm db:studio"
alias nxt="pnpm dlx create-next-app@canary"
alias v="nvim"
alias v.="fd --type f --hidden | fzf | xargs nvim"
alias ds="docker ps -q | xargs docker stop"
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
alias bk="cd .."
alias ..="cd ../.."
alias ...="cd ../../.."
alias ....="cd ../../../.."
alias .....="cd ../../../../.."
alias ssl="openssl genrsa 2048"
alias l="eza --git-ignore"
alias la="eza -a"
alias ll="eza -al"
alias tre="eza --tree --git-ignore -a"
alias fd="fd --type f --hidden --exclude .git"
alias man="tldr"
alias q="cd"
alias c="cd && cd Code"
alias d="cd && cd dotfiles"
alias dw="cd && cd Downloads"
alias vm="cd && cd dotfiles/.config/nvim"
[ -s "/Users/arnavsharma/.bun/_bun" ] && source "/Users/arnavsharma/.bun/_bun"
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
HISTDUP=erase
setopt appendhistory
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_verify
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export FPATH="<eza>/completions/zsh:$FPATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl/lib/pkgconfig"
export LDFLAGS="-L/opt/homebrew/opt/openssl/lib"
export CPPFLAGS="-I/opt/homebrew/opt/openssl/include"
export BAT_THEME=gruvbox-light
