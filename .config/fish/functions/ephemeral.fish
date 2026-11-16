function ephemeral
    set -l fn (
        functions --names |
            string match -rv '^_|^ephemeral$' |
            fzf --prompt='Function > ' --height=100% --reverse
    )
    
    if test -n "$fn"
        $fn
    end
end
