if status is-interactive
  # Commands to run in interactive sessions can go here

  set -gx EDITOR vim
  set -gx VISUAL vim
  set -gx TERM xterm-256color

  eval $(/Users/e137516/homebrew/bin/brew shellenv)
  bass source ~/.nvm/nvm.sh
  starship init fish | source

  fish_add_path ~/tools/apache-tomcat-8.5.73/bin
  fish_add_path ~/tools/apache-tomcat-8.5.73/sbin
  fish_add_path ~/.npm-global/bin

  set -gx EDITOR vim
  set -gx VISUAL vim
  set -gx TOMCAT_HOME ~/tools/apache-tomcat-8.5.73
  #set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home
  set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
  set -gx NODE_TLS_REJECT_UNAUTHORIZED 0

  set -gx CATALINA_OPTS "-agentlib:jdwp=transport=dt_socket,address=1043,server=y,suspend=n"

  set -xg XDG_CONFIG_HOME ~/.config
  set -xg XDG_DATA_HOME ~/.local/share
  set -xg XDG_STATE_HOME ~/.local/state

  fish_add_path /Users/e137516/homebrew/bin
  fish_add_path /Users/e137516/homebrew/Cellar/nvm/0.39.1_1/
  fish_add_path /usr/local/bin
  fish_add_path /usr/bin
  fish_add_path /usr/sbin
  fish_add_path /Users/e137516/tools/vulcan

  #fish_add_path /Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home/bin
  fish_add_path /Library/Java/JavaVirtualMachines/zulu-11/Contents/Home/bin

  # starship
  starship init fish | source


  function nvm
    bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
  end

  set -x NVM_DIR ~/.nvm
  nvm use default --silent

end
