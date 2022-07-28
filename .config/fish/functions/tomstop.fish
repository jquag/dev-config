function tomstop --wraps='catalina.sh stop' --description 'alias tomstop=catalina.sh stop'
  catalina.sh stop $argv; 
end
