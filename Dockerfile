FROM eclipse-temurin:8-jre-focal
RUN apt-get update && apt-get install -y wget
RUN wget https://s3-eu-west-1.amazonaws.com/subsonic-public/download/subsonic-6.1.6.deb
RUN dpkg -i subsonic-6.1.6.deb
# L'astuce cruciale trouvée lors de l'exec :
RUN ln -s /usr/share/subsonic/subsonic.war /subsonic.war
EXPOSE 4040
CMD ["java", "-Xmx256m", "-Dsubsonic.home=/var/subsonic", "-Dsubsonic.host=0.0.0.0", "-Dsubsonic.port=4040", "-jar", "/usr/share/subsonic/subsonic-booter-jar-with-dependencies.jar"]
