# Default editor
set -x EDITOR nvim
set -x VISUAL nvim

# Wayland / Hyprland env
set -x XDG_SESSION_TYPE wayland
# set -x XDG_CURRENT_DESKTOP Hyprland
# set -x XDG_SESSION_DESKTOP Hyprland
set -x XDG_CURRENT_DESKTOP niri
set -x XDG_SESSION_DESKTOP niri

# App specific Wayland hints
set -x MOZ_ENABLE_WAYLAND 1
set -x QT_QPA_PLATFORM wayland
set -x SDL_VIDEODRIVER wayland

if status is-interactive
	# Commands to run in interactive sessions can go here

	fish_add_path ~/.nvm
	bass source /usr/share/nvm/init-nvm.sh
	function nvm
		bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
	end
end
