# Uygalamanin calismasi için JRE lazim
FROM eclipse-temurin:17

# projenin jar dosyasi burada
ARG JAR_FILE=build/libs/*.jar

# projenin jar halini docker icine kopyala
COPY ${JAR_FILE} my_app.jar

# uygulamalarin ic portunu sabitle
EXPOSE 8080

# uygulamayi Java komutla calistir
ENTRYPOINT ["java", "-jar", "/my_app.jar"]