# ---------- Etapa 1: build ----------
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app

# Copia primeiro apenas os arquivos de dependência para aproveitar cache do Docker
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw dependency:go-offline -B

# Agora copia o código-fonte e builda o jar
COPY src ./src
RUN ./mvnw clean package -DskipTests -B

# ---------- Etapa 2: runtime ----------
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

# O Render injeta a variável PORT automaticamente; o app já está configurado
# para ler server.port=${PORT:8080} no application.properties
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
