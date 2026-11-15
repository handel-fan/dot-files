function reveal
    set -l paths
    for file in $argv
        set -a paths (realpath -- $file)
    end
    
    osascript -e '
on run argv
    set selectedFiles to {}
    repeat with p in argv
        set end of selectedFiles to (POSIX file p as alias)
    end repeat
    tell application "Finder"
        reveal selectedFiles
        activate
    end tell
end run
' $paths
end
