PS1="\[\033[1;33m\]X / _ / X < \[\033[0m\]"
alias ls='ls --color=auto'
alias ll='ls --color=auto -alF'
alias be='bundle exec'
export TERM=xterm-256color

export PATH="~/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

peco-select-history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | peco --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-f": peco-select-history'
