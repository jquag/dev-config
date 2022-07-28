function gpsup --wraps='git push --set-upstream origin (git branch --show-current)' --description 'alias gpsup=git push --set-upstream origin (git branch --show-current)'
  git push --set-upstream origin (git branch --show-current) $argv; 
end
