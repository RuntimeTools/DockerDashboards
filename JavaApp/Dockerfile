FROM websphere-liberty:javaee7

WORKDIR /usr/javametrics

EXPOSE 9080

ADD JavaSampleProject.war /config/dropins/
ADD javametrics-dash-1.0.1.war /config/dropins/
ADD server.xml /config/
ADD jvm.options /config/
ADD asm /usr/javametrics/asm
ADD javametrics-agent-1.0.1.jar /usr/javametrics/

