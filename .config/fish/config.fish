
set -gx fish_dir ~/.config/fish

set -gx hh_dir ~/handel_house

set -gx CXX /usr/bin/g++
set -gx CC /usr/bin/gcc
set -gx LD /usr/local/bin/ld.lld
set -gx CMAKE_GENERATOR Ninja
set -Ux XDG_CONFIG_HOME /home/handel/.config

set -Ux EDITOR nvim
set -Ux VISUAL nvim

fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here
end

for file in $fish_dir/handel_funcs/*
    source $file
end
