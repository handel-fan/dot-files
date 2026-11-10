function edf
    cd "$FISH_DIR"
    nvim config.fish
end

function edg
    cd "$HOME/.config/ghostty"
    nvim config
end

function tuts
    cd "$HOME/handelmac_house/tuts"
end

function sw
    open -a foobar2000 \
        "$DROPBOX_DIR/vocal-warmups/short/playlist_short_warmup.fpl"
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

function hl
    hless
end

function sf
    source "$FISH_DIR/config.fish"
end

function edn
    cd "$HOME/.config/nvim/lua"
    nvim config/lazy.lua
end

function student_id
    printf '%s' 02197006 | pbcopy
    printf '%s\n' 02197006
end

function intrp
    open "$HOME/Documents/writing_an_INTERPRETER_in_go.pdf"
end

function d
    nvim "$HOME/notes/dailies.txt"
end

function get_datetime
    set curr_datetime (date "+%Y-%m-%dH%HM%M")

    printf '%s' "$curr_datetime" | pbcopy
    printf '%s\n' "$curr_datetime"
end

function mcm
    make clean
    and make
end

function gs
    git status $argv
end

function gpl
    git pull $argv
end

function gd
    git diff $argv
end

function sendhw
    bash send_hw_mercury.bash $argv
end

function gcam
    git commit -am "$argv"
end

function gl
    git log $argv
end

function glp
    git log -p $argv
end

function handel_tailscale
    ssh handel@100.78.179.6
end

function pdebt
    nvim "$DROPBOX_DIR/notes/post_debt_purchases.txt"
end

function mkhashdoc
    set ext md

    if test (count $argv) -ge 1
        set ext $argv[1]
    end

    while true
        set timestamp (date +%Y%m%d_%H%M%S_%N)
        set hash (
            printf '%s' "$timestamp" \
                | shasum -a 256 \
                | awk '{print substr($1, 1, 8)}'
        )
        set filename "$timestamp"_"$hash"."$ext"

        if not test -e "$filename"
            touch "$filename"
            echo "$filename"
            return 0
        end
    end
end

function scr
    cd "$HOME/notes/scrap"
    nvim (mkhashdoc)
end

function oo
    open .
end

function o.
    open .
end

function r
    ranger $argv
end

function zath
    command zathura -p "$ZATHURA_PLUGINS_DIR" $argv
end

function n
    nvim $argv
end

function p
    python3 $argv
end

function lz
    lazygit $argv
end

function pwc
    pwd | pbcopy
end

function fdf
    fd | rg $argv
end

function fdrg
    fdf $argv
end

function get_gitignore_path
    set repo_root (git rev-parse --show-toplevel 2>/dev/null)

    if test $status -ne 0
        echo "Not inside a Git repository." >&2
        return 1
    end

    echo "$repo_root/.gitignore"
end

function edgitignore
    set gitignore_path (get_gitignore_path)
    or return

    nvim "$gitignore_path"
end

function edgin
    edgitignore
end

function umass_lowell_gpu1
    ssh jsivakas@cs-gpu1.cs.uml.edu
end

function umass_lowell_gpu2
    ssh jsivakas@cs-gpu2.cs.uml.edu
end

function gpu1
    umass_lowell_gpu1
end

function gpu2
    umass_lowell_gpu2
end

function nf
    set selected_file (fd --type f | fzf)

    if test -n "$selected_file"
        nvim "$selected_file"
    end
end

function edr
    nvim "$HOME/.config/ranger/rc.conf"
end

function oil
    nvim -c Oil
end

function yadm_lazygit
    lazygit \
        --git-dir (yadm rev-parse --git-dir) \
        --work-tree "$HOME"
end

function ylz
    yadm_lazygit
end

function lzy
    yadm_lazygit
end

function iwantit
    eval (string join ' ' -- $argv) 2>&1 \
        | tee /dev/tty \
        | pbcopy
end

function swb
    SwitchAudioSource \
        -s "Bose QC Ultra Headphones" \
        -t output
end

function swc
    SwitchAudioSource \
        -s "Clarett+ 8Pre" \
        -t output
end

function gsm
    git switch main
end

function cpy
    $argv 2>&1 \
        | tee /dev/tty \
        | pbcopy
end

function ltxmke
    set out "/tmp/latexmk-errors.txt"

    latexmk -g -pdf main_backup_04_25.tex >"$out" 2>&1

    cat "$out"
    command pbcopy <"$out"

    echo "Copied latexmk output to clipboard."
end

function todo
    nvim "$HOME/notes/todo/todo.md"
end

function dropbox_fzf
    cd "$DROPBOX_DIR/notes"
    nf
end

function drpf
    dropbox_fzf
end

function hst
    history | moor
end

function bb
    for cmd in $history
        if test "$cmd" != bb
            eval "$cmd"
            return $status
        end
    end

    echo "No previous non-bb command found."
    return 1
end

function nvim_files
    set files

    for f in *
        if test -f "$f"
            set -a files "$f"
        end
    end

    if test (count $files) -gt 0
        nvim $files
    else
        echo "No files in current directory."
    end
end

function llvm_issues
    begin
        gh issue list \
            -R llvm/llvm-project \
            --label "good first issue" \
            --state open \
            --limit 1000 \
            --json number,title,url,labels,createdAt,closedAt,state \
            --jq '
                .[]
                | select([.labels[].name] | any(test("(?i)^mlir")))
                | "\(.number)\t\(.state)\tcreated=\(((now - (.createdAt | fromdateiso8601)) / 86400) | floor)d ago\tclosed=-\t\(.title)\t\(.url)"
            '

        gh issue list \
            -R llvm/llvm-project \
            --label "good first issue" \
            --state closed \
            --limit 1000 \
            --json number,title,url,labels,createdAt,closedAt,state \
            --jq '
                .[]
                | select([.labels[].name] | any(test("(?i)^mlir")))
                | "\(.number)\t\(.state)\tcreated=\(((now - (.createdAt | fromdateiso8601)) / 86400) | floor)d ago\tclosed=\(((now - (.closedAt | fromdateiso8601)) / 86400) | floor)d ago\t\(.title)\t\(.url)"
            '
    end
end

function nvim_none
    nvim -i NONE $argv
end

function leet_logs
    cd "$LEET_DIR/logs"
    nvim (date "+%m_%d_%Y.md")
end

function leet_track
    cd "$LEET_DIR"
    nvim tracker.md
end

function cmplr_assignment_2_make_parse
    make test_parse BISON=/opt/homebrew/opt/bison/bin/bison
end

function cmplr_assignment_2_make_scan
    make test_scan BISON=/opt/homebrew/opt/bison/bin/bison
end

alias a2mp='cmplr_assignment_2_make_parse'
alias a2ms='cmplr_assignment_2_make_scan'

function glno
    git log --name-only
end

function find_func
    set -l fn (functions --names | fzf)
    if test -n "$fn"
        $fn
    end
end

function latexcreateone --description "Compile the sole .tex file into build/out"
    set -l files (command find . -maxdepth 1 -type f -name '*.tex')

    if test (count $files) -ne 1
        echo "Error: Expected exactly one .tex file; found "(count $files)
        return 1
    end

    set -l source $files[1]
    set -l name (path change-extension '' (path basename $source))
    set -l timestamp (date +%Y-%m-%d_%H-%M)
    set -l dir out
    set -l output "$name"_"$timestamp"

    mkdir -p $dir
    or return $status

    # Add random suffix if the PDF already exists
    while test -e "$dir/$output.pdf"
        set -l suffix (string sub -l 6 (string replace -a -r '[^a-z]' '' (head -c 32 /dev/urandom | base64 | string lower)))
        test -n "$suffix"; or continue
        set output "$name"_"$timestamp"_"$suffix"
    end

    latexmk -pdf -outdir="$dir" -jobname="$output" $source
    or return $status

    latexmk -c -outdir="$dir" -jobname="$output" $source
    or return $status

    echo "Created: $dir/$output.pdf"
end

alias lcone='latexcreateone'

function handel_ranger_downloads --description "Open Ranger with current directory and Downloads, focused on Downloads"
    ranger . \
        --cmd='set viewmode multipane' \
        --cmd='tab_new' \
        --cmd="cd $HOME/Downloads/temp_chrome/"
end
alias hrd='handel_ranger_downloads'

# set QUICK_DIR ~/notes/dailies.txt
# function set_quick_dir
#     set -g QUICK_DIR (realpath $argv[1])
# end
# function nn
#     nvim $QUICK_DIR
# end
function remind_every_week_update
    set -l timestamp_file_path ~/.local/state/fish-reminders/package-updates-last-reminded
    set -l now (date +%s)
    set -l last_reminded 0

    if test -f $timestamp_file_path
        set last_reminded (stat -c %Y $timestamp_file_path 2>/dev/null; or stat -f %m $timestamp_file_path)
    end

    if test (math "$now - $last_reminded") -ge 604800
        echo "Reminder: update Homebrew / APT"
        mkdir -p (dirname $timestamp_file_path)
        touch $timestamp_file_path
    end
end
