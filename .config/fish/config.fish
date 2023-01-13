if status is-interactive
  # Commands to run in interactive sessions can go here

  set -gx EDITOR vim
  set -gx VISUAL vim

  fish_add_path /usr/local/bin
  fish_add_path /usr/bin
  fish_add_path /usr/sbin

  source ~/.config/fish/local-config.fish

  # starship
  starship init fish | source


  function nvm
    bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
  end

  set -x NVM_DIR ~/.nvm
  nvm use default --silent

end
