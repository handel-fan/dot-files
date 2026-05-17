if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux fish_dir "/Users/handelmac/.config/fish"
set -Ux dropbox_dir /Users/handelmac/Dropbox
set -Ux ZATHURA_PLUGINS_DIR /opt/homebrew/Cellar/zathura-pdf-poppler/2026.02.03

eval "$(/opt/homebrew/bin/brew shellenv)"

set -gx EDITOR nvim
set -gx RIPGREP_CONFIG_PATH /Users/handelmac/.config/.ripgreprc
source $fish_dir/cd_funcs.fish
source $fish_dir/funcs.fish
fish_vi_key_bindings
fzf --fish | source
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# i test -f /opt/homebrew/anaconda3/bin/conda
#     eval (/opt/homebrew/anaconda3/bin/conda shell.fish hook $argv)
# else
#     if test -f "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
#         source "/opt/homebrew/anaconda3/etc/fish/conf.d/conda.fish"
#     else
#         set -x PATH /opt/homebrew/anaconda3/bin $PATH
#     end
# end
# <<< conda initialize <<<
