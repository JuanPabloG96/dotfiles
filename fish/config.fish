if status is-interactive
    set fish_greeting

    # Cargar Oh My Posh en segundo plano para evitar bloqueos
    oh-my-posh init fish --config ~/.config/ohMyPosh/custom.omp.json | source &

    # Alias de exa
    alias ls='exa -l --group-directories-first --icons --color=always --git'
    alias la='exa -l -a --group-directories-first --icons --color=always --git'
    alias logout='loginctl terminate-user $USER'
    alias cat='bat'

    # Alias de fzf
    alias svim='nvim $(fzf --preview="bat --color=always {}")'
    alias sopen='open $(fzf --preview="bat --color=always {}")'

    # Alias clear
    alias clear="reset"
end

# fnm para Node.js
fnm env --use-on-cd | source

# w3m
export PATH="/usr/lib/w3m:$PATH"

# composer laravel
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Auto-start SSH agent (silent version)
if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c) > /dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
end

fastfetch
