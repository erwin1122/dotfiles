# ~/.bashrc

# Only in interactive shells
[[ $- != *i* ]] && return

# Aliases
alias ls='ls -a --color=auto'
alias ll='ls -l -a --color=auto'
alias grep='grep --color=auto'
alias lg='lazygit'

# Prompt
PS1='[\u@\h \W]\$ '

# Variable exports
export NNN_OPTS="dH"

# Wrapper for nnn
n() {
  # Block nesting of nnn in subshells
  [ "${NNNLVL:-0}" -eq 0 ] || {
    echo "nnn is already running"
    return
  }

  # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
  # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
  # see. To cd on quit only on ^G, remove the "export" and make sure not to
  # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
  #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
  export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

  # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
  # stty start undef
  # stty stop undef
  # stty lwrap undef
  # stty lnext undef

  # The command builtin allows one to alias nnn to n, if desired, without
  # making an infinitely recursive alias
  command nnn "$@"

  [ ! -f "$NNN_TMPFILE" ] || {
    . "$NNN_TMPFILE"
    rm -f -- "$NNN_TMPFILE" >/dev/null
  }
}
