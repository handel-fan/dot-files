function nvim_test_zellij_tabs
    if not set -q ZELLIJ
        command nvim $argv
        return $status
    end
    
    set -l info (zellij action current-tab-info --json 2>/dev/null | python3 -c 'import json,sys; x=json.load(sys.stdin); print(x["tab_id"]); print(x["name"])')
    
    if test (count $info) -ne 2
        command nvim $argv
        return $status
    end
    
    set -l tab_id $info[1]
    set -l original_name $info[2]
    
    if not string match -q '[NVIM] *' -- $original_name
        zellij action rename-tab --tab-id $tab_id "[NVIM] $original_name"
        set -l renamed 1
    end
    
    command nvim $argv
    set -l exit_status $status
    
    if set -q renamed
        zellij action rename-tab --tab-id $tab_id "$original_name" 2>/dev/null
    end
    
    return $exit_status
end
