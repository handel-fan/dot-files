set -x python_dir "$hh_dir/py"
set -U dls $HOME/Downloads


set -x notes_dir ~/notes

function d
    nvim "$notes_dir/dailies.txt"
end

function nom
    python3 $python_dir/notify_me/notify_me.py
end

function cdl
    cd "$hh_dir/cpp/llvm-project/"
end

function cdc
    cd "$hh_dir/cpp"
end

function edf
    cd $fish_dir
    nvim config.fish
end

function edk
    cd ~/.config/kitty/
    nvim kitty.conf
end

function edn
    cd ~/.config/nvim/lua/plugins
    nvim ./config.lua
end

function edz
    cd ~/.config/zellij
    nvim config.kdl
end

function nvd
    nvim .
end

function n
    nvim $argv
end

function mcd
    set name_of_dir "$argv[1]"
    mkdir -p -- "$name_of_dir"
    cd "$name_of_dir"
end

function upd
    sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y
end

function sf
    source "$fish_dir/config.fish"
end

function edff
    cd $fish_dir
    nvim handel_funcs/funcs.fish
end

function hh
    cd $hh_dir
end

function hhp
    cd $python_dir
end

function hhm
    cd $hh_dir/py/matrix_mult/
end

function x
    cat | xclip -sel clip
end

function ctc
    if not set -q argv[1]
        echo "no argument given"
    end
    set file_path "$argv[1]"
    cat file_path | xclip -selection clipboard
end

function pwx
    pwd | x
end

function hhc
    cd $hh_dir/cpp
end

function sl
    sudo systemctl suspend
end

function cb
    rm -rf build
    mcd build
    cmake -DCMAKE_CXX_FLAGS="-fuse-ld=lld" ..
    rm build.log
    ninja &>build.log
    nom
    less build.log
end

function hless
    history | less
end

function tuts
    cd ~/handel_house/tuts
end

function susp
    sudo systemctl suspend
end

function gfd
    if not set -q argv[1]
        echo "no argument given"
    end
    set file_path "$argv[1]"
    realpath (dirname $file_path)
end

function st
    tmux source ~/.tmux.conf
end

function ltmux
    tmux list-keys -T prefixless | less
end

function edt
    nvim ~/.tmux.conf
end

function xcl
    xclip -selection clipboard
end

function edi3
    nvim ~/.config/i3/config
end

function edg
    nvim ~/.config/ghostty/config
end

function torrent_steps
    printf "\n1. Run monitor_eddie"
    printf "\n2. Run run_eddie in a different shell"
    printf "\n3. Check to ensure the ip is eddie, and the leak isn't comcast."
    printf "\n4. Run rtorrent_bound <mytorrent.torrent >"
end

function eddie_vpn_ip
    set EDDIE_VPN_IP (ip -j addr show dev Eddie | jq -r '.[0].addr_info[]
    | select(.family=="inet") 
    | .local')
    printf $EDDIE_VPN_IP
end

function monitor_eddie
    set ISP_IP_ADDR (curl ifconfig.io)
    eqprint
    printf "ISP_IP_ADDR IS $ISP_IP_ADDR"
    eqprint

    eqprint
    read -P "run_eddie now and press any key"
    eqprint

    check_eddie_obfuscating $ISP_IP_ADDR
end

function check_eddie_obfuscating

    set ISP_IP_ADDR $argv[1]

    # basic obfuscation check
    set EDDIE_VPN_EXIT_IP (curl ifconfig.io)
    if test "$ISP_IP_ADDR" = "$EDDIE_VPN_EXIT_IP"
        printf "NOT OBFUSCATING IP ADDRESS, EXITING\n\n\n"
        return 1
    end

    is_comcast_ip $EDDIE_VPN_EXIT_IP

    less ~/handel_house/torrenting_stuff/basic_ip_tests/(ls -t ~/handel_house/torrenting_stuff/basic_ip_tests/ | head -n 1)

    eqprint
    printf "YOU JUST SAW THE BASIC IP ADDRESS OWNER, NOW HERES THE LEAK ADDRESS\n"
    eqprint

    # dns leak check
    set SESSION (head -c 20 /dev/urandom | sha1sum | awk '{print $1}')
    set RAND (head -c 6 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9')
    set ip_leak_arr (curl -s https://$SESSION-$RAND.ipleak.net/dnsdetection/ | jq -r '.ip | keys[]')

    for possible_ip_leak in $ip_leak_arr
        is_comcast_ip $possible_ip_leak dns_leak_test
    end
    less ~/handel_house/torrenting_stuff/ip_leak_tests/(ls -t ~/handel_house/torrenting_stuff/ip_leak_tests | head -n 1)
end


function is_comcast_ip
    set -l ip $argv[1]
    set -l leak_flag $argv[2]

    if test -z "$ip"
        echo "usage: is_comcast_ip <IP> [leak_flag]"
        return 2
    end

    # WHOIS match pattern for Comcast
    set -l pat '^(Org(Name|anization)|org-name|OrgTechName|OrgAbuseName|NetName|descr|owner):.*comcast'

    if whois $ip | string match -ri $pat
        printf "COMCAST CAN SEE YOU\n"
        return 1
    else
        eqprint
        printf "NOT COMCAST, GO FORTH"
        eqprint
    end

    set -l ts (date "+%A_%B_%d_%Y_%I-%M%p")

    if test -n "$leak_flag"
        whois $ip >~/handel_house/torrenting_stuff/ip_leak_tests/$ts.txt
    else
        whois $ip >~/handel_house/torrenting_stuff/basic_ip_tests/$ts.txt
    end
end

function run_eddie
    eddie-cli --login="j3gann@gmail.com" --password="kct-fyd-ydy4HEN1zca" --connect --server=Sheratan netlock
end

function rtorrent_bound
    set -l magnet_link $argv[1]
    if test -z "$magnet_link"
        printf "please provide magnet link"
        return 2
    end
    eqprint
    printf "This is the eddie vpn ip: "
    eddie_vpn_ip
    printf "\n"
    read -l -P "do you want to proceed? yes/no" answer
    if test ! "$answer" = yes
        printf ABORTING
        return 1
    end
    rtorrent -b (eddie_vpn_ip) $magnet_link
end

function testing_read

    read -l -P "do you want to proceed? yes/no" answer
    if test ! "$answer" = yes
        printf ABORTING
        return 1
    end

end

function test_rtorrent
    rtorrent -b 10.187.242.109 \
        -o throttle.global_down.max_rate.set_kb=10 \
        -o throttle.global_up.max_rate.set_kb=5 \
        ~/Downloads/ubuntu-25.04-desktop-amd64.iso.torrent
end

function monitor_rtorrent_test
    set EIP (ip -4 addr show Eddie | awk '/inet /{print $2}' | cut -d/ -f1)
    echo "$EIP"

    watch -n 1 "ss -tnp | awk '/rtorrent/ && /ESTAB/ {print \$4, \"->\", \$5}' | \awk -v eip=$EIP 'index(\$1,eip\":\"){print} !index(\$1,eip\":\"){print \"LEAK? \"\$0}'"
end

function me
    monitor_eddie
end

function re
    run_eddie
end

function eqprint
    printf "\n"
    printf "=================================================="
    printf "\n"
end

function mcm
    make clean
    make
end

function ra5
    set discount $argv[1]
    set noise $argv[2]
    set living_reward $argv[3]
    python gridworld.py -g DiscountGrid -a value --discount $discount --noise \
        $noise --livingReward $living_reward
end

function gobk
    zathura --mode fullscreen ~/Documents/books/go_interpreter.pdf
end

function pwrsave
    sudo cpupower frequency-set -g powersave
end

function perfmnce
    sudo cpupower frequency-set -g performance
end

function zel
    zellij
end

function lz
    lazygit
end
function hl
    hless
end

function ngitignore
    nvim $(git rev-parse --show-toplevel)/.gitignore
end

function zt
    zellij action new-tab --cwd "."
end

bind \et zt

function bc
    batcat $argv
end

function fd
    fdfind $argv
end

function fdrg
    fdfind | rg $argv
end

function nf
    n (fzf)
end

function bag_of_edits_rnn_train
    bash /home/handel/handel_house/uml_handel/COMP-5300-JEGAN-DAN-EDIT-CORPUS/scripts/baseline_bag_rnn/train_baseline_bag_rnn.bash
end

function bag_of_edits_rnn_eval
    bash /home/handel/handel_house/uml_handel/COMP-5300-JEGAN-DAN-EDIT-CORPUS/scripts/baseline_bag_rnn/evaluate_baseline_bag_rnn.bash
end

function bb
    set -l last_cmd $history[1]

    if test "$last_cmd" = bb
        echo "Refusing to run bb recursively."
        return 1
    end

    eval $last_cmd
end
