function cubase_blues_ideas --description "Open or create current month's Cubase blues project"
    set -l root "$HOME/Music/Cubase Projects/blues_ideas"
    set -l template "$root/blues_ideas_template.cpr"
    
    set -l year (date +%Y)
    set -l month (date +%m)
    
    set -l dir "$root/$year/$month"
    set -l project "$dir/"$year"_"$month".cpr"
    
    if test -f "$project"
        echo "Existing: $project"
        open "$project"
        return
    end
    
    if not test -f "$template"
        echo "Template not found: $template" >&2
        return 1
    end
    
    mkdir -p "$dir"; or return 1
    cp "$template" "$project"; or return 1
    
    echo "Created: $project"
    open "$project"
end
