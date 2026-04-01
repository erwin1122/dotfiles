# ~/.config/fish/config.fish

# Only in interactive shells
if not status is-interactive
    return
end

# Show system info on shell start (only if installed)
if type -q fastfetch
    fastfetch
end

# Aliases
alias ls 'ls -a --color=auto'
alias ll 'ls -l -a --color=auto'
alias grep 'grep --color=auto'
alias lg 'lazygit'
alias cl 'clear'

# tmux autostart: nur wenn nicht schon in tmux und echtes Terminal
if not set -q TMUX; and isatty stdout
    if tmux list-sessions 2>/dev/null | grep -q '(attached)'
        # An attached session exists – open a new one
        exec tmux new-session
    else if tmux list-sessions &>/dev/null
        # Sessions exist but none attached – attach to one
        exec tmux attach-session
    else
        # No sessions at all – create new
        exec tmux new-session
    end
end

# Environment variables
set -gx NNN_OPTS "dH"
set -gx NNN_OPENER "nvim"
set -gx EDITOR "nvim"
set -gx VISUAL "nvim"
