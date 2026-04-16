function gs
    git status
end

function gd
    git diff
end

function gdc
    git diff --cached
end

function gpl
    git pull
end

function gl
    git log
end
function glp
    git log -p
end

function gln
    git log --name-only
end

function gcam
    git commit -am "$argv"
end
