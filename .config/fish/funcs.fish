set -U dls $HOME/Downloads

function edf
    cd ~/.config/fish/
    nvim config.fish
end

function edg
    cd ~/.config/ghostty/
    nvim config
end

function tuts
    cd ~/handelmac_house/tuts/
end

function sw
    open -a foobar2000 ~/Dropbox/vocal-warmups/short/playlist_short_warmup.fpl
end

function handel
    ssh handel@handel-house.local
end
function phoenix
    ssh jegan@10.0.0.218
end

function handel_wifi
    ssh handel@192.168.0.18
end

function hless
    history | less
end

function sf
    source ~/.config/fish/config.fish
end

function edn
    cd ~/.config/nvim/lua
    nvim ./config/lazy.lua
end

function student_id
    printf 02197006 | pbcopy
    printf 02197006
end

function intrp
    open ~/Documents/writing_an_INTERPRETER_in_go.pdf
end

function d
    nvim ~/notes/dailies.txt
end

function get_datetime
    set curr_date (date "+%Y-%m-%d")
    set curr_hour (date "+%H")
    set curr_mins (date "+%M")
    set curr_datetime "$curr_date"H"$curr_hour"M"$curr_mins"
    printf $curr_datetime | pbcopy
    printf $curr_datetime
end

function mcm
    make clean
    make
end

function gs
    git status
end

function gpl
    git pull
end

function gd
    git diff
end

function sendhw
    bash send_hw_mercury.bash
end

function gcam
    set commit_msg $argv
    git commit -am "$commit_msg"
end

function gl
    git log
end

function glp
    git log -p
end

function handel_tailscale
    ssh handel@100.78.179.6
end

function pdebt
    nvim ~/Dropbox/notes/post_debt_purchases.txt
end

function mkhashdoc
    set ext txt
    if test (count $argv) -ge 1
        set ext $argv[1]
    end

    while true
        set timestamp (date +%Y%m%d_%H%M%S_%N)
        set hash (echo -n $timestamp | shasum -a 256 | awk '{print substr($1,1,8)}')
        set filename "$timestamp"_"$hash"."$ext"

        if not test -e $filename
            touch $filename
            echo $filename
            return 0
        end
    end
end

function scr
    cd ~/notes/scrap/
    nvim (mkhashdoc)
end

function oo
    open .
end

function r
    ranger
end

function zath
    command zathura -p /opt/homebrew/Cellar/zathura-pdf-poppler/2026.02.03 $argv
end

function n
    nvim $argv
end

function p
    python3 $argv
end

function o.
    open .
end

function lz
    lazygit
end

function drp
    cd ~/Dropbox/
end

function pwc
    pwd | pbcopy
end

function fdf
    fd | rg $argv
end

function get_gitignore_path
    echo (git rev-parse --show-toplevel)/.gitignore
end

function edgitignore
    nvim (get_gitignore_path)
end

function edgin
    edgitignore
end

function add_latex_gitignore
    set path (get_gitignore_path); or return 1
    set template ~/.config/fish/gitignore_templates/latex.gitignore
    set token "# >>> latex gitignore >>>"

    # If token already exists → abort
    if grep -qF "$token" $path
        echo "latex gitignore already added - NOT ADDING"
        return 1
    end

    # Append token + contents
    echo "" >>$path
    echo $token >>$path
    cat $template >>$path
    echo "# <<< latex gitignore <<<" >>$path

    echo "latex gitignore added"
end
