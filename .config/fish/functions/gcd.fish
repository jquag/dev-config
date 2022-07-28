function gcd --wraps='git checkout develop' --description 'alias gcd git checkout develop'
  git checkout develop $argv; 
end
