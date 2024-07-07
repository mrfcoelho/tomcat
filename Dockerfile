FROM centos:7

# Install java sdk
RUN yum -y localinstall https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.rpm
ENV JAVA_HOME=/usr/lib/jvm/jdk-22-oracle-x64

# Install tomcat
ENV TOMCAT_VERSION=8.5.100
ENV CATALINA_HOME=/opt/apache-tomcat-${TOMCAT_VERSION}
RUN curl https://archive.apache.org/dist/tomcat/tomcat-8/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -o apache-tomcat-${TOMCAT_VERSION}.tar.gz
RUN tar -xzvf apache-tomcat-${TOMCAT_VERSION}.tar.gz -C /opt/
RUN rm apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Configure SSL
COPY src/cacert.crt ${CATALINA_HOME}/conf/cacert.crt
COPY src/privkey.pem ${CATALINA_HOME}/conf/privkey.pem
COPY src/server.xml ${CATALINA_HOME}/conf/server.xml

# Install sample webapp
ADD https://tomcat.apache.org/tomcat-8.5-doc/appdev/sample/sample.war ${CATALINA_HOME}/webapps

EXPOSE 4041

CMD ${CATALINA_HOME}/bin/catalina.sh run