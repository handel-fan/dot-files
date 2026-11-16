function backup_config
    set -l source_dir "$HOME/.config"
    set -l destination "$HOME/Dropbox/config_backups/"(date +%Y)/(date +%m)
    set -l archive "$destination/config.tar.gz"
    
    test -f "$archive"; and return 0
    
    if not test -d "$source_dir"
        echo "CONFIG BACKUP FAILED: ~/.config missing" >&2
        return 1
    end
    
    mkdir -p "$destination"; or return 1
    
    set -l temporary "$destination/.config.$fish_pid.tmp"
    
    if tar --exclude='.config/iterm2/sockets' \
                    -czf "$temporary" -C "$HOME" .config
        if mv -n "$temporary" "$archive"
            rm -f "$temporary"
            echo "CONFIG BACKUP: $archive"
        else
            rm -f "$temporary"
            return 1
        end
    else
        rm -f "$temporary"
        echo "CONFIG BACKUP FAILED" >&2
        return 1
    end
end
