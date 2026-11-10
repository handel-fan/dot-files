# Load shared paths and environment variables first.
source "$HOME/.config/fish/env.fish"

# Homebrew environment.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Interactive-shell configuration.
if status is-interactive
    # Aliases.
    alias ls lsd
    alias ll 'lsd -lh'
    alias la 'lsd -A'
    alias lla 'lsd -lha'
    alias tree 'lsd --tree'

    # Enable vi keybindings before configuring other tools.
    fish_vi_key_bindings

    # Shell integrations.
    zoxide init fish | source
    fzf --fish | source
    set -Ux RIP_GRAVEYARD "$HOME/.local/share/graveyard"

    # Atuin history search, preserving fish's up-arrow behavior.
    atuin init fish --disable-up-arrow | source

    # Custom keybindings.
    bind -M insert ctrl-f forward-char
    bind -M insert ctrl-p up-or-search
    bind -M default ctrl-p up-or-search

    # Ensure Atuin owns Ctrl+R instead of fzf.
    bind ctrl-r _atuin_search
    bind -M insert ctrl-r _atuin_search
    set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --exclude .git'
    # Additional sourced configuration.
    source "$FISH_DIR/cd_funcs.fish"
    source "$FISH_DIR/funcs.fish"
    remind_every_week_update
end
