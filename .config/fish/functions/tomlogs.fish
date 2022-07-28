function tomlogs --wraps='tail -f ~/tools/apache-tomcat-8.5.73/logs/catalina.out' --description 'alias tomlogs=tail -f ~/tools/apache-tomcat-8.5.73/logs/catalina.out'
  tail -f ~/tools/apache-tomcat-8.5.73/logs/catalina.out $argv; 
end
