function cubs
    cd "$HOME/Music/Cubase Projects"
end

function ltcd
    cd "$HOME/handelmac_house/leetcode"
end

function leet_ref
    n "$LEET_DIR/complete_cpp_leetcode.md"
end

function hh
    cd "$HOME/handelmac_house"
end

function alg1
    cd "$HOME/handelmac_house/uml_handel/algorithms"
end

function os1
    cd "$HOME/handelmac_house/uml_handel/os_1"
end

function aic
    cd "$HOME/handelmac_house/uml_handel/ai"
end

function lowl
    cd "$HOME/handelmac_house/uml_handel"
end

function ppng
    set image_name $argv[1]

    pngpaste "$image_name.png"
    and sips -s format pdf "$image_name.png" --out "$image_name.pdf"
end

function gobk
    zathura "$HOME/Documents/books/writing_an_INTERPRETER_in_go.pdf"
end

function uml
    cd "$HOME/handelmac_house/uml_handel"
end

function efp
    cd "$HOME/handelmac_house/uml_handel/efp"
end

function csr
    set csr_dir "$HOME/handelmac_house/uml_handel/csrsrch"

    if test (realpath "$PWD") = (realpath "$csr_dir")
        nvim chapter_1.v
    else
        cd "$csr_dir"
    end
end

function edz
    cd "$HOME/.config/zellij"
    set zel_dirs (fd -t f)
    nvim $zel_dirs
end

function dllm
    cd "$HOME/handelmac_house/uml_handel/deep_llms"
end

function zl
    zellij
end

function dllmfin
    cd "$HOME/handelmac_house/uml_handel/dllm_final_project/COMP-5300-JEGAN-DAN-EDIT-CORPUS"
end

function notes
    cd "$HOME/notes"
end

function tre
    command tre $argv -e
    and source "/tmp/tre_aliases_$USER" 2>/dev/null
end

function auditory_ecstasies
    cd "$DROPBOX_DIR/notes/music/auditory_ecstasies"
end

function aud
    auditory_ecstasies
end

function dlf
    dllmfin
end

function pmm
    cd "$HOME/handelmac_house/uml_handel/efp/final_project/pmm"
end

function latex_doc_dir
    cd "$HOME/handelmac_house/uml_handel/dllm_final_project/COMP-5300-JEGAN-DAN-EDIT-CORPUS/docs/main_04_25"
end

function drp
    cd "$DROPBOX_DIR"
end

function drpn
    cd "$DROPBOX_DIR/notes"
end

function slides
    cd "$HOME/handelmac_house/uml_handel/submit_efp_final/efp_final/writeup/slides"
end

function hormozi
    n "$DROPBOX_DIR/notes/improvements/hormozi_quotes.md"
end

function pairbond
    cd "$DROPBOX_DIR/notes/reflections/pair_bonding"
end

function minimums
    n "$DROPBOX_DIR/notes/graduate/compiler_career_weekly_minimums.md"
end

function grd
    cd "$DROPBOX_DIR/notes/graduate"
end

function cppref
    n "$LEET_DIR/complete_cpp_leetcode.md"
end

function drpleet
    cd /Users/handelmac/Dropbox/notes/leetcode
end

function leetjournal
    drpleet
    nvim journal.md
end

function thss
    uml
    cd thesis
end

function cmplr
    uml
    cd cmplr
end

function bminor
    cmplr
    cd BMinorCompiler
end

function cdf --description "Fuzzy find a file or directory and cd to it"
    set -l selected (fd --hidden --exclude .git | fzf)

    test -z "$selected"; and return

    if test -d "$selected"
        cd "$selected"
    else
        cd (dirname "$selected")
    end
end

function handel_cd_resume
    cd /Users/handelmac/handelmac_house/resume
end

alias resume='handel_cd_resume'
