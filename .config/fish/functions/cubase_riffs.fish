function cubase_riffs --description 'Open or create monthly Cubase riff project'
    set -l dir "$HOME/Music/Cubase Projects/riffs"
    set -l template "$dir/riffs_template.cpr"
    set -l project "$dir/"(date +%Y_%m)".cpr"
    
    if not test -f "$project"
        if not test -f "$template"
            echo "Template not found: $template" >&2
            return 1
        end
        
        cp "$template" "$project"; or return 1
        echo "Created: $project"
    else
        echo "Existing: $project"
    end
    
    open "$project"
end
