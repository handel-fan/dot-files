function cubs
    cd '/Users/handelmac/Music/Cubase Projects'
end

function ltcd
    cd /Users/handelmac/handelmac_house/leetcode/
end

function hh
    cd /Users/handelmac/handelmac_house/
end

function alg1
    cd /Users/handelmac/handelmac_house/uml_handel/algorithms/
end
function os1
    cd /Users/handelmac/handelmac_house/uml_handel/os_1/
end

function aic
    cd /Users/handelmac/handelmac_house/uml_handel/ai/
end

function lowl
    cd /Users/handelmac/handelmac_house/uml_handel/
end

function ppng
    set image_name $argv[1]
    pngpaste $image_name.png
    sips -s format pdf $image_name.png --out $image_name.pdf
end

function gobk
    zathura /Users/handelmac/Documents/books/writing_an_INTERPRETER_in_go.pdf
end

function uml
    cd /Users/handelmac/handelmac_house/uml_handel/
end

function efp
    cd /Users/handelmac/handelmac_house/uml_handel/efp/
end

function efp
    cd /Users/handelmac/handelmac_house/uml_handel/efp/
end

function csr
    set csr_dir ~/handelmac_house/uml_handel/csrsrch

    if test (realpath $PWD) = (realpath $csr_dir)
        nvim chapter_1.v
    else
        cd $csr_dir
    end
end
function edz
    nvim ~/.config/zellij/config.kdl
end

function dllm
    cd ~/handelmac_house/uml_handel/deep_llms/
end

function zel
    zellij
end

function dllmfin
    cd /Users/handelmac/handelmac_house/uml_handel/dllm_final_project/COMP-5300-JEGAN-DAN-EDIT-CORPUS
end

function notes
    cd ~/notes
end
function tre
    command tre $argv -e; and source /tmp/tre_aliases_$USER ^/dev/null
end
