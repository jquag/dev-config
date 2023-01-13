function mvni --wraps='mvn clean install -DskipTests -Djavax.net.ssl.trustStore=/Users/e137516/dev/cacerts' --description 'alias mvni mvn clean install -DskipTests -Djavax.net.ssl.trustStore=/Users/e137516/dev/cacerts'
  mvn install -DskipTests -Djavax.net.ssl.trustStore=/Users/e137516/dev/cacerts $argv; 
end
