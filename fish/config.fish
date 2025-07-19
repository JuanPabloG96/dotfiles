if status is-interactive
    set fish_greeting

    # Cargar Oh My Posh en segundo plano para evitar bloqueos
    oh-my-posh init fish --config ~/.config/ohMyPosh/custom.omp.json | source &

    # Alias de exa
    alias ls='exa -l --group-directories-first --icons --color=always --git'
    alias la='exa -l -a --group-directories-first --icons --color=always --git'
    alias logout='loginctl terminate-user $USER'

    # Alias de fzf
    alias inv='nvim $(fzf --preview="bat --color=always {}")'
    alias iops='open $(fzf --preview="bat --color=always {}")'

    # Alias clear
    alias clear="reset"
end

# fnm para Node.js
fnm env --use-on-cd | source

# w3m
export PATH="/usr/lib/w3m:$PATH"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

fastfetch
