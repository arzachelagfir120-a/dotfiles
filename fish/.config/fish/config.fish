if status is-interactive
    # 1. Jalankan Fastfetch di paling atas
    # --teatime atau --logo-type bisa ditambah sesuai selera
    fastfetch --logo-type small

    # 2. Hilangkan pesan selamat datang bawaan
    set fish_greeting

    # 3. Inisialisasi Starship (Prompt)
    starship init fish | source

    # 4. Aliases (Gabungan dari yang sebelumnya)
    alias v="nvim"
    alias g="git"
    alias lg="lazygit"
end
