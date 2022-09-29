if status is-interactive
  # Commands to run in interactive sessions can go here


  #eval $(/Users/e137516/homebrew/bin/brew shellenv)
  #bass source ~/.nvm/nvm.sh
  #starship init fish | source

  #fish_add_path ~/tools/apache-tomcat-8.5.73/bin

  set -gx EDITOR vim
  set -gx VISUAL vim
  #set -gx TOMCAT_HOME ~/tools/apache-tomcat-8.5.73
  #set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_271.jdk/Contents/Home

  fish_add_path /usr/local/bin
  fish_add_path /usr/bin
  fish_add_path /usr/sbin

  source ~/.config/fish/local-config.fish

  # starship
  starship init fish | source
end
