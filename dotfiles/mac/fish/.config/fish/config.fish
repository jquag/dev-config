if status is-interactive
    set -gx TERM xterm-256color
    set -gx EDITOR nvim
    set -gx VISUAL nvim
    set -xg XDG_CONFIG_HOME ~/.config
    set -xg XDG_DATA_HOME ~/.local/share
    set -xg XDG_STATE_HOME ~/.local/state

    fish_add_path /usr/local/opt/erlang@24/bin
    fish_add_path /usr/local/bin
    fish_add_path /usr/bin
    fish_add_path /usr/sbin
    fish_add_path ~/.local/bin
    fish_add_path ~/go/bin
    fish_add_path ~/.local/share/nvim/mason/bin
    fish_add_path ~/dev/tools/google-cloud-sdk/bin
    fish_add_path /opt/homebrew/bin
		fish_add_path /opt/homebrew/opt/erlang@24/bin
		fish_add_path ~/.magento-cloud/bin
		fish_add_path /opt/homebrew/opt/ruby/bin
		fish_add_path /opt/homebrew/opt/openjdk@21/bin

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

		source /opt/homebrew/opt/asdf/libexec/asdf.fish

    #if command -q tmux; and test -z "$TMUX"
    #    tmux attach -t default; or tmux new -s default
    #end

		source "$HOME/.cargo/env.fish"

		function nvm_auto_use --on-variable PWD
				if test -f .nvmrc
						nvm use
				end
		end

	[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/johnq/tools/google-cloud-sdk/path.fish.inc' ]; . '/Users/johnq/tools/google-cloud-sdk/path.fish.inc'; end


