if status is-interactive
  set fish_greeting
  oh-my-posh init fish --config ~/.config/ohMyPosh/custom.omp.json | source

  alias ls='exa --group-directories-first --icons --color=always --git'
  alias la='exa -a --group-directories-first --icons --color=always --git'
  alias ll='exa -l --group-directories-first --icons --color=always --git'
end
