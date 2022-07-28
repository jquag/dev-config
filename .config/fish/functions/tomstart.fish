function tomstart --wraps='catalina.sh start' --description 'alias tomstart=catalina.sh start'
  catalina.sh start $argv; 
end
