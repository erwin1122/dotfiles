# ~/.config/fish/config.fish

# Only in interactive shells
if not status is-interactive
    return
end

# Show system info on shell start
fastfetch

# Aliases
alias ls 'ls -a --color=auto'
alias ll 'ls -l -a --color=auto'
alias grep 'grep --color=auto'
alias lg 'lazygit'

# tmux autostart: nur wenn nicht schon in tmux und echtes Terminal
if not set -q TMUX; and isatty stdout
  #tmux attach; or tmux new-session
  tmux;
end

# Environment variables
set -gx NNN_OPTS "dH"
set -gx NNN_OPENER "nvim"
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
