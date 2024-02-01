if status is-interactive
    set -gx TERM xterm-256color
    set -gx EDITOR vim
    set -gx VISUAL vim
    set -xg XDG_CONFIG_HOME ~/.config
    set -xg XDG_DATA_HOME ~/.local/share
    set -xg XDG_STATE_HOME ~/.local/state
    # set -xg TMUX_CONF_LOCAL ~/.config/tmux/tmux.conf.local

    fish_add_path /usr/local/opt/erlang@24/bin
    fish_add_path /usr/local/bin
    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    fish_add_path ~/go/bin
    fish_add_path ~/.local/share/nvim/mason/bin
    fish_add_path ~/dev/tools/google-cloud-sdk/bin
    fish_add_path /opt/homebrew/bin
    fish_add_path ~/.local/bin

    # vim mode
    fish_vi_key_bindings

    # custom bindings
    bind -M insert \cf 'tmux-sessionizer; commandline -f repaint'
    bind -M default \cf 'tmux-sessionizer; commandline -f repaint'

    # starship
    starship init fish | source


    function nvm
        bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
    end

    set -x NVM_DIR ~/.nvm
    nvm use default --silent

    if test -e /usr/local/opt/asdf/libexec/asdf.sh
        bass source /usr/local/opt/asdf/libexec/asdf.sh
    end

    if command -q tmux; and test -z "$TMUX"
        tmux attach -t default; or tmux new -s default
    end
end
