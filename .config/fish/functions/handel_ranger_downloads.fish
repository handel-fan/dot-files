function handel_ranger_downloads --description 'Open Ranger with current directory and Downloads, focused on Downloads'
    ranger . \
        --cmd='set viewmode multipane' \
        --cmd='tab_new' \
        --cmd="cd $HOME/Downloads"
end
