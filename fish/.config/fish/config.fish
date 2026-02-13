if status is-interactive
        fastfetch --logo-type small

    set fish_greeting

  
    starship init fish | source

    # 4. Aliases (Gabungan dari yang sebelumnya)
    alias v="nvim"
    alias g="git"
    alias lg="lazygit"
end
