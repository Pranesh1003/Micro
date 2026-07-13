# Microservices: line-by-line code guide

This guide was generated from the current repository source. Every physical line in the selected services' `src/main` folders and each module `pom.xml` is reproduced below with an explanation. `api-service` in the request is the `api-gateway` folder in this repository.

## How to use this guide

- Each entry shows the original source line first, followed by a plain-English explanation.
- Blank lines and braces are included too, so line numbers match the source exactly.
- Configuration supplied by Config Server is included under Config Server, because client modules load it remotely at startup.
- Generated build output (`target/`) and tests are intentionally excluded: they do not define the running service implementation.

## Config Server - `config-server`

Central configuration provider. Client services request their properties from this service before they finish starting.

### `config-server/pom.xml`

- **Line 1:** `<?xml version="1.0" encoding="UTF-8"?>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `<project xmlns="http://maven.apache.org/POM/4.0.0"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 6:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 9:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 10:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `    <artifactId>config-server</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 15:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 16:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 17:** `            <artifactId>spring-cloud-config-server</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 18:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 19:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 20:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 21:** `            <artifactId>spring-boot-starter-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 22:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 23:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 24:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 25:** `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 26:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 27:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 30:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 31:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 32:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 33:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 34:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 35:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 36:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 37:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 38:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.

### `config-server/src/main/java/com/genc/arfoms/configserver/ConfigServerApplication.java`

- **Line 1:** `package com.genc.arfoms.configserver;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.cloud.config.server.EnableConfigServer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.cloud.client.discovery.EnableDiscoveryClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 9:** `@EnableConfigServer`
  Enables the Spring Cloud/Spring feature named by this annotation during application startup.
- **Line 10:** `@EnableDiscoveryClient`
  Enables the Spring Cloud/Spring feature named by this annotation during application startup.
- **Line 11:** `public class ConfigServerApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 12:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 13:** `        SpringApplication.run(ConfigServerApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 15:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `config-server/src/main/resources/application.yml`

- **Line 1:** `server:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `  port: 8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 4:** `spring:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `  application:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `    name: config-server`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `  profiles:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `    active: native`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** `  cloud:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `    config:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** `      server:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `        native:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 13:** `          search-locations: classpath:/config/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `eureka:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `  client:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `    service-url:`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 18:** `      defaultZone: http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/api-gateway.properties`

- **Line 1:** `server.port=8210`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 4:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `# --- Spring Cloud Gateway Routing ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** `spring.cloud.gateway.server.webflux.routes[0].id=auth-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 10:** `spring.cloud.gateway.server.webflux.routes[0].uri=http://localhost:8180`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 11:** `spring.cloud.gateway.server.webflux.routes[0].predicates[0]=Path=/api/auth/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `spring.cloud.gateway.server.webflux.routes[1].id=flight-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 14:** `spring.cloud.gateway.server.webflux.routes[1].uri=http://localhost:8181`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 15:** `spring.cloud.gateway.server.webflux.routes[1].predicates[0]=Path=/api/flights/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `spring.cloud.gateway.server.webflux.routes[2].id=booking-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 18:** `spring.cloud.gateway.server.webflux.routes[2].uri=http://localhost:8182`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 19:** `spring.cloud.gateway.server.webflux.routes[2].predicates[0]=Path=/api/bookings/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `spring.cloud.gateway.server.webflux.routes[3].id=checkin-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 22:** `spring.cloud.gateway.server.webflux.routes[3].uri=http://localhost:8193`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 23:** `spring.cloud.gateway.server.webflux.routes[3].predicates[0]=Path=/api/checkin/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `spring.cloud.gateway.server.webflux.routes[4].id=crew-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 26:** `spring.cloud.gateway.server.webflux.routes[4].uri=http://localhost:8184`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 27:** `spring.cloud.gateway.server.webflux.routes[4].predicates[0]=Path=/api/crew/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `spring.cloud.gateway.server.webflux.routes[5].id=loyalty-service`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 30:** `spring.cloud.gateway.server.webflux.routes[5].uri=http://localhost:8185`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 31:** `spring.cloud.gateway.server.webflux.routes[5].predicates[0]=Path=/api/loyalty/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `spring.cloud.gateway.server.webflux.routes[6].id=booking-service-flights`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 34:** `spring.cloud.gateway.server.webflux.routes[6].uri=http://localhost:8182`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 35:** `spring.cloud.gateway.server.webflux.routes[6].predicates[0]=Path=/flights/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `spring.cloud.gateway.server.webflux.routes[7].id=booking-service-airline`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 38:** `spring.cloud.gateway.server.webflux.routes[7].uri=http://localhost:8182`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 39:** `spring.cloud.gateway.server.webflux.routes[7].predicates[0]=Path=/airline/**`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `spring.cloud.gateway.server.webflux.default-filters[0]=DedupeResponseHeader=Access-Control-Allow-Origin Access-Control-Allow-Credentials RETAIN_FIRST`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 42:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 43:** `spring.cloud.gateway.server.webflux.globalcors.add-to-simple-url-handler-mapping=true`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 44:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[0]=http://127.0.0.1:5500`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 45:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[1]=http://localhost:5500`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 46:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[2]=http://localhost:5600`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 47:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[3]=http://127.0.0.1:5600`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 48:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[4]=http://localhost:8000`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 49:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[5]=http://127.0.0.1:8000`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 50:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[6]=http://localhost:8210`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 51:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[7]=http://localhost:63342`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 52:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[8]=http://127.0.0.1:63342`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 53:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[0]=GET`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 54:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[1]=POST`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 55:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[2]=PUT`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 56:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[3]=DELETE`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 57:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[4]=OPTIONS`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 58:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[5]=PATCH`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 59:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedHeaders[0]=*`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.
- **Line 60:** `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowCredentials=true`
  Configuration structure/value line. Its indentation or position contributes to the configuration section above it.

### `config-server/src/main/resources/config/auth-service.properties`

- **Line 1:** `server.port=8180`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 4:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `# JWT Settings`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `# Database Configuration`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 13:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 14:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `# Default Admin Credentials`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 20:** `admin.username=admin`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 21:** `admin.password=Admin@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 22:** `admin.name=Administrator`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 23:** `admin.role=Admin`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/booking-service.properties`

- **Line 1:** `server.port=8182`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 4:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** `# Resolved through Eureka by service id (load-balanced).`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** `arfoms.flight-service.base-url=http://flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 13:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 14:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/checkin-service.properties`

- **Line 1:** `server.port=8193`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 4:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** `# Resolved through Eureka by service id (load-balanced).`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** `arfoms.booking-service.base-url=http://booking-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** `arfoms.flight-service.base-url=http://flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/crew-service.properties`

- **Line 1:** `server.port=8184`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `server.error.include-message=always`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 4:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `# Resolved through Eureka by service id (load-balanced).`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** `arfoms.flight-service.base-url=http://flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/discovery-server.properties`

- **Line 1:** `server.port=8761`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `# A standalone registry does not register with or fetch from itself.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 4:** `eureka.client.register-with-eureka=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `eureka.client.fetch-registry=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `# Faster eviction of dead instances for local development.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** `eureka.server.enable-self-preservation=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `eureka.server.eviction-interval-timer-in-ms=15000`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/flight-service.properties`

- **Line 1:** `server.port=8181`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 4:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `# Single-machine dev setup: register by localhost so discovery keeps working`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 13:** `# even when the host's LAN IP changes (Wi-Fi/Ethernet switch). Using`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** `# prefer-ip-address=true previously caused stale IPs (e.g. 192.168.0.5) to be`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 15:** `# registered, making the gateway's service-to-service calls fail with 500.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 16:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `config-server/src/main/resources/config/loyalty-service.properties`

- **Line 1:** `server.port=8185`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.datasource.username=root`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 4:** `spring.datasource.password=Root@123`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** `spring.jpa.hibernate.ddl-auto=update`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 7:** `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** `spring.jpa.open-in-view=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `# Resolved through Eureka by service id (load-balanced).`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** `arfoms.flight-service.base-url=http://flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `# --- Eureka service discovery ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `eureka.instance.hostname=localhost`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `eureka.instance.prefer-ip-address=false`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

## Discovery Server - `discovery-server`

Eureka service registry. Services register here by name so they can locate one another without hard-coded ports.

### `discovery-server/pom.xml`

- **Line 1:** `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 6:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <relativePath>../pom.xml</relativePath>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 9:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    <artifactId>discovery-server</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 12:** `    <description>Netflix Eureka service registry for ARFOMS microservices</description>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 15:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 16:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 17:** `            <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 18:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 19:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 20:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 21:** `            <artifactId>spring-boot-starter-test</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 22:** `            <scope>test</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 23:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 24:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 25:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 26:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 27:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 28:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 29:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 30:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 31:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 32:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 33:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 34:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `discovery-server/src/main/java/com/genc/arfoms/discovery/DiscoveryServerApplication.java`

- **Line 1:** `package com.genc.arfoms.discovery;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 8:** ` * Netflix Eureka service registry. Every ARFOMS microservice registers here so`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** ` * the gateway and inter-service clients can discover each other by service id`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** ` * instead of relying on hardcoded host:port values.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 12:** `@EnableEurekaServer`
  Enables the Spring Cloud/Spring feature named by this annotation during application startup.
- **Line 13:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 14:** `public class DiscoveryServerApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `        SpringApplication.run(DiscoveryServerApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 19:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `discovery-server/src/main/resources/application.properties`

- **Line 1:** `spring.application.name=discovery-server`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.config.import=optional:configserver:http://localhost:8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

## Flight Service - `flight-service`

Owns flight schedules, fares, airport-distance calculation, and flight seat inventory.

### `flight-service/pom.xml`

- **Line 1:** `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 6:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <relativePath>../pom.xml</relativePath>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 9:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    <artifactId>flight-service</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 14:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 15:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 16:** `            <artifactId>spring-boot-starter-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 17:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 18:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 19:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 20:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 21:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 22:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 23:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 24:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 25:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 26:** `            <artifactId>spring-boot-starter-validation</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 27:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 28:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 29:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 30:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 31:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 32:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 33:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 34:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 35:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 36:** `            <artifactId>spring-boot-starter-data-jpa</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 37:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 38:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 39:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 40:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 41:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 42:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 43:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 44:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 45:** `            <groupId>com.mysql</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 46:** `            <artifactId>mysql-connector-j</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 47:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 48:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 49:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 50:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 51:** `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 52:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 53:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 54:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 55:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 56:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 57:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 58:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 59:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 60:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 61:** `            <artifactId>spring-boot-starter-security</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 62:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 63:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 64:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 65:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 66:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 67:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 68:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 69:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 70:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 71:** `            <artifactId>jjwt-api</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 72:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 73:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 74:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 75:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 76:** `            <artifactId>jjwt-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 77:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 78:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 79:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 80:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 81:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 82:** `            <artifactId>jjwt-jackson</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 83:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 84:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 85:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 86:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 87:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 88:** `            <artifactId>spring-boot-starter-test</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 89:** `            <scope>test</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 90:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 91:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 92:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 93:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 94:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 95:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 96:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 97:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 98:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 99:** `            <artifactId>log4j-slf4j2-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 100:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 101:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 102:** `            <groupId>org.projectlombok</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 103:** `            <artifactId>lombok</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 104:** `            <optional>true</optional>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 105:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 106:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 107:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 108:** `            <artifactId>log4j-core</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 109:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 110:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 111:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 112:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 113:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 114:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 115:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 116:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 117:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 118:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 119:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 120:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 121:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 122:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 123:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/config/JwtRequestFilter.java`

- **Line 1:** `package com.genc.arfoms.flight.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.servlet.FilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.servlet.ServletException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import jakarta.servlet.http.HttpServletRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import jakarta.servlet.http.HttpServletResponse;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.core.authority.SimpleGrantedAuthority;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.core.context.SecurityContextHolder;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.web.filter.OncePerRequestFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `import java.io.IOException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class JwtRequestFilter extends OncePerRequestFilter {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    private JwtUtils jwtUtils;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 25:** `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** `            throws ServletException, IOException {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 29:** `            chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 31:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `        String requestTokenHeader = request.getHeader("Authorization");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 34:** `        if (requestTokenHeader == null \|\| requestTokenHeader.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 35:** `            String tokenParam = request.getParameter("access_token");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 36:** `            if (tokenParam != null && !tokenParam.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 37:** `                requestTokenHeader = "Bearer " + tokenParam;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `        String username = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 42:** `        String jwtToken = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        String role = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 46:** `            jwtToken = requestTokenHeader.substring(7);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 47:** `            try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 48:** `                username = jwtUtils.getUsernameFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `                role = jwtUtils.getRoleFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `            } catch (Exception e) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `                logger.error("JWT token verification failed: " + e.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 53:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 54:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 55:** `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 56:** `            if (jwtUtils.validateToken(jwtToken, username)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 57:** `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 58:** `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 59:** `                        username, null, List.of(authority));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** `                usernamePasswordAuthenticationToken`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 61:** `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 64:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** `        chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 67:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/config/JwtUtils.java`

- **Line 1:** `package com.genc.arfoms.flight.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import io.jsonwebtoken.Claims;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import io.jsonwebtoken.Jwts;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import io.jsonwebtoken.security.Keys;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.beans.factory.annotation.Value;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `import javax.crypto.SecretKey;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public class JwtUtils {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    private String secret;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    @Value("${jwt.expiration:86400000}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    private long expiration;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public String generateToken(String username, String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        java.util.Map<String, Object> claims = new java.util.HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `        claims.put("role", role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 24:** `        return Jwts.builder()`
  Ends the current method and gives this expression/value back to its caller.
- **Line 25:** `                .setClaims(claims)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `                .setSubject(username)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `                .compact();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    public String getUsernameFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `        return getAllClaimsFromToken(token).getSubject();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 35:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    public String getRoleFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 38:** `        return getAllClaimsFromToken(token).get("role", String.class);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 39:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    public boolean validateToken(String token, String username) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 42:** `        final String extractedUsername = getUsernameFromToken(token);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        return (extractedUsername.equals(username));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    private Claims getAllClaimsFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 49:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 50:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/config/SecurityConfig.java`

- **Line 1:** `package com.genc.arfoms.flight.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.context.annotation.Bean;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.context.annotation.Configuration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.http.HttpMethod;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.security.config.annotation.web.builders.HttpSecurity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.config.http.SessionCreationPolicy;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.web.SecurityFilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.web.cors.CorsConfiguration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.web.cors.CorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Configuration`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class SecurityConfig {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    private final JwtRequestFilter jwtRequestFilter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 24:** `        this.jwtRequestFilter = jwtRequestFilter;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 25:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        return httpSecurity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 30:** `                .csrf(CsrfConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `                .authorizeHttpRequests(requests ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `                                .requestMatchers(HttpMethod.GET, "/api/flights", "/api/flights/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `                                .requestMatchers(HttpMethod.POST, "/api/flights/search").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `                                .requestMatchers("/error").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `                                .anyRequest().authenticated()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 38:** `                .sessionManagement(session ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 41:** `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `                .formLogin(FormLoginConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `                .build();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 46:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 47:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 48:** `    public CorsConfigurationSource corsConfigurationSource() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 49:** `        CorsConfiguration config = new CorsConfiguration();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `        config.setAllowedOrigins(List.of(`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `                "http://127.0.0.1:5500", "http://localhost:5500",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 52:** `                "http://127.0.0.1:5600", "http://localhost:5600",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 53:** `                "http://127.0.0.1:8000", "http://localhost:8000",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 54:** `                "http://localhost:8210",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 55:** `                "http://localhost:63342", "http://127.0.0.1:63342"`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 56:** `        ));`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 57:** `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `        config.setAllowedHeaders(List.of("*"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `        config.setAllowCredentials(true);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 61:** `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 62:** `        source.registerCorsConfiguration("/**", config);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `        return source;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 64:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/controller/FlightController.java`

- **Line 1:** `package com.genc.arfoms.flight.controller;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.dto.FareUpdateRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.flight.dto.FlightRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.flight.dto.ScheduleUpdateRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.flight.exception.FlightException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import com.genc.arfoms.flight.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import com.genc.arfoms.flight.model.InternationalAirports;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import com.genc.arfoms.flight.model.IndianAirports;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import com.genc.arfoms.flight.service.FlightService;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.bind.annotation.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 18:** `import java.util.stream.Stream;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `@RestController`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 21:** `@RequestMapping("/api/flights")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 22:** `public class FlightController {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    private final FlightService flightService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 25:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 26:** `    public FlightController(FlightService flightService) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 27:** `        this.flightService = flightService;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 28:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 29:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 30:** `    @GetMapping`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 31:** `    public List<Flight> getAllFlights() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 32:** `        return flightService.getAllFlights();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 33:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 34:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 35:** `    @GetMapping("/id/{flightId}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 36:** `    public Flight getFlightById(@PathVariable Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 37:** `        Flight flight = flightService.getFlight(flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `        if (flight == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 39:** `            throw new FlightException(HttpStatus.NOT_FOUND, "Flight not found for ID " + flightId);`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 40:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 41:** `        return flight;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 42:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 43:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 44:** `    @GetMapping("/{flightNumber}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 45:** `    public Flight getFlightByNumber(@PathVariable String flightNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 46:** `        return flightService.getFlightDetails(flightNumber)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 47:** `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for number " + flightNumber));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    @PostMapping`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 51:** `    public ResponseEntity<Flight> addFlight(@RequestBody FlightRequest request) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 52:** `        Flight flight = request.toEntity();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 53:** `        flightService.addFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `        return ResponseEntity.status(HttpStatus.CREATED).body(getFlightByNumber(flight.getFlightNumber()));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 55:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 56:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 57:** `    @RequestMapping(value = "/{flightIdentifier}/schedule", method = {RequestMethod.PUT, RequestMethod.PATCH})`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 58:** `    public Flight updateSchedule(@PathVariable String flightIdentifier,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 59:** `                                 @RequestBody ScheduleUpdateRequest request) {`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 60:** `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 61:** `        flightService.updateSchedule(flight.getFlightNumber(), request.getDepartureTime(), request.getArrivalTime(), request.getFlightStatus());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `        return getFlightByNumber(flight.getFlightNumber());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 63:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 64:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 65:** `    @RequestMapping(value = {"/{flightIdentifier}/fares", "/{flightIdentifier}/fare-class"}, method = {RequestMethod.PUT, RequestMethod.PATCH})`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 66:** `    public Flight setFares(@PathVariable String flightIdentifier,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 67:** `                           @RequestBody FareUpdateRequest request) {`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 68:** `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 69:** `        flightService.setFares(flight.getFlightNumber(), request.getEconomyFare(), request.getPremiumFare(), request.getFirstFare());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `        return getFlightByNumber(flight.getFlightNumber());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 71:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 72:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 73:** `    @DeleteMapping("/{flightIdentifier}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 74:** `    public ResponseEntity<Void> deleteFlight(@PathVariable String flightIdentifier) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 75:** `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 76:** `        flightService.deleteFlight(flight.getFlightNumber());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 77:** `        return ResponseEntity.noContent().build();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 78:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 79:** `    @PostMapping("/search")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 80:** `    public ResponseEntity<List<Flight>> searchFlights(@RequestBody Map<String, Object> criteria) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 81:** `        String fromLocation = (String) criteria.get("fromLocation");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 82:** `        String toLocation = (String) criteria.get("toLocation");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 83:** `        String departureDate = (String) criteria.get("departureDate");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 84:** `        String flightType = (String) criteria.get("flightType");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 85:** `        Integer passengers = (Integer) criteria.get("passengers");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 86:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 87:** `        List<Flight> flights = flightService.searchAvailableFlights(fromLocation, toLocation, departureDate, flightType, passengers);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 88:** `        return ResponseEntity.ok(flights);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 89:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 90:** `    @GetMapping("/metadata")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 91:** `    public Map<String, Object> getMetadata() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 92:** `        List<IndianAirports.Airport> indianAirports = IndianAirports.AIRPORTS;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 93:** `        List<IndianAirports.Airport> internationalAirports = InternationalAirports.AIRPORTS;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 94:** `        List<IndianAirports.Airport> allAirports = Stream.concat(indianAirports.stream(), internationalAirports.stream())`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 95:** `                .toList();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 96:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 97:** `        return Map.of(`
  Ends the current method and gives this expression/value back to its caller.
- **Line 98:** `                "statuses", FlightStatus.values(),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 99:** `                "airports", allAirports,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 100:** `                "indianAirports", indianAirports,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 101:** `                "internationalAirports", internationalAirports`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 102:** `        );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 103:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 104:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/FareUpdateRequest.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 9:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 10:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 11:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `public class FareUpdateRequest {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** `    private double economyFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 14:** `    private double premiumFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** `    private double businessFare; // supported for frontend compatibility`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** `    private double firstFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    public double getPremiumFare() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 19:** `        return premiumFare != 0.0 ? premiumFare : businessFare;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 20:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 21:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightDistanceResponse.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 4:** ` * Response payload describing the great-circle distance (in miles) between the`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 5:** ` * origin and destination airports of a flight.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 6:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 7:** `public record FlightDistanceResponse(`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** `        Long flightId,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 9:** `        String flightNumber,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 10:** `        String origin,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 11:** `        String destination,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `        double distanceMiles) {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightDTO.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `import java.time.LocalDate;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import java.time.LocalTime;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** ` * Data Transfer Object for {@link com.genc.arfoms.model.Flight}.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** ` * Carries flight details (including the resolved airline name) to clients.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 12:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `public class FlightDTO {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `    private Integer flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** `    private Integer airlineId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** `    private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** `    private String origin;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** `    private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** `    private String flightStatus;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** `    private LocalDate departureDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `    private LocalTime departureTimeOnly;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `    private LocalDate arrivalDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** `    private LocalTime arrivalTimeOnly;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 25:** `    private String airlineName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightRequest.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 11:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 14:** `public class FlightRequest {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `   private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** `   private String flightName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** `   private String origin;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** `   private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** `   private String departureTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** `   private String arrivalTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `   private Double economyFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `   private Double premiumFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** `   private Double businessFare; // supported for frontend compatibility`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 25:** `   private Double firstFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** `   private FlightStatus flightStatus;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** `   private Integer seatCount;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 28:** `   private Integer seatRows;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** `   private Integer seatColumns;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** `   private Integer seatAisleAfter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `   public Flight toEntity() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 33:** `       Flight flight = new Flight();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 34:** `       flight.setFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `       flight.setFlightName(flightName);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `       flight.setOrigin(origin);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `       flight.setDestination(destination);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `       flight.setDepartureTime(departureTime);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `       flight.setArrivalTime(arrivalTime);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `       flight.setEconomyFare(economyFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `       flight.setPremiumFare(premiumFare != null ? premiumFare : businessFare);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 42:** `       flight.setFirstFare(firstFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `       flight.setSeatCount(seatCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `       flight.setSeatRows(seatRows);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `       flight.setSeatColumns(seatColumns);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `       flight.setSeatAisleAfter(seatAisleAfter);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `       flight.setFlightStatus(flightStatus != null ? flightStatus : FlightStatus.SCHEDULED);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `       return flight;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 49:** `   }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 50:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 51:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/ResponseData.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class ResponseData<T> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    private T data;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 5:** `    private boolean success;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 6:** `    private String message;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `    public ResponseData() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `    public ResponseData(T data, boolean success, String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 11:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 12:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 13:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    public T getData() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `        return data;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 18:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public void setData(T data) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    public boolean isSuccess() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 25:** `        return success;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 26:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    public void setSuccess(boolean success) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 30:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `    public String getMessage() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 33:** `        return message;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 34:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 36:** `    public void setMessage(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 37:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/dto/ScheduleUpdateRequest.java`

- **Line 1:** `package com.genc.arfoms.flight.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 10:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 11:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `public class ScheduleUpdateRequest {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 14:** `    private String departureTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** `    private String arrivalTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** `    private FlightStatus flightStatus;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/exception/FlightException.java`

- **Line 1:** `package com.genc.arfoms.flight.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.web.server.ResponseStatusException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 7:** ` * Domain exception for flight-related errors.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 8:** ` * Extends {@link ResponseStatusException} so it is handled by`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** ` * {@link GlobalExceptionHandler} and mapped to an HTTP response.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** `public class FlightException extends ResponseStatusException {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    /** Defaults to HTTP 400 (Bad Request) with the given message. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** `    public FlightException(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 15:** `        super(HttpStatus.BAD_REQUEST, message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    /** Uses the supplied status and message. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 19:** `    public FlightException(HttpStatus status, String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 20:** `        super(status, message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 22:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/exception/GlobalExceptionHandler.java`

- **Line 1:** `package com.genc.arfoms.flight.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.dto.ResponseData;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.web.bind.annotation.ExceptionHandler;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.web.bind.annotation.RestControllerAdvice;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@RestControllerAdvice`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public class GlobalExceptionHandler {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    private final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @ExceptionHandler(NoDataFoundException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    public ResponseEntity<ResponseData<Object>> handleNoDataFoundException(NoDataFoundException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 18:** `        logger.warn("No Data Found", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 20:** `                .status(HttpStatus.NOT_FOUND)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @ExceptionHandler(IllegalArgumentException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 25:** `    public ResponseEntity<ResponseData<Object>> handleIllegalArgumentException(IllegalArgumentException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** `        logger.warn("Invalid Argument", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 28:** `                .status(HttpStatus.BAD_REQUEST)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `    @ExceptionHandler(java.util.NoSuchElementException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 33:** `    public ResponseEntity<ResponseData<Object>> handleNoSuchElementException(java.util.NoSuchElementException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `        logger.warn("Element not found", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 36:** `                .status(HttpStatus.NOT_FOUND)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 40:** `    @ExceptionHandler(IllegalStateException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 41:** `    public ResponseEntity<ResponseData<Object>> handleIllegalStateException(IllegalStateException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 42:** `        logger.warn("Invalid State", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `                .status(HttpStatus.CONFLICT)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 47:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 48:** `    @ExceptionHandler(Exception.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 49:** `    public ResponseEntity<ResponseData<Object>> handleGeneric(Exception e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 50:** `        logger.error("Internal Server Error", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 52:** `                .status(HttpStatus.INTERNAL_SERVER_ERROR)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `                .body(new ResponseData<>(null, false, "Internal Server Error : " + e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 55:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/exception/NoDataFoundException.java`

- **Line 1:** `package com.genc.arfoms.flight.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class NoDataFoundException extends RuntimeException {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    public NoDataFoundException(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 5:** `        super(message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 6:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/FlightServiceApplication.java`

- **Line 1:** `package com.genc.arfoms.flight;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 7:** `public class FlightServiceApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** `        SpringApplication.run(FlightServiceApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 11:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 12:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/Flight.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `@Table(name = "Flights") // Matches the SQL case-sensitivity schema`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `public class Flight {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 16:** `    @Column(name = "flightId") // Aligns with flightId (PK) in schema doc`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    private Long flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    @Column(name = "flightNumber", nullable = false, unique = true, length = 20)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 20:** `    private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @Column(name = "flight_name")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    private String flightName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Column(name = "origin", length = 50)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    private String origin;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    @Column(name = "destination", length = 50)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 29:** `    private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 31:** `    @Column(name = "distance_miles")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 32:** `    private Double distanceMiles;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    @Column(name = "departureTime") // Aligns with departureTime DATETIME schema field`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 35:** `    private String departureTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    @Column(name = "arrivalTime") // Aligns with arrivalTime DATETIME schema field`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 38:** `    private String arrivalTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 39:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 40:** `    // Standardized to 'Double' object wrapper to safely allow handling NULL values`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 41:** `    @Column(name = "fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 42:** `    private Double fare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 43:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 44:** `    @Column(name = "economy_fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 45:** `    private Double economyFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 46:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 47:** `    @Column(name = "premium_fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 48:** `    private Double premiumFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    @Column(name = "first_fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 51:** `    private Double firstFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 52:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 53:** `    @Enumerated(EnumType.STRING)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 54:** `    @Column(name = "flightStatus")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 55:** `    private FlightStatus flightStatus;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 56:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 57:** `    // Cabin and seating layout components`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 58:** `    @Column(name = "seat_count")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 59:** `    private Integer seatCount;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 60:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 61:** `    @Column(name = "seat_rows")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 62:** `    private Integer seatRows;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 63:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 64:** `    @Column(name = "seat_columns")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 65:** `    private Integer seatColumns;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 66:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 67:** `    @Column(name = "seat_aisle_after")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 68:** `    private Integer seatAisleAfter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 69:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 70:** `    // Transient attributes: excluded from DB storage, reserved for external system integrations`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 71:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 72:** `    private Integer airlineId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 73:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 74:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 75:** `    private String airlineName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 76:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 77:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 78:** `    private Integer availableSeats; // Added to resolve BookingServiceImpl calculation requirements`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 79:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 80:** `    // Default Constructor`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 81:** `    public Flight() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 82:** `        this.flightStatus = FlightStatus.SCHEDULED;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 83:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 84:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 85:** `    // Comprehensive Argument Constructor for service initialization tasks`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 86:** `    public Flight(String flightNumber, String origin, String destination,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 87:** `                  String departureTime, String arrivalTime, Double fare, FlightStatus flightStatus) {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 88:** `        this.flightNumber = flightNumber;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 89:** `        this.origin = origin;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 90:** `        this.destination = destination;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 91:** `        this.departureTime = departureTime;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 92:** `        this.arrivalTime = arrivalTime;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 93:** `        this.fare = fare;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 94:** `        this.flightStatus = (flightStatus != null) ? flightStatus : FlightStatus.SCHEDULED;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 95:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 96:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/FlightStatus.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public enum FlightStatus {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    SCHEDULED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 5:** `    BOARDING,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `    DEPARTED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `    ARRIVED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 8:** `    CANCELLED`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 9:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/IndianAirports.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `public final class IndianAirports {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `    public record Airport(String code, String city) {}`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    private IndianAirports() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    public static final List<Airport> AIRPORTS = List.of(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `            new Airport("DEL", "Delhi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 13:** `            new Airport("BOM", "Mumbai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** `            new Airport("BLR", "Bengaluru"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 15:** `            new Airport("MAA", "Chennai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `            new Airport("CCU", "Kolkata"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 17:** `            new Airport("HYD", "Hyderabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `            new Airport("COK", "Kochi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `            new Airport("AMD", "Ahmedabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** `            new Airport("PNQ", "Pune"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `            new Airport("GOI", "Goa (Dabolim)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `            new Airport("GOX", "Goa (Mopa)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `            new Airport("JAI", "Jaipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `            new Airport("LKO", "Lucknow"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 25:** `            new Airport("PAT", "Patna"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `            new Airport("TRV", "Thiruvananthapuram"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `            new Airport("CCJ", "Kozhikode"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `            new Airport("IXC", "Chandigarh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `            new Airport("NAG", "Nagpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            new Airport("VNS", "Varanasi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            new Airport("BBI", "Bhubaneswar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `            new Airport("GAU", "Guwahati"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `            new Airport("IXB", "Bagdogra"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `            new Airport("SXR", "Srinagar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `            new Airport("IXJ", "Jammu"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `            new Airport("ATQ", "Amritsar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `            new Airport("IDR", "Indore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `            new Airport("BHO", "Bhopal"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `            new Airport("RPR", "Raipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `            new Airport("VTZ", "Visakhapatnam"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `            new Airport("VGA", "Vijayawada"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `            new Airport("TIR", "Tirupati"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `            new Airport("CJB", "Coimbatore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `            new Airport("IXM", "Madurai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `            new Airport("TRZ", "Tiruchirappalli"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `            new Airport("MLR", "Mangaluru"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `            new Airport("IXE", "Mangalore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `            new Airport("HBX", "Hubli"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 49:** `            new Airport("IXR", "Ranchi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 50:** `            new Airport("DBR", "Dehradun"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `            new Airport("DED", "Dehradun (Jolly Grant)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            new Airport("IXA", "Agartala"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `            new Airport("IMF", "Imphal"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `            new Airport("DIB", "Dibrugarh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 55:** `            new Airport("JLR", "Jabalpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `            new Airport("UDR", "Udaipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 57:** `            new Airport("JDH", "Jodhpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `            new Airport("STV", "Surat"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `            new Airport("RAJ", "Rajkot"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** `            new Airport("BDQ", "Vadodara"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `            new Airport("KNU", "Kanpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `            new Airport("GWL", "Gwalior"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `            new Airport("AYJ", "Ayodhya"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `            new Airport("PGH", "Prayagraj"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 65:** `            new Airport("IXZ", "Port Blair"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `            new Airport("LEH", "Leh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 67:** `            new Airport("SAG", "Shirdi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 68:** `            new Airport("KLH", "Kolhapur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 69:** `            new Airport("IXU", "Aurangabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `            new Airport("NDC", "Nanded"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 71:** `            new Airport("BEK", "Bareilly"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 72:** `            new Airport("AGR", "Agra"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 73:** `            new Airport("DHM", "Dharamshala"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 74:** `            new Airport("KUU", "Kullu"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 75:** `            new Airport("SLV", "Shimla"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 76:** `            new Airport("PYG", "Pakyong (Gangtok)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 77:** `            new Airport("TEZ", "Tezpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 78:** `            new Airport("JRH", "Jorhat"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 79:** `            new Airport("SHL", "Shillong"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 80:** `            new Airport("DMU", "Dimapur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 81:** `            new Airport("AJL", "Aizawl"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `            new Airport("RUP", "Rupsi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 83:** `            new Airport("HSS", "Hisar")`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 84:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 85:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 86:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/InternationalAirports.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.IndianAirports.Airport;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `public final class InternationalAirports {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    private InternationalAirports() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    public static final List<Airport> AIRPORTS = List.of(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `            new Airport("AMS", "Amsterdam (Schiphol)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 13:** `            new Airport("AUH", "Abu Dhabi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** `            new Airport("BKK", "Bangkok"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 15:** `            new Airport("CDG", "Paris (Charles de Gaulle)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `            new Airport("DOH", "Doha"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 17:** `            new Airport("DXB", "Dubai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `            new Airport("FCO", "Rome (Fiumicino)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `            new Airport("FRA", "Frankfurt"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** `            new Airport("HKG", "Hong Kong"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `            new Airport("HND", "Tokyo (Haneda)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `            new Airport("ICN", "Seoul (Incheon)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `            new Airport("IST", "Istanbul"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `            new Airport("JFK", "New York (JFK)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 25:** `            new Airport("KUL", "Kuala Lumpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `            new Airport("LAX", "Los Angeles"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `            new Airport("LHR", "London Heathrow"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `            new Airport("MAD", "Madrid"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `            new Airport("MEL", "Melbourne"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            new Airport("NRT", "Tokyo (Narita)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            new Airport("ORD", "Chicago (O'Hare)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `            new Airport("SFO", "San Francisco"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `            new Airport("SIN", "Singapore (Changi)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `            new Airport("SYD", "Sydney"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `            new Airport("YVR", "Vancouver"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `            new Airport("YYZ", "Toronto (Pearson)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `            new Airport("ZRH", "Zurich")`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 39:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/SeatInventory.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `@Table(name = "seat_inventory")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 14:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 15:** `public class SeatInventory {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @ManyToOne(fetch = FetchType.LAZY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    @JoinColumn(name = "flight_id", nullable = false, foreignKey = @ForeignKey(name = "FK_seat_inventory_flight_fs"))`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    private Flight flight;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Column(name = "seat_number", length = 10, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    private String seatNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    @Column(name = "column_letter", length = 5, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 29:** `    private String columnLetter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 31:** `    @Column(name = "seat_row", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 32:** `    private Integer seatRow;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    @Enumerated(EnumType.STRING)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 35:** `    @Column(name = "seat_status", length = 20, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 36:** `    private SeatStatus seatStatus = SeatStatus.AVAILABLE;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 37:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 38:** `    @Version`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 39:** `    @Column(name = "version", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 40:** `    private Long version;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `    // Helper Compatibility Layer: Safely extracts flightId for systems expecting flat integers`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 43:** `    public Integer getFlightId() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 44:** `        return (this.flight != null) ? this.flight.getFlightId().intValue() : null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 45:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 46:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 47:** `    // Helper Compatibility Layer: Sets flight reference based on ID without breaking encapsulation`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 48:** `    public void setFlightId(Integer flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 49:** `        if (flightId != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 50:** `            if (this.flight == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 51:** `                this.flight = new Flight();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 52:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 53:** `            this.flight.setFlightId(flightId.longValue());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `        } else {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 55:** `            this.flight = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 56:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 57:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 58:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/model/SeatStatus.java`

- **Line 1:** `package com.genc.arfoms.flight.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public enum SeatStatus {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    AVAILABLE,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 5:** `    BOOKED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `    BLOCKED`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/repository/FlightRepository.java`

- **Line 1:** `package com.genc.arfoms.flight.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 9:** `public interface FlightRepository extends JpaRepository<Flight, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    Optional<Flight> findByFlightNumberIgnoreCase(String flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 12:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/repository/SeatInventoryRepository.java`

- **Line 1:** `package com.genc.arfoms.flight.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.SeatInventory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.flight.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.data.jpa.repository.Query;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.data.repository.query.Param;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 14:** `public interface SeatInventoryRepository extends JpaRepository<SeatInventory, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    List<SeatInventory> findByFlightId(@Param("flightId") Integer flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId ORDER BY s.seatNumber ASC")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 20:** `    List<SeatInventory> findByFlightIdOrderBySeatNumberAsc(@Param("flightId") Integer flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId AND s.seatStatus = :seatStatus")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    List<SeatInventory> findByFlightIdAndSeatStatus(@Param("flightId") Integer flightId, @Param("seatStatus") SeatStatus seatStatus);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId AND s.seatNumber = :seatNumber")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    Optional<SeatInventory> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/service/AirportDistanceService.java`

- **Line 1:** `package com.genc.arfoms.flight.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 8:** ` * Computes the great-circle distance (in statute miles) between two airports`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 9:** ` * using the Haversine formula. Airport coordinates are held in a small,`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 10:** ` * self-contained registry keyed by IATA code so the flight service does not`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** ` * depend on any external data source.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 12:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 13:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 14:** `public class AirportDistanceService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    /** Mean radius of the Earth in miles. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 17:** `    private static final double EARTH_RADIUS_MILES = 3958.7613;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    /** IATA code -> { latitude, longitude } in decimal degrees. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 20:** `    private static final Map<String, double[]> AIRPORTS = Map.ofEntries(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `            // --- India ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 22:** `            Map.entry("DEL", new double[]{28.5562, 77.1000}),  // Delhi`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `            Map.entry("BOM", new double[]{19.0896, 72.8656}),  // Mumbai`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `            Map.entry("BLR", new double[]{13.1986, 77.7066}),  // Bengaluru`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 25:** `            Map.entry("MAA", new double[]{12.9941, 80.1709}),  // Chennai`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `            Map.entry("HYD", new double[]{17.2403, 78.4294}),  // Hyderabad`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `            Map.entry("CCU", new double[]{22.6547, 88.4467}),  // Kolkata`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `            Map.entry("COK", new double[]{10.1520, 76.4019}),  // Kochi`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `            Map.entry("GOI", new double[]{15.3808, 73.8314}),  // Goa`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            Map.entry("PNQ", new double[]{18.5793, 73.9089}),  // Pune`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            Map.entry("AMD", new double[]{23.0772, 72.6347}),  // Ahmedabad`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `            // --- North America ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 33:** `            Map.entry("JFK", new double[]{40.6413, -73.7781}), // New York`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `            Map.entry("LAX", new double[]{33.9416, -118.4085}),// Los Angeles`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `            Map.entry("ORD", new double[]{41.9742, -87.9073}), // Chicago`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `            Map.entry("ATL", new double[]{33.6407, -84.4277}), // Atlanta`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `            Map.entry("DFW", new double[]{32.8998, -97.0403}), // Dallas`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `            Map.entry("SFO", new double[]{37.6213, -122.3790}),// San Francisco`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `            Map.entry("SEA", new double[]{47.4502, -122.3088}),// Seattle`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `            Map.entry("MIA", new double[]{25.7959, -80.2870}), // Miami`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `            Map.entry("BOS", new double[]{42.3656, -71.0096}), // Boston`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `            Map.entry("YYZ", new double[]{43.6777, -79.6248}), // Toronto`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `            // --- Europe ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 44:** `            Map.entry("LHR", new double[]{51.4700, -0.4543}),  // London Heathrow`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `            Map.entry("CDG", new double[]{49.0097, 2.5479}),   // Paris`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `            Map.entry("FRA", new double[]{50.0379, 8.5622}),   // Frankfurt`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `            Map.entry("AMS", new double[]{52.3105, 4.7683}),   // Amsterdam`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `            Map.entry("MAD", new double[]{40.4839, -3.5680}),  // Madrid`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 49:** `            Map.entry("FCO", new double[]{41.8003, 12.2389}),  // Rome`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 50:** `            // --- Middle East / Asia / Oceania ---`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 51:** `            Map.entry("DXB", new double[]{25.2532, 55.3657}),  // Dubai`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            Map.entry("DOH", new double[]{25.2731, 51.6080}),  // Doha`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `            Map.entry("SIN", new double[]{1.3644, 103.9915}),  // Singapore`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `            Map.entry("HKG", new double[]{22.3080, 113.9185}), // Hong Kong`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 55:** `            Map.entry("NRT", new double[]{35.7720, 140.3929}), // Tokyo Narita`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `            Map.entry("ICN", new double[]{37.4602, 126.4407}), // Seoul`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 57:** `            Map.entry("SYD", new double[]{-33.9399, 151.1753}) // Sydney`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 59:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 60:** `    /**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 61:** `     * Returns the distance between two airports in miles, rounded to one decimal.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 62:** `     *`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 63:** `     * @param origin      origin IATA code (case-insensitive)`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 64:** `     * @param destination destination IATA code (case-insensitive)`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 65:** `     */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 66:** `    public double distanceMiles(String origin, String destination) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 67:** `        double[] from = coordinatesFor(origin);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 68:** `        double[] to = coordinatesFor(destination);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 69:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 70:** `        double lat1 = Math.toRadians(from[0]);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 71:** `        double lat2 = Math.toRadians(to[0]);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 72:** `        double deltaLat = Math.toRadians(to[0] - from[0]);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 73:** `        double deltaLon = Math.toRadians(to[1] - from[1]);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 74:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 75:** `        double a = Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 76:** `                + Math.cos(lat1) * Math.cos(lat2)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 77:** `                * Math.sin(deltaLon / 2) * Math.sin(deltaLon / 2);`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 78:** `        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 79:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 80:** `        double miles = EARTH_RADIUS_MILES * c;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 81:** `        return Math.round(miles * 10.0) / 10.0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 82:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 83:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 84:** `    public boolean isKnownAirport(String code) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 85:** `        return code != null && AIRPORTS.containsKey(code.trim().toUpperCase());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 86:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 87:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 88:** `    private double[] coordinatesFor(String code) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 89:** `        if (code == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 90:** `            throw new IllegalArgumentException("Airport code must not be null");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 91:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 92:** `        double[] coords = AIRPORTS.get(code.trim().toUpperCase());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 93:** `        if (coords == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 94:** `            throw new IllegalArgumentException(`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 95:** `                    "Unknown airport code '" + code + "'. Coordinates are not available.");`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 96:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 97:** `        return coords;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 98:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 99:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 100:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `flight-service/src/main/java/com/genc/arfoms/flight/service/FlightService.java`

- **Line 1:** `package com.genc.arfoms.flight.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `public interface FlightService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    List<Flight> getAllFlights();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    Optional<Flight> getFlightDetails(String flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `    Flight getFlight(Long flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    void addFlight(Flight flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    void deleteFlight(String flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    void updateSchedule(String flightNumber, String departureTime, String arrivalTime, FlightStatus flightStatus);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    void setFares(String flightNumber, double economyFare, double premiumFare, double firstFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    void setFareClass(String flightNumber, double fare, String fareClass);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    Flight findByFlightNumberOrId(String identifier);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    List<Flight> searchAvailableFlights(String from, String to, String date, String type, Integer passengers);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/java/com/genc/arfoms/flight/service/FlightServiceImpl.java`

- **Line 1:** `package com.genc.arfoms.flight.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.flight.exception.FlightException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.flight.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.flight.model.IndianAirports;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.flight.model.InternationalAirports;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import com.genc.arfoms.flight.model.SeatInventory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import com.genc.arfoms.flight.model.FlightStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import com.genc.arfoms.flight.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import com.genc.arfoms.flight.repository.FlightRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import com.genc.arfoms.flight.repository.SeatInventoryRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import jakarta.annotation.PostConstruct;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** `import org.springframework.transaction.annotation.Transactional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `import java.time.Duration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 20:** `import java.time.LocalDate;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 21:** `import java.time.LocalDateTime;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 22:** `import java.time.ZoneId;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 23:** `import java.time.format.DateTimeFormatter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 24:** `import java.time.format.DateTimeParseException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 25:** `import java.util.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 26:** `import java.util.stream.Collectors;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 27:** `import java.util.stream.Stream;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 30:** `@Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 31:** `public class FlightServiceImpl implements FlightService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    private static final Logger log = LoggerFactory.getLogger(FlightServiceImpl.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `    private static final DateTimeFormatter INPUT_DATE_TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 35:** `    private static final DateTimeFormatter OUTPUT_DATE_TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 36:** `    private static final double EARTH_RADIUS_MILES = 3958.8;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 37:** `    private static final double DEFAULT_CRUISE_SPEED_MPH = 510.0;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 38:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 39:** `    private static final Set<String> VALID_AIRPORT_CODES = Stream.concat(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 40:** `                    IndianAirports.AIRPORTS.stream(),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `                    InternationalAirports.AIRPORTS.stream()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `            )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 43:** `            .map(IndianAirports.Airport::code)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `            .collect(Collectors.toUnmodifiableSet());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    private static final Map<String, GeoPoint> AIRPORT_COORDINATES = Map.ofEntries(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `            Map.entry("DEL", new GeoPoint(28.5562, 77.1000)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `            Map.entry("BOM", new GeoPoint(19.0896, 72.8656)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 49:** `            Map.entry("BLR", new GeoPoint(13.1986, 77.7066)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 50:** `            Map.entry("MAA", new GeoPoint(12.9941, 80.1709)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `            Map.entry("CCU", new GeoPoint(22.6547, 88.4467)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            Map.entry("HYD", new GeoPoint(17.2403, 78.4294)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `            Map.entry("COK", new GeoPoint(10.1520, 76.4019)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `            Map.entry("AMD", new GeoPoint(23.0772, 72.6347)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 55:** `            Map.entry("PNQ", new GeoPoint(18.5821, 73.9197)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `            Map.entry("GOI", new GeoPoint(15.3808, 73.8314)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 57:** `            Map.entry("GOX", new GeoPoint(15.7368, 73.8606)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `            Map.entry("TRV", new GeoPoint(8.4821, 76.9201)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `            Map.entry("IXC", new GeoPoint(30.6735, 76.7885)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** `            Map.entry("ATQ", new GeoPoint(31.7096, 74.7973)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `            Map.entry("SXR", new GeoPoint(33.9871, 74.7742)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `            Map.entry("IXJ", new GeoPoint(32.6891, 74.8374)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `            Map.entry("BBI", new GeoPoint(20.2444, 85.8178)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `            Map.entry("GAU", new GeoPoint(26.1061, 91.5859)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 65:** `            Map.entry("IXZ", new GeoPoint(11.6412, 92.7297)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `            Map.entry("DXB", new GeoPoint(25.2532, 55.3657)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 67:** `            Map.entry("AUH", new GeoPoint(24.4330, 54.6511)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 68:** `            Map.entry("DOH", new GeoPoint(25.2731, 51.6081)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 69:** `            Map.entry("LHR", new GeoPoint(51.4700, -0.4543)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `            Map.entry("CDG", new GeoPoint(49.0097, 2.5479)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 71:** `            Map.entry("JFK", new GeoPoint(40.6413, -73.7781)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 72:** `            Map.entry("SIN", new GeoPoint(1.3644, 103.9915)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 73:** `            Map.entry("HKG", new GeoPoint(22.3080, 113.9185)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 74:** `            Map.entry("BKK", new GeoPoint(13.6900, 100.7501)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 75:** `            Map.entry("FRA", new GeoPoint(50.0379, 8.5622)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 76:** `            Map.entry("AMS", new GeoPoint(52.3105, 4.7683)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 77:** `            Map.entry("MAD", new GeoPoint(40.4983, -3.5676)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 78:** `            Map.entry("FCO", new GeoPoint(41.8003, 12.2389)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 79:** `            Map.entry("IST", new GeoPoint(41.2753, 28.7519)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 80:** `            Map.entry("ZRH", new GeoPoint(47.4581, 8.5555)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 81:** `            Map.entry("NRT", new GeoPoint(35.7720, 140.3929)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `            Map.entry("HND", new GeoPoint(35.5494, 139.7798)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 83:** `            Map.entry("ICN", new GeoPoint(37.4602, 126.4407)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 84:** `            Map.entry("KUL", new GeoPoint(2.7456, 101.7099)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 85:** `            Map.entry("SYD", new GeoPoint(-33.9399, 151.1753)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 86:** `            Map.entry("MEL", new GeoPoint(-37.6690, 144.8410)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 87:** `            Map.entry("LAX", new GeoPoint(33.9416, -118.4085)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 88:** `            Map.entry("SFO", new GeoPoint(37.6213, -122.3790)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 89:** `            Map.entry("ORD", new GeoPoint(41.9742, -87.9073)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 90:** `            Map.entry("YYZ", new GeoPoint(43.6777, -79.6248)),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 91:** `            Map.entry("YVR", new GeoPoint(49.1967, -123.1815))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 92:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 93:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 94:** `    private final FlightRepository flightRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 95:** `    private final SeatInventoryRepository seatInventoryRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 96:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 97:** `    public FlightServiceImpl(FlightRepository flightRepository, SeatInventoryRepository seatInventoryRepository) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 98:** `        this.flightRepository = flightRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 99:** `        this.seatInventoryRepository = seatInventoryRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 100:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 101:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 102:** `    @PostConstruct`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 103:** `    public void seedSeatInventoryIfRequested() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 104:** `        String seedFlag = System.getProperty("seed.seats");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 105:** `        if (!"true".equalsIgnoreCase(seedFlag)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 106:** `            return; // no-op unless explicitly requested`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 107:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 108:** `        String fidStr = System.getProperty("seed.flightId", "1");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 109:** `        Long flightId;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 110:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 111:** `            flightId = Long.parseLong(fidStr);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 112:** `        } catch (NumberFormatException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 113:** `            log.warn("Invalid seed.flightId '{}', aborting seeding", fidStr);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 114:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 115:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 116:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 117:** `        Optional<Flight> flightOpt = flightRepository.findById(flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 118:** `        if (flightOpt.isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 119:** `            log.warn("No flight found for id {} - cannot seed seats", flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 120:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 121:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 122:** `        Flight flight = flightOpt.get();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 123:** `        int rows = flight.getSeatRows() != null ? flight.getSeatRows() : 0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 124:** `        int cols = flight.getSeatColumns() != null ? flight.getSeatColumns() : 0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 125:** `        if (rows < 1 \|\| cols < 1) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 126:** `            log.warn("Flight {} has invalid seatRows/seatColumns ({} / {}) - skipping seeding", flight.getFlightNumber(), rows, cols);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 127:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 128:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 129:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 130:** `        // check existing inventory`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 131:** `        List<SeatInventory> existing = seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(flight.getFlightId().intValue());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 132:** `        if (!existing.isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 133:** `            log.info("Flight {} already has {} seat inventory rows - skipping seeding", flight.getFlightNumber(), existing.size());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 134:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 135:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 136:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 137:** `        List<SeatInventory> seats = new ArrayList<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 138:** `        for (int r = 0; r < rows; r++) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 139:** `            String rowLabel = rowLetter(r);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 140:** `            for (int c = 1; c <= cols; c++) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 141:** `                SeatInventory seat = new SeatInventory();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 142:** `                seat.setFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 143:** `                seat.setSeatNumber(rowLabel + c);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 144:** `                seat.setColumnLetter(rowLabel);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 145:** `                seat.setSeatRow(r + 1);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 146:** `                seat.setSeatStatus(SeatStatus.AVAILABLE);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 147:** `                seats.add(seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 148:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 149:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 150:** `        seatInventoryRepository.saveAll(seats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 151:** `        log.info("Seeded {} seats for flight {} (id={})", seats.size(), flight.getFlightNumber(), flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 152:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 153:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 154:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 155:** `    @Transactional(readOnly = true)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 156:** `    public List<Flight> getAllFlights() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 157:** `        return flightRepository.findAll();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 158:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 159:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 160:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 161:** `    @Transactional(readOnly = true)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 162:** `    public Optional<Flight> getFlightDetails(String flightNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 163:** `        validateFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 164:** `        return flightRepository.findByFlightNumberIgnoreCase(flightNumber);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 165:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 166:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 167:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 168:** `    @Transactional(readOnly = true)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 169:** `    public Flight getFlight(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 170:** `        if (flightId == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 171:** `            return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 172:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 173:** `        return flightRepository.findById(flightId).orElse(null);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 174:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 175:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 176:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 177:** `    public void addFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 178:** `        validateNewFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 179:** `        String normalizedOrigin = normalizeAirportCode(flight.getOrigin(), "origin");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 180:** `        String normalizedDestination = normalizeAirportCode(flight.getDestination(), "destination");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 181:** `        validateDistinctRoute(normalizedOrigin, normalizedDestination);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 182:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 183:** `        flight.setFlightNumber(flight.getFlightNumber().trim());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 184:** `        flight.setOrigin(normalizedOrigin);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 185:** `        flight.setDestination(normalizedDestination);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 186:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 187:** `        flight.setDepartureTime(normalizeDateTime(flight.getDepartureTime(), "departureTime"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 188:** `        flight.setArrivalTime(normalizeDateTime(flight.getArrivalTime(), "arrivalTime"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 189:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 190:** `        validateNotInPast(flight.getDepartureTime(), "departureTime");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 191:** `        validateScheduleOrder(flight.getDepartureTime(), flight.getArrivalTime());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 192:** `        flight.setDistanceMiles(calculateRouteDistanceMiles(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 193:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 194:** `        if (flight.getFlightStatus() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 195:** `            flight.setFlightStatus(FlightStatus.SCHEDULED);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 196:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 197:** `        if (flight.getEconomyFare() == null \|\| flight.getPremiumFare() == null \|\| flight.getFirstFare() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 198:** `            throw new FlightException("All fare fields are required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 199:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 200:** `        validateFare(flight.getEconomyFare(), "economyFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 201:** `        validateFare(flight.getPremiumFare(), "premiumFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 202:** `        validateFare(flight.getFirstFare(), "firstFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 203:** `        flight.setFare(flight.getEconomyFare());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 204:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 205:** `        flightRepository.findByFlightNumberIgnoreCase(flight.getFlightNumber())`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 206:** `                .ifPresent(existing -> {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 207:** `                    throw new FlightException(HttpStatus.CONFLICT, "Flight with number " + flight.getFlightNumber() + " already exists");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 208:** `                });`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 209:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 210:** `        Flight saved = flightRepository.save(flight);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 211:** `        createSeatInventory(saved);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 212:** `        log.info("Added flight {} ({} -> {})", saved.getFlightNumber(), saved.getOrigin(), saved.getDestination());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 213:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 214:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 215:** `    private void createSeatInventory(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 216:** `        Integer rows = flight.getSeatRows();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 217:** `        Integer cols = flight.getSeatColumns();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 218:** `        if (flight.getFlightId() == null \|\| rows == null \|\| cols == null \|\| rows < 1 \|\| cols < 1) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 219:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 220:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 221:** `        List<SeatInventory> seats = new ArrayList<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 222:** `        for (int r = 0; r < rows; r++) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 223:** `            String rowLabel = rowLetter(r);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 224:** `            for (int c = 1; c <= cols; c++) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 225:** `                SeatInventory seat = new SeatInventory();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 226:** `                seat.setFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 227:** `                seat.setSeatNumber(rowLabel + c);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 228:** `                seat.setColumnLetter(rowLabel);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 229:** `                seat.setSeatRow(r + 1);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 230:** `                seat.setSeatStatus(SeatStatus.AVAILABLE);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 231:** `                seats.add(seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 232:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 233:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 234:** `        seatInventoryRepository.saveAll(seats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 235:** `        log.info("Created {} seat(s) for flight {}", seats.size(), flight.getFlightNumber());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 236:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 237:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 238:** `    private static String rowLetter(int index) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 239:** `        StringBuilder label = new StringBuilder();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 240:** `        int n = index;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 241:** `        do {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 242:** `            label.insert(0, (char) ('A' + (n % 26)));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 243:** `            n = n / 26 - 1;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 244:** `        } while (n >= 0);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 245:** `        return label.toString();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 246:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 247:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 248:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 249:** `    public void deleteFlight(String flightNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 250:** `        validateFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 251:** `        Flight flight = findByFlightNumberOrThrow(flightNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 252:** `        if (flight.getFlightId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 253:** `            List<SeatInventory> seats =`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 254:** `                    seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(flight.getFlightId().intValue());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 255:** `            if (!seats.isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 256:** `                seatInventoryRepository.deleteAll(seats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 257:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 258:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 259:** `        flightRepository.delete(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 260:** `        log.info("Deleted flight {}", flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 261:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 262:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 263:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 264:** `    public void updateSchedule(String flightNumber, String departureTime, String arrivalTime, FlightStatus flightStatus) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 265:** `        validateFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 266:** `        Flight flight = findByFlightNumberOrThrow(flightNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 267:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 268:** `        if (departureTime != null && !departureTime.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 269:** `            flight.setDepartureTime(normalizeDateTime(departureTime, "departureTime"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 270:** `            validateNotInPast(flight.getDepartureTime(), "departureTime");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 271:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 272:** `        if (arrivalTime != null && !arrivalTime.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 273:** `            flight.setArrivalTime(normalizeDateTime(arrivalTime, "arrivalTime"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 274:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 275:** `        validateScheduleOrder(flight.getDepartureTime(), flight.getArrivalTime());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 276:** `        flight.setDistanceMiles(calculateRouteDistanceMiles(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 277:** `        if (flightStatus != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 278:** `            flight.setFlightStatus(flightStatus);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 279:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 280:** `        flightRepository.save(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 281:** `        log.info("Updated schedule for flight {}", flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 282:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 283:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 284:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 285:** `    public void setFares(String flightNumber, double economyFare, double premiumFare, double firstFare) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 286:** `        validateFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 287:** `        validateFare(economyFare, "economyFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 288:** `        validateFare(premiumFare, "premiumFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 289:** `        validateFare(firstFare, "firstFare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 290:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 291:** `        Flight flight = findByFlightNumberOrThrow(flightNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 292:** `        flight.setEconomyFare(economyFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 293:** `        flight.setPremiumFare(premiumFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 294:** `        flight.setFirstFare(firstFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 295:** `        flight.setFare(economyFare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 296:** `        flightRepository.save(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 297:** `        log.info("Updated fares for flight {}", flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 298:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 299:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 300:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 301:** `    public void setFareClass(String flightNumber, double fare, String fareClass) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 302:** `        validateFlightNumber(flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 303:** `        validateFare(fare, "fare");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 304:** `        if (fareClass == null \|\| fareClass.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 305:** `            throw new FlightException("fareClass is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 306:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 307:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 308:** `        Flight flight = findByFlightNumberOrThrow(flightNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 309:** `        flight.setFare(fare);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 310:** `        flightRepository.save(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 311:** `        log.info("Updated fare class profile to {} for flight {}", fareClass, flightNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 312:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 313:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 314:** `    private Flight findByFlightNumberOrThrow(String flightNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 315:** `        return flightRepository.findByFlightNumberIgnoreCase(flightNumber)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 316:** `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for number " + flightNumber));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 317:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 318:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 319:** `    private void validateFlightNumber(String flightNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 320:** `        if (flightNumber == null \|\| flightNumber.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 321:** `            throw new FlightException("flightNumber is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 322:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 323:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 324:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 325:** `    private void validateNewFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 326:** `        if (flight == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 327:** `            throw new FlightException("Flight payload cannot be null");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 328:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 329:** `        validateFlightNumber(flight.getFlightNumber());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 330:** `        if (flight.getOrigin() == null \|\| flight.getOrigin().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 331:** `            throw new FlightException("origin is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 332:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 333:** `        if (flight.getDestination() == null \|\| flight.getDestination().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 334:** `            throw new FlightException("destination is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 335:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 336:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 337:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 338:** `    private String normalizeAirportCode(String airportCode, String field) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 339:** `        if (airportCode == null \|\| airportCode.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 340:** `            throw new FlightException(field + " is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 341:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 342:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 343:** `        String normalizedCode = airportCode.trim().toUpperCase();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 344:** `        if (!VALID_AIRPORT_CODES.contains(normalizedCode)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 345:** `            throw new FlightException(field + " must be a valid Indian or international airport code");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 346:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 347:** `        return normalizedCode;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 348:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 349:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 350:** `    private void validateDistinctRoute(String origin, String destination) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 351:** `        if (origin.equals(destination)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 352:** `            throw new FlightException("origin and destination cannot be the same");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 353:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 354:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 355:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 356:** `    private void validateFare(double fare, String field) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 357:** `        if (Double.isNaN(fare) \|\| Double.isInfinite(fare) \|\| fare < 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 358:** `            throw new FlightException(field + " must be a non-negative number");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 359:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 360:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 361:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 362:** `    private String normalizeDateTime(String raw, String field) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 363:** `        if (raw == null \|\| raw.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 364:** `            throw new FlightException(field + " is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 365:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 366:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 367:** `        String value = raw.trim();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 368:** `        if (value.contains("T")) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 369:** `            try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 370:** `                return LocalDateTime.parse(value, INPUT_DATE_TIME_FORMAT).format(OUTPUT_DATE_TIME_FORMAT);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 371:** `            } catch (DateTimeParseException ignored) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 372:** `                throw new FlightException(field + " must be in yyyy-MM-ddTHH:mm format");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 373:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 374:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 375:** `        if (value.matches("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}")) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 376:** `            return value;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 377:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 378:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 379:** `        throw new FlightException(field + " must be in yyyy-MM-ddTHH:mm format");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 380:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 381:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 382:** `    private void validateScheduleOrder(String departureTime, String arrivalTime) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 383:** `        Optional<LocalDateTime> departure = parseStoredDateTime(departureTime);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 384:** `        Optional<LocalDateTime> arrival = parseStoredDateTime(arrivalTime);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 385:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 386:** `        if (departure.isPresent() && arrival.isPresent() && !arrival.get().isAfter(departure.get())) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 387:** `            throw new FlightException("arrivalTime must be after departureTime");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 388:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 389:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 390:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 391:** `    private void validateNotInPast(String departureTime, String field) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 392:** `        parseStoredDateTime(departureTime).ifPresent(dep -> {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 393:** `            // Added check to allow matching minute operations during rapid local UI execution passes`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 394:** `            if (dep.isBefore(LocalDateTime.now().minusMinutes(1))) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 395:** `                throw new FlightException(field + " cannot be in the past");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 396:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 397:** `        });`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 398:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 399:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 400:** `    private Optional<LocalDateTime> parseStoredDateTime(String value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 401:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 402:** `            return Optional.of(LocalDateTime.parse(value, OUTPUT_DATE_TIME_FORMAT));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 403:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 404:** `            log.debug("Skipping schedule ordering validation for non-standard datetime: {}", value);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 405:** `            return Optional.empty();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 406:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 407:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 408:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 409:** `    private Double calculateRouteDistanceMiles(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 410:** `        GeoPoint originPoint = AIRPORT_COORDINATES.get(flight.getOrigin());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 411:** `        GeoPoint destinationPoint = AIRPORT_COORDINATES.get(flight.getDestination());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 412:** `        if (originPoint != null && destinationPoint != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 413:** `            return roundToOneDecimal(haversineMiles(originPoint, destinationPoint));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 414:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 415:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 416:** `        Optional<LocalDateTime> departure = parseStoredDateTime(flight.getDepartureTime());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 417:** `        Optional<LocalDateTime> arrival = parseStoredDateTime(flight.getArrivalTime());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 418:** `        if (departure.isPresent() && arrival.isPresent() && arrival.get().isAfter(departure.get())) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 419:** `            double durationHours = Duration.between(departure.get(), arrival.get()).toMinutes() / 60.0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 420:** `            return roundToOneDecimal(durationHours * DEFAULT_CRUISE_SPEED_MPH);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 421:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 422:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 423:** `        return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 424:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 425:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 426:** `    private double haversineMiles(GeoPoint from, GeoPoint to) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 427:** `        double lat1 = Math.toRadians(from.latitude());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 428:** `        double lon1 = Math.toRadians(from.longitude());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 429:** `        double lat2 = Math.toRadians(to.latitude());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 430:** `        double lon2 = Math.toRadians(to.longitude());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 431:** `        double dLat = lat2 - lat1;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 432:** `        double dLon = lon2 - lon1;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 433:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 434:** `        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 435:** `                + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLon / 2) * Math.sin(dLon / 2);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 436:** `        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 437:** `        return EARTH_RADIUS_MILES * c;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 438:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 439:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 440:** `    private double roundToOneDecimal(double value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 441:** `        return Math.round(value * 10.0) / 10.0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 442:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 443:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 444:** `    private record GeoPoint(double latitude, double longitude) {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 445:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 446:** `    private static final ZoneId IST_ZONE = ZoneId.of("Asia/Kolkata");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 447:** `    private static final Map<String, String> LOCATION_TO_CODE = buildLocationToCode();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 448:** `    private static final Set<String> INTERNATIONAL_AIRPORT_CODES = buildInternationalAirportCodes();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 449:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 450:** `    private static Map<String, String> buildLocationToCode() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 451:** `        Map<String, String> map = new HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 452:** `        for (IndianAirports.Airport airport : IndianAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 453:** `            String code = airport.code().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 454:** `            map.put(code, code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 455:** `            map.put(airport.city().toUpperCase(Locale.ROOT), code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 456:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 457:** `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 458:** `            String code = airport.code().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 459:** `            map.put(code, code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 460:** `            map.put(airport.city().toUpperCase(Locale.ROOT), code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 461:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 462:** `        return map;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 463:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 464:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 465:** `    private static Set<String> buildInternationalAirportCodes() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 466:** `        Set<String> codes = new HashSet<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 467:** `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 468:** `            codes.add(airport.code().toUpperCase(Locale.ROOT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 469:** `            codes.add(airport.city().toUpperCase(Locale.ROOT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 470:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 471:** `        return codes;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 472:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 473:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 474:** `    private static String canonicalLocation(String location) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 475:** `        if (location == null) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 476:** `        String key = location.trim().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 477:** `        if (key.isEmpty()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 478:** `        return LOCATION_TO_CODE.getOrDefault(key, key);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 479:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 480:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 481:** `    private static boolean matchesLocation(String stored, String queryCanonical) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 482:** `        if (queryCanonical == null) return true;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 483:** `        return queryCanonical.equals(canonicalLocation(stored));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 484:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 485:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 486:** `    private static LocalDate extractDate(String value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 487:** `        if (value == null \|\| value.isBlank()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 488:** `        String datePart = value.trim().replace('T', ' ').split(" ")[0];`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 489:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 490:** `            return LocalDate.parse(datePart);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 491:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 492:** `            return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 493:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 494:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 495:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 496:** `    private static LocalDate parseDate(String value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 497:** `        if (value == null \|\| value.isBlank()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 498:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 499:** `            return LocalDate.parse(value);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 500:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 501:** `            return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 502:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 503:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 504:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 505:** `    private boolean isInternationalLocation(String location) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 506:** `        return location != null && INTERNATIONAL_AIRPORT_CODES.contains(location.trim().toUpperCase(Locale.ROOT));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 507:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 508:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 509:** `    private boolean isInternationalFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 510:** `        return isInternationalLocation(flight.getOrigin()) \|\| isInternationalLocation(flight.getDestination());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 511:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 512:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 513:** `    private static int declaredCapacity(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 514:** `        if (flight.getSeatCount() != null && flight.getSeatCount() > 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 515:** `            return flight.getSeatCount();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 516:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 517:** `        if (flight.getSeatRows() != null && flight.getSeatColumns() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 518:** `            return Math.max(flight.getSeatRows() * flight.getSeatColumns(), 0);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 519:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 520:** `        return 0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 521:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 522:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 523:** `    private void attachAvailableSeats(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 524:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 525:** `            Integer fid = flight.getFlightId() != null ? flight.getFlightId().intValue() : null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 526:** `            if (fid != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 527:** `                int available = seatInventoryRepository.findByFlightIdAndSeatStatus(fid, SeatStatus.AVAILABLE).size();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 528:** `                if (available > 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 529:** `                    flight.setAvailableSeats(available);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 530:** `                    return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 531:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 532:** `                boolean hasInventory = !seatInventoryRepository.findByFlightId(fid).isEmpty();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 533:** `                if (hasInventory) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 534:** `                    flight.setAvailableSeats(0);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 535:** `                    return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 536:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 537:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 538:** `            flight.setAvailableSeats(declaredCapacity(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 539:** `        } catch (Exception ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 540:** `            log.warn("Available-seat lookup failed for flight {} ({})", flight.getFlightNumber(), ex.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 541:** `            flight.setAvailableSeats(declaredCapacity(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 542:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 543:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 544:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 545:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 546:** `    public List<Flight> searchAvailableFlights(String from, String to, String date, String type, Integer passengers) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 547:** `        String fromCanonical = canonicalLocation(from);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 548:** `        String toCanonical = canonicalLocation(to);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 549:** `        LocalDate departureDate = parseDate(date);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 550:** `        LocalDate todayIst = LocalDate.now(IST_ZONE);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 551:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 552:** `        List<Flight> flights = flightRepository.findAll().stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 553:** `                .filter(f -> matchesLocation(f.getOrigin(), fromCanonical))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 554:** `                .filter(f -> matchesLocation(f.getDestination(), toCanonical))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 555:** `                .filter(f -> {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 556:** `                    LocalDate dep = extractDate(f.getDepartureTime());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 557:** `                    if (departureDate != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 558:** `                        return dep != null && dep.equals(departureDate);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 559:** `                    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 560:** `                    return dep == null \|\| !dep.isBefore(todayIst);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 561:** `                })`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 562:** `                .collect(Collectors.toList());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 563:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 564:** `        flights = new ArrayList<>(flights.stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 565:** `                .collect(Collectors.toMap(`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 566:** `                        Flight::getFlightNumber, f -> f,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 567:** `                        (a, b) -> a.getFlightId() <= b.getFlightId() ? a : b,`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 568:** `                        LinkedHashMap::new`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 569:** `                )).values()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 570:** `        );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 571:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 572:** `        if (type != null && !type.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 573:** `            boolean wantInternational = "international".equalsIgnoreCase(type);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 574:** `            flights = flights.stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 575:** `                    .filter(f -> isInternationalFlight(f) == wantInternational)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 576:** `                    .collect(Collectors.toList());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 577:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 578:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 579:** `        flights.forEach(f -> f.setAirlineName(f.getFlightName() != null ? f.getFlightName() : "Unknown"));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 580:** `        flights.forEach(this::attachAvailableSeats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 581:** `        return flights;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 582:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 583:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 584:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 585:** `    public Flight findByFlightNumberOrId(String identifier) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 586:** `        if (identifier == null \|\| identifier.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 587:** `            throw new FlightException("identifier is required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 588:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 589:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 590:** `            Long id = Long.parseLong(identifier.trim());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 591:** `            Flight flight = getFlight(id);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 592:** `            if (flight != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 593:** `                return flight;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 594:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 595:** `        } catch (NumberFormatException ignored) {}`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 596:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 597:** `        return flightRepository.findByFlightNumberIgnoreCase(identifier.trim())`
  Ends the current method and gives this expression/value back to its caller.
- **Line 598:** `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for identifier: " + identifier));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 599:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 600:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `flight-service/src/main/resources/application.properties`

- **Line 1:** `spring.application.name=flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.config.import=optional:configserver:http://localhost:8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `flight-service/src/main/resources/log4j2.properties`

- **Line 1:** `status = warn`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `name = ARFOMSLogConfig`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 4:** `property.logDir = logs`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `property.appName = flight-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `appenders = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `appender.console.type = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `appender.console.name = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** `appender.console.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `appender.rolling.type = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `appender.rolling.name = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `appender.rolling.fileName = ${logDir}/${appName}.log`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 18:** `appender.rolling.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 19:** `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 20:** `appender.rolling.policies.type = Policies`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 21:** `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 22:** `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 23:** `appender.rolling.policies.size.size = 10MB`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 24:** `appender.rolling.strategy.type = DefaultRolloverStrategy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 25:** `appender.rolling.strategy.max = 14`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `rootLogger.level = info`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 28:** `rootLogger.appenderRefs = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 29:** `rootLogger.appenderRef.console.ref = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 30:** `rootLogger.appenderRef.rolling.ref = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

## Booking Service - `booking-service`

Owns bookings, passengers, payments, and seat-selection/payment workflow; calls Flight Service for flight data.

### `booking-service/pom.xml`

- **Line 1:** `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 6:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <relativePath>../pom.xml</relativePath>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 9:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    <artifactId>booking-service</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 14:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 15:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 16:** `            <artifactId>spring-boot-starter-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 17:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 18:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 19:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 20:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 21:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 22:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 23:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 24:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 25:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 26:** `            <artifactId>spring-cloud-starter-openfeign</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 27:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 28:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 29:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 30:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 31:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 32:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 33:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 34:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 35:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 36:** `            <artifactId>spring-boot-starter-validation</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 37:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 38:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 39:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 40:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 41:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 42:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 43:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 44:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 45:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 46:** `            <artifactId>spring-boot-starter-data-jpa</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 47:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 48:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 49:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 50:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 51:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 52:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 53:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 54:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 55:** `            <groupId>com.mysql</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 56:** `            <artifactId>mysql-connector-j</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 57:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 58:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 59:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 60:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 61:** `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 62:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 63:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 64:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 65:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 66:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 67:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 68:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 69:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 70:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 71:** `            <artifactId>spring-boot-starter-test</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 72:** `            <scope>test</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 73:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 74:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 75:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 76:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 77:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 78:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 79:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 80:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 81:** `            <groupId>org.springframework</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 82:** `            <artifactId>spring-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 83:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 84:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 85:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 86:** `            <artifactId>spring-boot-starter-security</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 87:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 88:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 89:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 90:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 91:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 92:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 93:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 94:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 95:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 96:** `            <artifactId>log4j-slf4j2-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 97:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 98:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 99:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 100:** `            <artifactId>log4j-core</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 101:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 102:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 103:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 104:** `            <artifactId>jjwt-api</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 105:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 106:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 107:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 108:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 109:** `            <artifactId>jjwt-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 110:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 111:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 112:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 113:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 114:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 115:** `            <artifactId>jjwt-jackson</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 116:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 117:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 118:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 119:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 120:** `            <groupId>org.projectlombok</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 121:** `            <artifactId>lombok</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 122:** `            <scope>provided</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 123:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 124:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 125:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 126:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 127:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 128:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 129:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 130:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 131:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 132:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 133:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 134:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 135:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 136:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/BookingServiceApplication.java`

- **Line 1:** `package com.genc.arfoms.booking;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.cloud.openfeign.EnableFeignClients;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 8:** `@EnableFeignClients`
  Enables the Spring Cloud/Spring feature named by this annotation during application startup.
- **Line 9:** `public class BookingServiceApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `        SpringApplication.run(BookingServiceApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 13:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 14:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/client/FlightClient.java`

- **Line 1:** `package com.genc.arfoms.booking.client;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.cloud.openfeign.FeignClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.web.bind.annotation.GetMapping;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.web.bind.annotation.PathVariable;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.web.bind.annotation.PostMapping;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.web.bind.annotation.RequestBody;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `@FeignClient(name = "flight-service")`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `public interface FlightClient {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @GetMapping("/api/flights/id/{flightId}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 17:** `    Flight getFlightById(@PathVariable("flightId") Long flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    @PostMapping("/api/flights/search")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 20:** `    List<Flight> searchFlights(@RequestBody Map<String, Object> criteria);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @GetMapping("/api/flights")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 23:** `    List<Flight> getAllFlights();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/config/FeignClientInterceptor.java`

- **Line 1:** `package com.genc.arfoms.booking.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import feign.RequestInterceptor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import feign.RequestTemplate;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.context.annotation.Configuration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.web.context.request.RequestContextHolder;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.web.context.request.ServletRequestAttributes;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Configuration`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `public class FeignClientInterceptor implements RequestInterceptor {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 11:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `    public void apply(RequestTemplate requestTemplate) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 13:** `        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `        if (attributes != null && attributes.getRequest() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 15:** `            String token = attributes.getRequest().getHeader("Authorization");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 16:** `            if (token != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 17:** `                requestTemplate.header("Authorization", token);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 19:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 20:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 21:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/config/JwtRequestFilter.java`

- **Line 1:** `package com.genc.arfoms.booking.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.servlet.FilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.servlet.ServletException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import jakarta.servlet.http.HttpServletRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import jakarta.servlet.http.HttpServletResponse;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.core.authority.SimpleGrantedAuthority;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.core.context.SecurityContextHolder;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.web.filter.OncePerRequestFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `import java.io.IOException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class JwtRequestFilter extends OncePerRequestFilter {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    private JwtUtils jwtUtils;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 25:** `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** `            throws ServletException, IOException {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 29:** `            chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 31:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `        String requestTokenHeader = request.getHeader("Authorization");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 34:** `        if (requestTokenHeader == null \|\| requestTokenHeader.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 35:** `            String tokenParam = request.getParameter("access_token");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 36:** `            if (tokenParam != null && !tokenParam.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 37:** `                requestTokenHeader = "Bearer " + tokenParam;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `        String username = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 42:** `        String jwtToken = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        String role = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 46:** `            jwtToken = requestTokenHeader.substring(7);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 47:** `            try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 48:** `                username = jwtUtils.getUsernameFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `                role = jwtUtils.getRoleFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `            } catch (Exception e) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `                logger.error("JWT token verification failed: " + e.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 53:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 54:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 55:** `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 56:** `            if (jwtUtils.validateToken(jwtToken, username)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 57:** `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 58:** `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 59:** `                        username, null, List.of(authority));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** `                usernamePasswordAuthenticationToken`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 61:** `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 64:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** `        chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 67:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/config/JwtUtils.java`

- **Line 1:** `package com.genc.arfoms.booking.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import io.jsonwebtoken.Claims;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import io.jsonwebtoken.Jwts;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import io.jsonwebtoken.security.Keys;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.beans.factory.annotation.Value;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `import javax.crypto.SecretKey;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public class JwtUtils {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    private String secret;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    @Value("${jwt.expiration:86400000}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    private long expiration;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public String generateToken(String username, String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        java.util.Map<String, Object> claims = new java.util.HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `        claims.put("role", role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 24:** `        return Jwts.builder()`
  Ends the current method and gives this expression/value back to its caller.
- **Line 25:** `                .setClaims(claims)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `                .setSubject(username)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `                .compact();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    public String getUsernameFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `        return getAllClaimsFromToken(token).getSubject();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 35:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    public String getRoleFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 38:** `        return getAllClaimsFromToken(token).get("role", String.class);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 39:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    public boolean validateToken(String token, String username) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 42:** `        final String extractedUsername = getUsernameFromToken(token);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        return (extractedUsername.equals(username));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    private Claims getAllClaimsFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 49:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 50:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/config/SecurityConfig.java`

- **Line 1:** `package com.genc.arfoms.booking.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.context.annotation.Bean;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.context.annotation.Configuration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.http.HttpMethod;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.security.config.annotation.web.builders.HttpSecurity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.config.http.SessionCreationPolicy;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.web.SecurityFilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.web.cors.CorsConfiguration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.web.cors.CorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Configuration`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class SecurityConfig {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    private final JwtRequestFilter jwtRequestFilter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 24:** `        this.jwtRequestFilter = jwtRequestFilter;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 25:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        return httpSecurity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 30:** `                .csrf(CsrfConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `                .authorizeHttpRequests(requests ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `                                .requestMatchers("/flights/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `                                .requestMatchers("/api/bookings/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `                                .requestMatchers("/airline/api/seats/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `                                .requestMatchers("/api/payment/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `                                .requestMatchers("/booking/confirm/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `                                .requestMatchers("/error").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `                                .anyRequest().authenticated()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 41:** `                .sessionManagement(session ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 44:** `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `                .formLogin(FormLoginConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `                .build();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 51:** `    public CorsConfigurationSource corsConfigurationSource() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 52:** `        CorsConfiguration config = new CorsConfiguration();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 53:** `        config.setAllowedOrigins(List.of(`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `                "http://127.0.0.1:5500", "http://localhost:5500",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 55:** `                "http://127.0.0.1:5600", "http://localhost:5600",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 56:** `                "http://127.0.0.1:8000", "http://localhost:8000",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 57:** `                "http://localhost:8210",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 58:** `                "http://localhost:63342", "http://127.0.0.1:63342"`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 59:** `        ));`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 60:** `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `        config.setAllowedHeaders(List.of("*"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `        config.setAllowCredentials(true);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 64:** `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 65:** `        source.registerCorsConfiguration("/**", config);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `        return source;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 67:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 68:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/controller/BookingController.java`

- **Line 1:** `package com.genc.arfoms.booking.controller;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Booking;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.booking.service.BookingService;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.web.bind.annotation.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `@RestController`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 17:** `public class BookingController {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    private static final Logger log = LoggerFactory.getLogger(BookingController.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    private final BookingService bookingService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    public BookingController(BookingService bookingService) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 24:** `        this.bookingService = bookingService;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 25:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    /** List all available flights (browser-friendly GET, e.g. /flights). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 28:** `    @GetMapping("/flights")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 29:** `    public List<Flight> listFlights() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 30:** `        log.info("GET /flights - listing all available flights");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `        return bookingService.searchAvailableFlights(new Booking());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 32:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    /** Search available flights for the given criteria. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 35:** `    @PostMapping("/flights/search")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 36:** `    public List<Flight> searchFlights(@RequestBody Booking searchCriteria) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 37:** `        log.info("POST /flights/search - from={}, to={}, date={}, type={}",`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `                searchCriteria.getFromLocation(), searchCriteria.getToLocation(),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `                searchCriteria.getDepartureDate(), searchCriteria.getFlightType());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `        return bookingService.searchAvailableFlights(searchCriteria);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 41:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 42:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 43:** `    /** Prepare a booking draft (ensures passenger slots) for the passenger-details page. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 44:** `    @PostMapping("/flights/passenger")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 45:** `    public Booking prepareDraft(@RequestBody Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 46:** `        log.info("POST /flights/passenger - preparing booking draft");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `        return bookingService.prepareBookingDraft(booking);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 48:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    /** Fetch passenger details by their unique ID. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 51:** `    @GetMapping("/flights/passenger/{passengerId}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 52:** `    public Passenger getPassenger(@PathVariable Long passengerId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 53:** `        log.info("GET /flights/passenger/{} - fetching passenger details", passengerId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `        return bookingService.getPassengerById(passengerId);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 55:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 56:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 57:** `    /** Check passenger uniqueness constraints on a target flight. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 58:** `    @PostMapping("/flights/passenger/validate")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 59:** `    public Map<String, Object> validatePassengers(@RequestBody Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 60:** `        log.info("POST /flights/passenger/validate - checking passenger uniqueness on flight {}",`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `                booking.getFlightId());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `        bookingService.validateNoDuplicatePassengerOnFlight(booking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `        return Map.of("ok", true);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 64:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 66:** `    /** Persist a new booking and return the saved record (including generated id and PNR). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 67:** `    @PostMapping("/flights/passenger/confirm")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 68:** `    public Booking createBooking(@RequestBody Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 69:** `        log.info("POST /flights/passenger/confirm - creating new booking");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `        return bookingService.createBooking(booking);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 71:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 72:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 73:** `    @PostMapping("/api/bookings")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 74:** `    public ResponseEntity<Booking> createBookingFromPayload(@RequestBody Map<String, Object> payload) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 75:** `        log.info("POST /api/bookings - payload={}", payload);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 76:** `        Booking booking = new Booking();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 77:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 78:** `        Object flightIdVal = payload.get("flightId");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 79:** `        if (flightIdVal != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 80:** `            booking.setFlightId(Long.valueOf(flightIdVal.toString()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 81:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 82:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 83:** `        String seatNumber = (String) payload.get("seatNumber");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 84:** `        booking.setSeat(seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 85:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 86:** `        Object fareVal = payload.get("fareAmount");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 87:** `        if (fareVal != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 88:** `            booking.setFare(Double.parseDouble(fareVal.toString()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 89:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 90:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 91:** `        String passengerName = (String) payload.get("passengerName");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 92:** `        Passenger passenger = new Passenger();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 93:** `        passenger.setFullName(passengerName != null ? passengerName : "Unknown");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 94:** `        passenger.setEmail(passengerName != null ? (passengerName.toLowerCase().replaceAll("\\s+", "") + "@example.com") : "passenger@example.com");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 95:** `        passenger.setPhone("9876543210");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 96:** `        passenger.setAge(30);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 97:** `        passenger.setGender("Male");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 98:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 99:** `        booking.setPassengerDetails(List.of(passenger));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 100:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 101:** `        Booking saved = bookingService.createBooking(booking);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 102:** `        return ResponseEntity.status(HttpStatus.CREATED).body(saved);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 103:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 104:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 105:** `    /** Fetch a single booking by id for the confirmation page. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 106:** `    @GetMapping("/api/bookings/confirmation/{bookingId}")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 107:** `    public Booking getConfirmation(@PathVariable Long bookingId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 108:** `        log.info("GET /api/bookings/confirmation/{} - fetching booking confirmation", bookingId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 109:** `        return bookingService.getBookingById(bookingId);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 110:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 111:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 112:** `    /** Fetch the most recent booking for the manage-booking dashboard. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 113:** `    @GetMapping("/api/bookings/manage")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 114:** `    public Booking manage() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 115:** `        log.info("GET /api/bookings/manage - fetching most recent booking");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 116:** `        return bookingService.getBookingDetails();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 117:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 118:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 119:** `    /** Fetch all past bookings (most recent first) for the manage-booking dashboard. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 120:** `    @GetMapping("/api/bookings")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 121:** `    public List<Booking> allBookings() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 122:** `        log.info("GET /api/bookings - fetching all bookings");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 123:** `        return bookingService.getAllBookings();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 124:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 125:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 126:** `    /** Modify an existing booking (date / seat / etc.). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 127:** `    @PostMapping("/api/bookings/{bookingId}/modify")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 128:** `    public Booking modify(@PathVariable Long bookingId, @RequestBody Booking updatedBooking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 129:** `        log.info("POST /api/bookings/{}/modify - modifying booking", bookingId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 130:** `        return bookingService.modifyBooking(bookingId, updatedBooking);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 131:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 132:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 133:** `    /** Cancel an existing booking. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 134:** `    @PostMapping("/api/bookings/{bookingId}/cancel")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 135:** `    public Booking cancel(@PathVariable Long bookingId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 136:** `        log.info("POST /api/bookings/{}/cancel - cancelling booking", bookingId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 137:** `        return bookingService.cancelBooking(bookingId);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 138:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 139:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 140:** `    /** Exception handler for catching conflicting validation states. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 141:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 142:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/controller/SeatPaymentController.java`

- **Line 1:** `package com.genc.arfoms.booking.controller;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.dto.BookingResult;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.booking.model.Payment;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import com.genc.arfoms.booking.model.SeatInventory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import com.genc.arfoms.booking.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import com.genc.arfoms.booking.client.FlightClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import com.genc.arfoms.booking.service.PassengerService;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import com.genc.arfoms.booking.service.SeatPaymentService;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.bind.annotation.GetMapping;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** `import org.springframework.web.bind.annotation.PostMapping;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import org.springframework.web.bind.annotation.RequestParam;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** `import org.springframework.web.bind.annotation.RestController;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `import java.time.LocalDateTime;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 20:** `import java.time.format.DateTimeFormatter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 21:** `import java.time.format.DateTimeParseException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 22:** `import java.util.HashMap;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 23:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 24:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 25:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 26:** `@RestController`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 27:** `public class SeatPaymentController {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    private static final DateTimeFormatter TIME_FMT = DateTimeFormatter.ofPattern("hh:mm a");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 30:** `    private static final DateTimeFormatter DATE_FMT = DateTimeFormatter.ofPattern("dd MMMM yyyy");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 31:** `    private static final DateTimeFormatter STORED_FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    private static final String KEY_SUCCESS = "success";`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 34:** `    private static final String KEY_MESSAGE = "message";`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 36:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 37:** `    private SeatPaymentService seatPaymentService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 38:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 39:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 40:** `    private FlightClient flightClient;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 43:** `    private PassengerService passengerService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    @GetMapping("/airline/api/seats")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 47:** `    public Map<String, Object> getSeatData(@RequestParam(defaultValue = "1") Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 48:** `        org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(SeatPaymentController.class);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `        `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `        log.info("getSeatData: Fetching seats for flightId={}", flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 51:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 52:** `        List<SeatInventory> allSeats = seatPaymentService.getSeatsByFlight(flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 53:** `        log.info("getSeatData: Found {} total seats", allSeats.size());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 55:** `        List<String> bookedSeats = allSeats.stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 56:** `                .filter(s -> s.getSeatStatus() == SeatStatus.BOOKED)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 57:** `                .map(SeatInventory::getSeatNumber)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `                .toList();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `        log.info("getSeatData: Found {} booked seats: {}", bookedSeats.size(), bookedSeats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 61:** `        Flight flight = flightClient.getFlightById(flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 62:** `        Passenger passenger = passengerService.getPassenger();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 63:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 64:** `        Map<String, Object> response = new HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 65:** `        response.put("flightId", flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `        response.put("allSeats", allSeats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 67:** `        response.put("bookedSeatNumbers", bookedSeats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 68:** `        response.put("flight", flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 69:** `        response.put("passenger", passenger);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 71:** `        if (flight != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 72:** `            response.put("departureTime", formatStored(flight.getDepartureTime(), TIME_FMT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 73:** `            response.put("arrivalTime", formatStored(flight.getArrivalTime(), TIME_FMT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 74:** `            response.put("flightDate", formatStored(flight.getDepartureTime(), DATE_FMT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 75:** `            `
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 76:** `            // Include seat layout configuration from flight`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 77:** `            response.put("seatRows", flight.getSeatRows());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 78:** `            response.put("seatColumns", flight.getSeatColumns());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 79:** `            response.put("seatAisleAfter", flight.getSeatAisleAfter());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 80:** `            response.put("seatCount", flight.getSeatCount());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 81:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 82:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 83:** `        return response;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 84:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 85:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 86:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 87:** `    private static String formatStored(String stored, DateTimeFormatter target) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 88:** `        if (stored == null \|\| stored.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 89:** `            return "-";`
  Ends the current method and gives this expression/value back to its caller.
- **Line 90:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 91:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 92:** `            return LocalDateTime.parse(stored, STORED_FMT).format(target);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 93:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 94:** `            return stored;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 95:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 96:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 97:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 98:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 99:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 100:** `    @GetMapping("/api/payment")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 101:** `    public Payment getBooking(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 102:** `            @RequestParam(required = false) Long flightId,`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 103:** `            @RequestParam(required = false) String seatNumber) {`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 104:** `        return seatPaymentService.buildBooking(flightId, seatNumber);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 105:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 106:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 107:** `    @PostMapping("/booking/confirm")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 108:** `    public ResponseEntity<Map<String, Object>> confirmBooking(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 109:** `            @RequestParam(required = false) Long flightId,`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 110:** `            @RequestParam(required = false) String seatNumber) {`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 111:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 112:** `        BookingResult result = seatPaymentService.confirmBooking(flightId, seatNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 113:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 114:** `        Map<String, Object> response = new HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 115:** `        response.put(KEY_SUCCESS, result.isSuccess());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 116:** `        response.put(KEY_MESSAGE, result.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 117:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 118:** `        if (result.isSuccess()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 119:** `            response.put("bookingId", result.getBookingId());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 120:** `            response.put("seatNumber", result.getSeatNumber());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 121:** `            response.put("totalAmount", result.getTotalAmount());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 122:** `            return ResponseEntity.ok(response);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 123:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 124:** `        return ResponseEntity.badRequest().body(response);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 125:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 126:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 127:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/dto/BookingDTO.java`

- **Line 1:** `package com.genc.arfoms.booking.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `import java.util.ArrayList;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 10:** `public class BookingDTO {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 13:** `    private String flightType;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 14:** `    private String fromLocation;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** `    private String toLocation;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** `    private String departureDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** `    private int passengers;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** `    private String pnr;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** `    private String status;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** `    private String airline;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** `    private String seat;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `    private double fare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `    private String flyDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    private List<PassengerDTO> passengerDetails = new ArrayList<>();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/dto/BookingResult.java`

- **Line 1:** `package com.genc.arfoms.booking.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class BookingResult {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    private final boolean success;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 5:** `    private final String message;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 6:** `    private final Integer bookingId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 7:** `    private final String seatNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 8:** `    private final String totalAmount;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `    public BookingResult(boolean success, String message, Integer bookingId, String seatNumber, String totalAmount) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 11:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 12:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 13:** `        this.bookingId = bookingId;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `        this.seatNumber = seatNumber;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 15:** `        this.totalAmount = totalAmount;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 16:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    public static BookingResult success(Integer bookingId, String seatNumber, String totalAmount) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 19:** `        return new BookingResult(true, "Success", bookingId, seatNumber, totalAmount);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 20:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    public static BookingResult failure(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 23:** `        return new BookingResult(false, message, null, null, null);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 24:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 25:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 26:** `    public boolean isSuccess() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 27:** `        return success;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 28:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 29:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 30:** `    public String getMessage() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 31:** `        return message;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 32:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    public Integer getBookingId() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 35:** `        return bookingId;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 36:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 37:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 38:** `    public String getSeatNumber() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 39:** `        return seatNumber;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 40:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `    public String getTotalAmount() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 43:** `        return totalAmount;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/dto/PassengerDTO.java`

- **Line 1:** `package com.genc.arfoms.booking.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `public class PassengerDTO {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 10:** `    private String fullName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 11:** `    private Integer age;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 12:** `    private String gender;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 13:** `    private String email;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 14:** `    private String phone;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/dto/PassengerFlightInfo.java`

- **Line 1:** `package com.genc.arfoms.booking.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.Builder;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `/**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 11:** ` * Ground-staff lookup result: tells which passenger(s) belong to a booking and`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 12:** ` * which flight they are travelling on. Assembled read-only from the shared`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 13:** ` * {@code bookings}, {@code passenger} and {@code flights} tables.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 14:** ` */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 15:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 16:** `@Builder`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 17:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 18:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 19:** `public class PassengerFlightInfo {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    private Long bookingId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `    private String pnr;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    /** Primary passenger name (first on the booking). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 25:** `    private String passengerName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** `    /** All passenger names on the booking. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 27:** `    private List<String> passengerNames;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    private Long flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** `    private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 31:** `    private String flightName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    private String origin;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 34:** `    private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 35:** `    private String route;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    private String seat;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 38:** `    /** Travel class / fare type from the booking (e.g. ECONOMY, BUSINESS). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 39:** `    private String travelClass;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    /** Current check-in status for ground staff ("Not Checked In" if none yet). */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 42:** `    private String status;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 43:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/dto/ResponseData.java`

- **Line 1:** `package com.genc.arfoms.booking.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class ResponseData<T> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    private T data;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 5:** `    private boolean success;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 6:** `    private String message;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `    public ResponseData() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `    public ResponseData(T data, boolean success, String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 11:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 12:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 13:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    public T getData() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `        return data;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 18:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public void setData(T data) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    public boolean isSuccess() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 25:** `        return success;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 26:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    public void setSuccess(boolean success) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 30:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `    public String getMessage() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 33:** `        return message;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 34:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 36:** `    public void setMessage(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 37:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/exception/GlobalExceptionHandler.java`

- **Line 1:** `package com.genc.arfoms.booking.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.web.bind.annotation.ExceptionHandler;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.web.bind.annotation.RestControllerAdvice;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.web.server.ResponseStatusException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `@RestControllerAdvice`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 14:** `public class GlobalExceptionHandler {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    @ExceptionHandler(ResponseStatusException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    public ResponseEntity<Map<String, Object>> handleResponseStatus(ResponseStatusException ex) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 20:** `        String message = ex.getReason() != null ? ex.getReason() : "Error";`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 21:** `        return ResponseEntity.status(ex.getStatusCode())`
  Ends the current method and gives this expression/value back to its caller.
- **Line 22:** `                .body(Map.of("status", ex.getStatusCode().value(), "message", message));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    // REMOVED IllegalStateException from here`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 26:** `    @ExceptionHandler(IllegalArgumentException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 27:** `    public ResponseEntity<Map<String, Object>> handleIllegalArgument(IllegalArgumentException ex) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 28:** `        String detail = ex.getMessage() != null ? ex.getMessage() : "Invalid input parameters.";`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 29:** `        return ResponseEntity.status(HttpStatus.BAD_REQUEST)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 30:** `                .body(Map.of("status", 400, "message", detail));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    // Kept here for a custom 409 CONFLICT response`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 34:** `    @ExceptionHandler(IllegalStateException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 35:** `    public ResponseEntity<Map<String, Object>> handleIllegalState(IllegalStateException ex) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 36:** `        log.warn("Validation failed: {}", ex.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `        return ResponseEntity.status(HttpStatus.CONFLICT)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 38:** `                .body(Map.of("status", 409, "message", ex.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    @ExceptionHandler(Exception.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 42:** `    public ResponseEntity<Map<String, Object>> handleOther(Exception ex) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 43:** `        log.error("Unhandled exception processed by exception engine", ex);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `        String detail = ex.getMessage() != null ? ex.getMessage() : ex.getClass().getSimpleName();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 45:** `        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 46:** `                .body(Map.of("status", 500, "message", detail));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 48:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/exception/NoDataFoundException.java`

- **Line 1:** `package com.genc.arfoms.booking.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class NoDataFoundException extends RuntimeException {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    public NoDataFoundException(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 5:** `        super(message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 6:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/Booking.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.EqualsAndHashCode;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.ToString;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `import java.util.ArrayList;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `@Table(name = "bookings")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 13:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 14:** `public class Booking {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    @Column(name = "id")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @Column(name = "flight_id", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    private Long flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 25:** `    private Flight flight;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    @Column(name = "flightType")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    private String flightType;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 30:** `    @Column(name = "fromLocation")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 31:** `    private String fromLocation;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    @Column(name = "toLocation")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 34:** `    private String toLocation;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 36:** `    @Column(name = "departureDate")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 37:** `    private String departureDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 38:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 39:** `    @Column(name = "passengers")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 40:** `    private int passengers;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `    @Column(name = "pnr")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 43:** `    private String pnr;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** `    @Column(name = "status")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 46:** `    private String status;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 47:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 48:** `    @Column(name = "airline")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 49:** `    private String airline;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 50:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 51:** `    @Column(name = "seat")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 52:** `    private String seat;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 53:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 54:** `    @Column(name = "fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 55:** `    private double fare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 56:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 57:** `    @Column(name = "flyDate")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 58:** `    private String flyDate;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 59:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 60:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 61:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 62:** `    // Find this inside Booking.java:`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 63:** `    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 64:** `    @ToString.Exclude`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 65:** `    @EqualsAndHashCode.Exclude`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 66:** `    private List<Passenger> passengerDetails = new ArrayList<>();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 67:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 68:** `    // Custom setter kept (Lombok will not override it) to maintain the bidirectional link`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 69:** `    public void setPassengerDetails(List<Passenger> passengerDetails) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 70:** `        List<Passenger> incoming = (passengerDetails == null)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 71:** `                ? new ArrayList<>()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 72:** `                : new ArrayList<>(passengerDetails);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 73:** `        this.passengerDetails.clear();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 74:** `        incoming.forEach(this::addPassengerDetail);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 75:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 76:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 77:** `    public void addPassengerDetail(Passenger passenger) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 78:** `        if (passenger == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 79:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 80:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 81:** `        passenger.setBooking(this);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `        this.passengerDetails.add(passenger);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 83:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 84:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 85:** `    // Helper Compatibility Layer: Safely extracts flightId for systems expecting flat integers`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 86:** `    public Long getFlightId() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 87:** `        if (this.flightId != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 88:** `            return this.flightId;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 89:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 90:** `        return (this.flight != null) ? this.flight.getFlightId() : null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 91:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 92:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 93:** `    // Helper Compatibility Layer: Sets flight reference based on ID without breaking encapsulation`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 94:** `    public void setFlightId(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 95:** `        this.flightId = flightId;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 96:** `        if (flightId != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 97:** `            if (this.flight == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 98:** `                this.flight = new Flight();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 99:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 100:** `            this.flight.setFlightId(flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 101:** `        } else {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 102:** `            this.flight = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 103:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 104:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 105:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 106:** `    public void setFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 107:** `        this.flight = flight;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 108:** `        if (flight != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 109:** `            this.flightId = flight.getFlightId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 110:** `        } else {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 111:** `            this.flightId = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 112:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 113:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 114:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/BookingStatus.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public enum BookingStatus {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    CONFIRMED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 5:** `    CANCELLED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `    NO_SHOW,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `    COMPLETED`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 8:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/Flight.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `public class Flight {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `    private Long flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 9:** `    private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 10:** `    private String flightName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 11:** `    private String origin;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 12:** `    private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 13:** `    private Double distanceMiles;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 14:** `    private String departureTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** `    private String arrivalTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** `    private Double fare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** `    private Double economyFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** `    private Double premiumFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** `    private Double firstFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** `    private FlightStatus flightStatus;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** `    private Integer seatCount;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `    private Integer seatRows;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `    private Integer seatColumns;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** `    private Integer seatAisleAfter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 25:** `    private Integer airlineId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** `    private String airlineName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** `    private Integer availableSeats;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    public Flight() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 30:** `        this.flightStatus = FlightStatus.SCHEDULED;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    public Flight(String flightNumber, String origin, String destination,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `                  String departureTime, String arrivalTime, Double fare, FlightStatus flightStatus) {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 35:** `        this.flightNumber = flightNumber;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 36:** `        this.origin = origin;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 37:** `        this.destination = destination;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `        this.departureTime = departureTime;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 39:** `        this.arrivalTime = arrivalTime;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 40:** `        this.fare = fare;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 41:** `        this.flightStatus = (flightStatus != null) ? flightStatus : FlightStatus.SCHEDULED;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 42:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 43:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/FlightStatus.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public enum FlightStatus {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    SCHEDULED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 5:** `    BOARDING,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `    DEPARTED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `    ARRIVED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 8:** `    CANCELLED`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 9:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/IndianAirports.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `public final class IndianAirports {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `    public record Airport(String code, String city) {}`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    private IndianAirports() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    public static final List<Airport> AIRPORTS = List.of(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `            new Airport("DEL", "Delhi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 13:** `            new Airport("BOM", "Mumbai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** `            new Airport("BLR", "Bengaluru"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 15:** `            new Airport("MAA", "Chennai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `            new Airport("CCU", "Kolkata"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 17:** `            new Airport("HYD", "Hyderabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `            new Airport("COK", "Kochi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `            new Airport("AMD", "Ahmedabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** `            new Airport("PNQ", "Pune"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `            new Airport("GOI", "Goa (Dabolim)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `            new Airport("GOX", "Goa (Mopa)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `            new Airport("JAI", "Jaipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `            new Airport("LKO", "Lucknow"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 25:** `            new Airport("PAT", "Patna"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `            new Airport("TRV", "Thiruvananthapuram"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `            new Airport("CCJ", "Kozhikode"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `            new Airport("IXC", "Chandigarh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `            new Airport("NAG", "Nagpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            new Airport("VNS", "Varanasi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            new Airport("BBI", "Bhubaneswar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `            new Airport("GAU", "Guwahati"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `            new Airport("IXB", "Bagdogra"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `            new Airport("SXR", "Srinagar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `            new Airport("IXJ", "Jammu"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `            new Airport("ATQ", "Amritsar"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `            new Airport("IDR", "Indore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `            new Airport("BHO", "Bhopal"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `            new Airport("RPR", "Raipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 40:** `            new Airport("VTZ", "Visakhapatnam"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `            new Airport("VGA", "Vijayawada"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `            new Airport("TIR", "Tirupati"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `            new Airport("CJB", "Coimbatore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `            new Airport("IXM", "Madurai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `            new Airport("TRZ", "Tiruchirappalli"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `            new Airport("MLR", "Mangaluru"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 47:** `            new Airport("IXE", "Mangalore"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `            new Airport("HBX", "Hubli"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 49:** `            new Airport("IXR", "Ranchi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 50:** `            new Airport("DBR", "Dehradun"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `            new Airport("DED", "Dehradun (Jolly Grant)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            new Airport("IXA", "Agartala"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `            new Airport("IMF", "Imphal"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `            new Airport("DIB", "Dibrugarh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 55:** `            new Airport("JLR", "Jabalpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `            new Airport("UDR", "Udaipur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 57:** `            new Airport("JDH", "Jodhpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 58:** `            new Airport("STV", "Surat"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `            new Airport("RAJ", "Rajkot"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 60:** `            new Airport("BDQ", "Vadodara"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `            new Airport("KNU", "Kanpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `            new Airport("GWL", "Gwalior"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `            new Airport("AYJ", "Ayodhya"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `            new Airport("PGH", "Prayagraj"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 65:** `            new Airport("IXZ", "Port Blair"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `            new Airport("LEH", "Leh"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 67:** `            new Airport("SAG", "Shirdi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 68:** `            new Airport("KLH", "Kolhapur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 69:** `            new Airport("IXU", "Aurangabad"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `            new Airport("NDC", "Nanded"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 71:** `            new Airport("BEK", "Bareilly"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 72:** `            new Airport("AGR", "Agra"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 73:** `            new Airport("DHM", "Dharamshala"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 74:** `            new Airport("KUU", "Kullu"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 75:** `            new Airport("SLV", "Shimla"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 76:** `            new Airport("PYG", "Pakyong (Gangtok)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 77:** `            new Airport("TEZ", "Tezpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 78:** `            new Airport("JRH", "Jorhat"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 79:** `            new Airport("SHL", "Shillong"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 80:** `            new Airport("DMU", "Dimapur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 81:** `            new Airport("AJL", "Aizawl"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `            new Airport("RUP", "Rupsi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 83:** `            new Airport("HSS", "Hisar")`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 84:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 85:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/InternationalAirports.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.IndianAirports.Airport;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `public final class InternationalAirports {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    private InternationalAirports() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    public static final List<Airport> AIRPORTS = List.of(`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `            new Airport("AMS", "Amsterdam (Schiphol)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 13:** `            new Airport("AUH", "Abu Dhabi"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** `            new Airport("BKK", "Bangkok"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 15:** `            new Airport("CDG", "Paris (Charles de Gaulle)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `            new Airport("DOH", "Doha"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 17:** `            new Airport("DXB", "Dubai"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `            new Airport("FCO", "Rome (Fiumicino)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `            new Airport("FRA", "Frankfurt"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** `            new Airport("HKG", "Hong Kong"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `            new Airport("HND", "Tokyo (Haneda)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `            new Airport("ICN", "Seoul (Incheon)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `            new Airport("IST", "Istanbul"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** `            new Airport("JFK", "New York (JFK)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 25:** `            new Airport("KUL", "Kuala Lumpur"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `            new Airport("LAX", "Los Angeles"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `            new Airport("LHR", "London Heathrow"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `            new Airport("MAD", "Madrid"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `            new Airport("MEL", "Melbourne"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `            new Airport("NRT", "Tokyo (Narita)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            new Airport("ORD", "Chicago (O'Hare)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `            new Airport("SFO", "San Francisco"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `            new Airport("SIN", "Singapore (Changi)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `            new Airport("SYD", "Sydney"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `            new Airport("YVR", "Vancouver"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `            new Airport("YYZ", "Toronto (Pearson)"),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `            new Airport("ZRH", "Zurich")`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `    );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 39:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/Passenger.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.fasterxml.jackson.annotation.JsonIgnore;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Data;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.EqualsAndHashCode;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.ToString;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `@Table(name = "passenger")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `@Data`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `public class Passenger {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 16:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    private String fullName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** `    private Integer age;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** `    private String gender;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** `    private String email;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** `    private String phone;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 25:** `    @JoinColumn(name = "booking_id")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    @JsonIgnore`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 27:** `    @ToString.Exclude`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 28:** `    @EqualsAndHashCode.Exclude`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 29:** `    private Booking booking;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 31:** `    /** Transient attribute reserved for mileage accumulation inside the booking system. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 32:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 33:** `    private Double distanceMiles = 0.0;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 34:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 35:** `    /** Convenience alias used by the seat/payment module. */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 36:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 37:** `    public String getName() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 38:** `        return fullName;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 39:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/Payment.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `@Table(name = "payment")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 12:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 14:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 15:** `public class Payment {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 16:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    @Column(name = "booking_id")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    private Integer bookingId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @Column(name = "base_fare")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    private String baseFare;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `    @Column(name = "seat_charges")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 24:** `    private String seatCharges;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 25:** `    @Column(name = "taxes")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    private String taxes;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** `    @Column(name = "total_amount")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    private String totalAmount;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** `    @Column(name = "savings")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 30:** `    private String savings;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 31:** `    @Column(name = "flight_number")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 32:** `    private String flightNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 33:** `    @Column(name = "source")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 34:** `    private String source;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 35:** `    @Column(name = "destination")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 36:** `    private String destination;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 37:** `    @Column(name = "departure_time")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 38:** `    private String departureTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 39:** `    @Column(name = "arrival_time")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 40:** `    private String arrivalTime;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 41:** `    @Column(name = "passenger_name")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 42:** `    private String passengerName;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 43:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 44:** `    @Column(name = "flight_id", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 45:** `    private Integer flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 46:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 47:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 48:** `    private Flight flight;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    @Column(name = "seat_number", length = 10)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 51:** `    private String seatNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 52:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 53:** `    public void setFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 54:** `        this.flight = flight;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 55:** `        if (flight != null && flight.getFlightId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 56:** `            this.flightId = flight.getFlightId().intValue();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 57:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 58:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 59:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/SeatInventory.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import lombok.AllArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import lombok.Getter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import lombok.NoArgsConstructor;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import lombok.Setter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `@Table(name = "seat_inventory")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `@Getter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 13:** `@Setter`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 14:** `@NoArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 15:** `@AllArgsConstructor`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 16:** `public class SeatInventory {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 20:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @Column(name = "flight_id", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    private Integer flightId;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Transient`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 26:** `    private Flight flight;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    @Column(name = "seat_number", length = 10, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 29:** `    private String seatNumber;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 31:** `    @Column(name = "column_letter", length = 5, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 32:** `    private String columnLetter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    @Column(name = "seat_row", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 35:** `    private Integer seatRow;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    @Enumerated(EnumType.STRING)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 38:** `    @Column(name = "seat_status", length = 20, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 39:** `    private SeatStatus seatStatus = SeatStatus.AVAILABLE;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    @Version`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 42:** `    @Column(name = "version", nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 43:** `    private Long version;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** `    public void setFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 46:** `        this.flight = flight;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 47:** `        if (flight != null && flight.getFlightId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 48:** `            this.flightId = flight.getFlightId().intValue();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 50:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 51:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/model/SeatStatus.java`

- **Line 1:** `package com.genc.arfoms.booking.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public enum SeatStatus {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    AVAILABLE,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 5:** `    BOOKED,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 6:** `    BLOCKED`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/repository/BookingRepository.java`

- **Line 1:** `package com.genc.arfoms.booking.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Booking;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `public interface BookingRepository extends JpaRepository<Booking, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    Optional<Booking> findTopByOrderByIdDesc();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `    List<Booking> findAllByOrderByIdDesc();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    Optional<Booking> findByPnr(String pnr);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/repository/PassengerRepository.java`

- **Line 1:** `package com.genc.arfoms.booking.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.data.jpa.repository.Query;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.data.repository.query.Param;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 13:** `public interface PassengerRepository extends JpaRepository<Passenger, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `    List<Passenger> findByEmailIgnoreCase(String email);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    @Query("SELECT p FROM Passenger p WHERE p.booking.flightId = :flightId AND " +`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `           "(p.id = :passengerId OR (p.email IS NOT NULL AND LOWER(p.email) = LOWER(:email)))")`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 19:** `    List<Passenger> findPassengerBookingsOnFlight(@Param("flightId") Long flightId,`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 20:** `                                                    @Param("passengerId") Long passengerId,`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `                                                    @Param("email") String email);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/repository/PaymentRepository.java`

- **Line 1:** `package com.genc.arfoms.booking.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Payment;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.data.jpa.repository.Query;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.data.repository.query.Param;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public interface PaymentRepository extends JpaRepository<Payment, Integer> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Query("SELECT p FROM Payment p WHERE p.flightId = :flightId AND p.seatNumber = :seatNumber")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    Optional<Payment> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 16:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/repository/SeatInventoryRepository.java`

- **Line 1:** `package com.genc.arfoms.booking.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.SeatInventory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.data.jpa.repository.Query;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.data.repository.query.Param;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 14:** `public interface SeatInventoryRepository extends JpaRepository<SeatInventory, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    List<SeatInventory> findByFlightId(@Param("flightId") Integer flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId ORDER BY s.seatNumber ASC")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 20:** `    List<SeatInventory> findByFlightIdOrderBySeatNumberAsc(@Param("flightId") Integer flightId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId AND s.seatStatus = :seatStatus")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    List<SeatInventory> findByFlightIdAndSeatStatus(@Param("flightId") Integer flightId, @Param("seatStatus") SeatStatus seatStatus);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId AND s.seatNumber = :seatNumber")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 26:** `    Optional<SeatInventory> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/service/BookingService.java`

- **Line 1:** `package com.genc.arfoms.booking.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Booking;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `public interface BookingService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    List<Flight> searchAvailableFlights(Booking searchCriteria);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    Booking prepareBookingDraft(Booking booking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    Booking createBooking(Booking booking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    /**`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 19:** `     * Verifies that none of the booking's passengers already hold an active seat`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 20:** `     * on the same flight. Throws IllegalStateException (with a user-facing message)`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 21:** `     * when a duplicate is found. Used to validate early on the passenger page.`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 22:** `     */`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 23:** `    void validateNoDuplicatePassengerOnFlight(Booking booking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    Booking selectSeat(Long bookingId, String seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    Booking modifyBooking(Long bookingId, Booking updatedBooking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `    Booking cancelBooking(Long bookingId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 31:** `    Booking getBookingDetails();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    Booking getBookingById(Long bookingId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 35:** `    List<Booking> getAllBookings();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    Passenger getPassengerById(Long passengerId);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/service/BookingServiceImpl.java`

- **Line 1:** `package com.genc.arfoms.booking.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.repository.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.booking.client.FlightClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.booking.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.transaction.annotation.Transactional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `import java.time.LocalDate;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import java.time.ZoneId;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import java.time.format.DateTimeParseException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** `import java.util.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import java.util.stream.Collectors;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class BookingServiceImpl implements BookingService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** `    private static final Logger log = LoggerFactory.getLogger(BookingServiceImpl.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    private static final String BOOKING_NOT_FOUND = "Booking not found for id: ";`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** `    private static final int MAX_PASSENGERS = 9;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** `    private static final ZoneId IST_ZONE = ZoneId.of("Asia/Kolkata");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 25:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 26:** `    private static final Set<String> INTERNATIONAL_AIRPORT_CODES = buildInternationalAirportCodes();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    private final BookingRepository bookingRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** `    private final FlightClient flightClient;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** `    private final SeatInventoryRepository seatInventoryRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 31:** `    private final PassengerRepository passengerRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 32:** `    private final MockPaymentService mockPaymentService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    public BookingServiceImpl(BookingRepository bookingRepository, FlightClient flightClient,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 35:** `                              SeatInventoryRepository seatInventoryRepository,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 36:** `                              PassengerRepository passengerRepository,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 37:** `                              MockPaymentService mockPaymentService) {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 38:** `        this.bookingRepository = bookingRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 39:** `        this.flightClient = flightClient;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 40:** `        this.seatInventoryRepository = seatInventoryRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 41:** `        this.passengerRepository = passengerRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 42:** `        this.mockPaymentService = mockPaymentService;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 44:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 45:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 46:** `    public List<Flight> searchAvailableFlights(Booking searchCriteria) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `        String fromCanonical = canonicalLocation(searchCriteria.getFromLocation());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `        String toCanonical = canonicalLocation(searchCriteria.getToLocation());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `        LocalDate departureDate = parseDate(searchCriteria.getDepartureDate());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `        LocalDate todayIst = LocalDate.now(IST_ZONE);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 51:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 52:** `        List<Flight> flights = flightClient.getAllFlights().stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 53:** `                .filter(f -> matchesLocation(f.getOrigin(), fromCanonical))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `                .filter(f -> matchesLocation(f.getDestination(), toCanonical))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 55:** `                .filter(f -> {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `                    LocalDate dep = extractDate(f.getDepartureTime());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 57:** `                    if (departureDate != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 58:** `                        return dep != null && dep.equals(departureDate);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 59:** `                    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 60:** `                    return dep == null \|\| !dep.isBefore(todayIst);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 61:** `                })`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 62:** `                .collect(Collectors.toList());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 64:** `        flights = new ArrayList<>(flights.stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 65:** `                .collect(Collectors.toMap(`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 66:** `                        Flight::getFlightNumber, f -> f,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 67:** `                        (a, b) -> a.getFlightId() <= b.getFlightId() ? a : b,`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 68:** `                        LinkedHashMap::new`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 69:** `                )).values()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 70:** `        );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 71:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 72:** `        String flightType = searchCriteria.getFlightType();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 73:** `        if (flightType != null && !flightType.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 74:** `            boolean wantInternational = "international".equalsIgnoreCase(flightType);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 75:** `            flights = flights.stream()`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 76:** `                    .filter(f -> isInternationalFlight(f) == wantInternational)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 77:** `                    .collect(Collectors.toList());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 78:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 79:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 80:** `        Map<Integer, String> airlineMap = Collections.emptyMap();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 81:** `        final Map<Integer, String> resolvedAirlineMap = airlineMap;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 82:** `        flights.forEach(f -> f.setAirlineName(resolveAirlineName(f, resolvedAirlineMap)));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 83:** `        flights.forEach(this::attachAvailableSeats);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 84:** `        return flights;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 85:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 86:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 87:** `    private void attachAvailableSeats(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 88:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 89:** `            Integer fid = flight.getFlightId() != null ? flight.getFlightId().intValue() : null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 90:** `            if (fid != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 91:** `                int available = seatInventoryRepository.findByFlightIdAndSeatStatus(fid, SeatStatus.AVAILABLE).size();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 92:** `                if (available > 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 93:** `                    flight.setAvailableSeats(available);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 94:** `                    return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 95:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 96:** `                boolean hasInventory = !seatInventoryRepository.findByFlightId(fid).isEmpty();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 97:** `                if (hasInventory) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 98:** `                    flight.setAvailableSeats(0);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 99:** `                    return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 100:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 101:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 102:** `            flight.setAvailableSeats(declaredCapacity(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 103:** `        } catch (Exception ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 104:** `            log.warn("Available-seat lookup failed for flight {} ({})", flight.getFlightNumber(), ex.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 105:** `            flight.setAvailableSeats(declaredCapacity(flight));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 106:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 107:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 108:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 109:** `    private static int declaredCapacity(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 110:** `        if (flight.getSeatCount() != null && flight.getSeatCount() > 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 111:** `            return flight.getSeatCount();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 112:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 113:** `        if (flight.getSeatRows() != null && flight.getSeatColumns() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 114:** `            return Math.max(flight.getSeatRows() * flight.getSeatColumns(), 0);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 115:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 116:** `        return 0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 117:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 118:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 119:** `    private static String resolveAirlineName(Flight flight, Map<Integer, String> airlineMap) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 120:** `        if (flight.getAirlineId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 121:** `            String mapped = airlineMap.get(flight.getAirlineId());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 122:** `            if (mapped != null && !mapped.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 123:** `                return mapped;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 124:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 125:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 126:** `        if (flight.getFlightName() != null && !flight.getFlightName().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 127:** `            return flight.getFlightName();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 128:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 129:** `        return "Unknown";`
  Ends the current method and gives this expression/value back to its caller.
- **Line 130:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 131:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 132:** `    private static final Map<String, String> LOCATION_TO_CODE = buildLocationToCode();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 133:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 134:** `    private static Set<String> buildInternationalAirportCodes() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 135:** `        Set<String> codes = new HashSet<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 136:** `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 137:** `            codes.add(airport.code().toUpperCase(Locale.ROOT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 138:** `            codes.add(airport.city().toUpperCase(Locale.ROOT));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 139:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 140:** `        return codes;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 141:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 142:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 143:** `    private static Map<String, String> buildLocationToCode() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 144:** `        Map<String, String> map = new HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 145:** `        // Add domestic airports`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 146:** `        for (IndianAirports.Airport airport : IndianAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 147:** `            String code = airport.code().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 148:** `            map.put(code, code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 149:** `            map.put(airport.city().toUpperCase(Locale.ROOT), code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 150:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 151:** `        // Add international airports`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 152:** `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 153:** `            String code = airport.code().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 154:** `            map.put(code, code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 155:** `            map.put(airport.city().toUpperCase(Locale.ROOT), code);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 156:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 157:** `        return map;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 158:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 159:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 160:** `    private static String canonicalLocation(String location) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 161:** `        if (location == null) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 162:** `        String key = location.trim().toUpperCase(Locale.ROOT);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 163:** `        if (key.isEmpty()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 164:** `        return LOCATION_TO_CODE.getOrDefault(key, key);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 165:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 166:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 167:** `    private static boolean matchesLocation(String stored, String queryCanonical) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 168:** `        if (queryCanonical == null) return true;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 169:** `        return queryCanonical.equals(canonicalLocation(stored));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 170:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 171:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 172:** `    private static LocalDate extractDate(String value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 173:** `        if (value == null \|\| value.isBlank()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 174:** `        String datePart = value.trim().replace('T', ' ').split(" ")[0];`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 175:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 176:** `            return LocalDate.parse(datePart);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 177:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 178:** `            return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 179:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 180:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 181:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 182:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 183:** `    public Booking prepareBookingDraft(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 184:** `        Booking bookingDraft = booking == null ? new Booking() : booking;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 185:** `        int passengerCount = clampPassengers(bookingDraft.getPassengers());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 186:** `        bookingDraft.setPassengers(passengerCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 187:** `        ensurePassengerSlots(bookingDraft, passengerCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 188:** `        return bookingDraft;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 189:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 190:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 191:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 192:** `    @Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 193:** `    public Booking createBooking(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 194:** `        Booking bookingToSave = booking == null ? new Booking() : booking;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 195:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 196:** `        Flight resolvedFlight = resolveFlightReference(bookingToSave);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 197:** `        bookingToSave.setFlight(resolvedFlight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 198:** `        bookingToSave.setFromLocation(resolvedFlight.getOrigin());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 199:** `        bookingToSave.setToLocation(resolvedFlight.getDestination());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 200:** `        bookingToSave.setAirline(resolvedFlight.getAirlineName());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 201:** `        bookingToSave.setFlightType(isInternationalFlight(resolvedFlight) ? "international" : "domestic");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 202:** `        if (resolvedFlight.getDepartureTime() != null && !resolvedFlight.getDepartureTime().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 203:** `            String depDate = resolvedFlight.getDepartureTime().trim().split(" ")[0].split("T")[0];`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 204:** `            bookingToSave.setDepartureDate(depDate);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 205:** `            bookingToSave.setFlyDate(depDate);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 206:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 207:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 208:** `        int passengerCount = clampPassengers(bookingToSave.getPassengers());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 209:** `        bookingToSave.setPassengers(passengerCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 210:** `        ensurePassengerSlots(bookingToSave, passengerCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 211:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 212:** `        // FIXED: Passengers are mapped without calling immediate early repository updates`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 213:** `        bookingToSave.setPassengerDetails(resolvePassengers(bookingToSave.getPassengerDetails()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 214:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 215:** `        enforceOnePassengerPerFlight(bookingToSave);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 216:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 217:** `        if (bookingToSave.getFlightType() == null \|\| bookingToSave.getFlightType().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 218:** `            bookingToSave.setFlightType("domestic");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 219:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 220:** `        MockPaymentService.MockPaymentResult paymentResult = mockPaymentService.processBookingPayment(bookingToSave);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 221:** `        bookingToSave.setPnr(paymentResult.pnr());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 222:** `        bookingToSave.setStatus(paymentResult.bookingStatus());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 223:** `        if (bookingToSave.getSeat() == null \|\| bookingToSave.getSeat().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 224:** `            bookingToSave.setSeat("12B");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 225:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 226:** `        if (bookingToSave.getPassengers() <= 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 227:** `            bookingToSave.setPassengers(1);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 228:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 229:** `        if (bookingToSave.getDepartureDate() != null && !bookingToSave.getDepartureDate().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 230:** `            bookingToSave.setFlyDate(bookingToSave.getDepartureDate());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 231:** `        } else if (bookingToSave.getFlyDate() == null \|\| bookingToSave.getFlyDate().isBlank()) {`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 232:** `            bookingToSave.setFlyDate(LocalDate.now().plusDays(7).toString());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 233:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 234:** `        if (bookingToSave.getFare() <= 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 235:** `            bookingToSave.setFare(calculateFare(bookingToSave));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 236:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 237:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 238:** `        List<SeatInventory> seatsToMark = new ArrayList<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 239:** `        if (bookingToSave.getSeat() != null && !bookingToSave.getSeat().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 240:** `            String[] parts = bookingToSave.getSeat().split(",");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 241:** `            for (String p : parts) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 242:** `                String sNum = p == null ? null : p.trim();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 243:** `                if (sNum == null \|\| sNum.isBlank()) continue;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 244:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 245:** `                Object fIdRaw = bookingToSave.getFlightId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 246:** `                Integer flightIdInt = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 247:** `                if (fIdRaw != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 248:** `                    if (fIdRaw instanceof Number) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 249:** `                        flightIdInt = ((Number) fIdRaw).intValue();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 250:** `                    } else {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 251:** `                        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 252:** `                            flightIdInt = Integer.valueOf(fIdRaw.toString());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 253:** `                        } catch (NumberFormatException e) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 254:** `                            flightIdInt = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 255:** `                        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 256:** `                    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 257:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 258:** `                SeatInventory si = findSeat(flightIdInt, sNum);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 259:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 260:** `                if (si != null && si.getSeatStatus() == SeatStatus.BOOKED) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 261:** `                    throw new IllegalStateException("Seat " + sNum + " is already booked. Please choose another seat.");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 262:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 263:** `                if (si != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 264:** `                    log.info("Adding seat to mark as booked: flightId={}, seatNumber={}, currentStatus={}", flightIdInt, sNum, si.getSeatStatus());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 265:** `                    seatsToMark.add(si);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 266:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 267:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 268:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 269:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 270:** `        // Setup bidirectional reference links explicitly right before execution save`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 271:** `        if (bookingToSave.getPassengerDetails() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 272:** `            bookingToSave.getPassengerDetails().forEach(p -> p.setBooking(bookingToSave));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 273:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 274:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 275:** `        Booking saved = bookingRepository.save(bookingToSave);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 276:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 277:** `        log.info("Marking {} seats as booked", seatsToMark.size());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 278:** `        for (SeatInventory si : seatsToMark) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 279:** `            si.setSeatStatus(SeatStatus.BOOKED);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 280:** `            SeatInventory updated = seatInventoryRepository.save(si);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 281:** `            log.info("Seat marked as booked: seatNumber={}, newStatus={}", updated.getSeatNumber(), updated.getSeatStatus());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 282:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 283:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 284:** `        awardDistanceMiles(saved);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 285:** `        return saved;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 286:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 287:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 288:** `    private Flight resolveFlightReference(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 289:** `        Long flightId = booking.getFlightId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 290:** `        if (flightId == null && booking.getFlight() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 291:** `            flightId = booking.getFlight().getFlightId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 292:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 293:** `        if (flightId == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 294:** `            throw new IllegalArgumentException("Flight id is required for booking creation.");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 295:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 296:** `        final Long resolvedFlightId = flightId;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 297:** `        Flight flight = flightClient.getFlightById(resolvedFlightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 298:** `        if (flight == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 299:** `            throw new IllegalArgumentException("Flight not found for id: " + resolvedFlightId);`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 300:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 301:** `        booking.setFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 302:** `        return flight;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 303:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 304:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 305:** `    // FIXED: Cleaned up logic to eliminate early .save() calls inside loops`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 306:** `    private List<Passenger> resolvePassengers(List<Passenger> incoming) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 307:** `        List<Passenger> resolved = new ArrayList<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 308:** `        if (incoming == null) return resolved;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 309:** `        for (Passenger p : incoming) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 310:** `            if (p == null) continue;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 311:** `            Passenger existing = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 312:** `            if (p.getId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 313:** `                existing = passengerRepository.findById(p.getId()).orElse(null);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 314:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 315:** `            if (existing == null && p.getEmail() != null && !p.getEmail().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 316:** `                List<Passenger> matches = passengerRepository.findByEmailIgnoreCase(p.getEmail().trim());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 317:** `                existing = matches.isEmpty() ? null : matches.get(0);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 318:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 319:** `            if (existing != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 320:** `                if (p.getFullName() != null && !p.getFullName().isBlank()) existing.setFullName(p.getFullName());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 321:** `                if (p.getAge() != null) existing.setAge(p.getAge());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 322:** `                if (p.getGender() != null && !p.getGender().isBlank()) existing.setGender(p.getGender());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 323:** `                if (p.getEmail() != null && !p.getEmail().isBlank()) existing.setEmail(p.getEmail());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 324:** `                if (p.getPhone() != null && !p.getPhone().isBlank()) existing.setPhone(p.getPhone());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 325:** `                if (existing.getDistanceMiles() == null) existing.setDistanceMiles(0.0);`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 326:** `                resolved.add(existing);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 327:** `            } else {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 328:** `                if (p.getId() != null) p.setId(null);`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 329:** `                if (p.getDistanceMiles() == null) p.setDistanceMiles(0.0);`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 330:** `                resolved.add(p);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 331:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 332:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 333:** `        return resolved;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 334:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 335:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 336:** `    private void enforceOnePassengerPerFlight(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 337:** `        Object rawFlightId = booking != null ? booking.getFlightId() : null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 338:** `        if (rawFlightId == null) return;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 339:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 340:** `        List<Passenger> currentDetails = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 341:** `        try { currentDetails = booking.getPassengerDetails(); } catch (Exception e) {}`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 342:** `        if (currentDetails == null) return;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 343:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 344:** `        Set<Long> seenIds = new HashSet<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 345:** `        Set<String> seenEmails = new HashSet<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 346:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 347:** `        for (Passenger p : currentDetails) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 348:** `            if (p == null) continue;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 349:** `            Long id = p.getId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 350:** `            String email = (p.getEmail() != null && !p.getEmail().trim().isEmpty())`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 351:** `                    ? p.getEmail().trim().toLowerCase(Locale.ROOT) : null;`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 352:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 353:** `            if (id != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 354:** `                if (!seenIds.add(id)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 355:** `                    throw new IllegalStateException("Passenger " + describePassenger(p) + " is duplicated in this booking request form.");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 356:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 357:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 358:** `            if (email != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 359:** `                if (!seenEmails.add(email)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 360:** `                    throw new IllegalStateException("Passenger with email " + email + " is duplicated in this booking request form.");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 361:** `                }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 362:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 363:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 364:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 365:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 366:** `    private static String describePassenger(Passenger p) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 367:** `        if (p.getFullName() != null && !p.getFullName().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 368:** `            return p.getId() != null ? p.getFullName() + " (ID " + p.getId() + ")" : p.getFullName();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 369:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 370:** `        if (p.getId() != null) return "ID " + p.getId();`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 371:** `        if (p.getEmail() != null && !p.getEmail().isBlank()) return p.getEmail();`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 372:** `        return "provided";`
  Ends the current method and gives this expression/value back to its caller.
- **Line 373:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 374:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 375:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 376:** `    public void validateNoDuplicatePassengerOnFlight(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 377:** `        enforceOnePassengerPerFlight(booking);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 378:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 379:** `        // Check if any passenger is already booked on the same flight`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 380:** `        Long flightId = booking.getFlightId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 381:** `        List<Passenger> currentPassengers = booking.getPassengerDetails();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 382:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 383:** `        if (flightId == null \|\| currentPassengers == null \|\| currentPassengers.isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 384:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 385:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 386:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 387:** `        for (Passenger passenger : currentPassengers) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 388:** `            if (passenger == null) continue;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 389:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 390:** `            Long passengerId = passenger.getId();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 391:** `            String email = (passenger.getEmail() != null && !passenger.getEmail().trim().isEmpty())`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 392:** `                    ? passenger.getEmail().trim() : null;`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 393:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 394:** `            // Check if this passenger already has bookings on this flight`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 395:** `            List<Passenger> existingBookings = passengerRepository.findPassengerBookingsOnFlight(`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 396:** `                    flightId,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 397:** `                    passengerId,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 398:** `                    email`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 399:** `            );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 400:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 401:** `            if (!existingBookings.isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 402:** `                throw new IllegalStateException(`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 403:** `                        "Passenger " + describePassenger(passenger) + " is already booked on this flight. " +`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 404:** `                                "prA person cannot book multiple seats on the same flight."`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 405:** `                );`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 406:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 407:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 408:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 409:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 410:** `    private void awardDistanceMiles(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 411:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 412:** `            if (booking.getFlightId() == null \|\| booking.getPassengerDetails() == null \|\| booking.getPassengerDetails().isEmpty()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 413:** `                return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 414:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 415:** `            Flight flight = flightClient.getFlightById(booking.getFlightId().longValue());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 416:** `            double routeMiles = (flight != null && flight.getDistanceMiles() != null) ? flight.getDistanceMiles() : 0.0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 417:** `            if (routeMiles <= 0) return;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 418:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 419:** `            booking.getPassengerDetails().forEach(p -> {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 420:** `                double current = (p.getDistanceMiles() != null) ? p.getDistanceMiles() : 0.0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 421:** `                p.setDistanceMiles(current + routeMiles);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 422:** `            });`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 423:** `            passengerRepository.saveAll(booking.getPassengerDetails());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 424:** `        } catch (Exception ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 425:** `            log.warn("Could not award distance miles ({})", ex.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 426:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 427:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 428:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 429:** `    private SeatInventory findSeat(Integer flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 430:** `        if (flightId == null \|\| seatNumber == null \|\| seatNumber.isBlank()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 431:** `        return seatInventoryRepository.findByFlightIdAndSeatNumber(flightId, seatNumber).orElse(null);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 432:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 433:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 434:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 435:** `    public Booking selectSeat(Long bookingId, String seat) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 436:** `        Booking booking = bookingRepository.findById(bookingId)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 437:** `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 438:** `        if (seat != null && !seat.isBlank()) booking.setSeat(seat);`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 439:** `        return bookingRepository.save(booking);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 440:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 441:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 442:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 443:** `    public Booking modifyBooking(Long bookingId, Booking updatedBooking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 444:** `        Booking existing = bookingRepository.findById(bookingId)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 445:** `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 446:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 447:** `        if (updatedBooking != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 448:** `            if (updatedBooking.getFlightType() != null && !updatedBooking.getFlightType().isBlank()) existing.setFlightType(updatedBooking.getFlightType());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 449:** `            if (updatedBooking.getFromLocation() != null && !updatedBooking.getFromLocation().isBlank()) existing.setFromLocation(updatedBooking.getFromLocation());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 450:** `            if (updatedBooking.getToLocation() != null && !updatedBooking.getToLocation().isBlank()) existing.setToLocation(updatedBooking.getToLocation());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 451:** `            if (updatedBooking.getAirline() != null && !updatedBooking.getAirline().isBlank()) existing.setAirline(updatedBooking.getAirline());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 452:** `            if (updatedBooking.getSeat() != null && !updatedBooking.getSeat().isBlank()) existing.setSeat(updatedBooking.getSeat());`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 453:** `            if (updatedBooking.getDepartureDate() != null && !updatedBooking.getDepartureDate().isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 454:** `                existing.setDepartureDate(updatedBooking.getDepartureDate());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 455:** `                existing.setFlyDate(updatedBooking.getDepartureDate());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 456:** `            } else if (updatedBooking.getFlyDate() != null && !updatedBooking.getFlyDate().isBlank()) {`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 457:** `                existing.setFlyDate(updatedBooking.getFlyDate());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 458:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 459:** `            if (updatedBooking.getPassengers() > 0) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 460:** `                int updatedCount = clampPassengers(updatedBooking.getPassengers());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 461:** `                existing.setPassengers(updatedCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 462:** `                ensurePassengerSlots(existing, updatedCount);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 463:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 464:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 465:** `        existing.setFare(calculateFare(existing));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 466:** `        return bookingRepository.save(existing);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 467:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 468:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 469:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 470:** `    @Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 471:** `    public Booking cancelBooking(Long bookingId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 472:** `        Booking booking = bookingRepository.findById(bookingId)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 473:** `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 474:** `        booking.setStatus("CANCELLED");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 475:** `        Booking saved = bookingRepository.save(booking);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 476:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 477:** `        if (booking.getFlightId() != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 478:** `            SeatInventory seat = findSeat(Math.toIntExact(booking.getFlightId()), booking.getSeat());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 479:** `            if (seat != null && seat.getSeatStatus() == SeatStatus.BOOKED) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 480:** `                seat.setSeatStatus(SeatStatus.AVAILABLE);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 481:** `                seatInventoryRepository.save(seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 482:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 483:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 484:** `        return saved;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 485:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 486:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 487:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 488:** `    public Booking getBookingDetails() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 489:** `        return bookingRepository.findTopByOrderByIdDesc().orElseGet(this::createDefaultBookingPreview);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 490:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 491:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 492:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 493:** `    public Booking getBookingById(Long bookingId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 494:** `        if (bookingId == null) return createDefaultBookingPreview();`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 495:** `        return bookingRepository.findById(bookingId).orElseGet(this::createDefaultBookingPreview);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 496:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 497:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 498:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 499:** `    public List<Booking> getAllBookings() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 500:** `        return bookingRepository.findAllByOrderByIdDesc();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 501:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 502:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 503:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 504:** `    public Passenger getPassengerById(Long passengerId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 505:** `        if (passengerId == null) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 506:** `        return passengerRepository.findById(passengerId).orElse(null);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 507:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 508:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 509:** `    private Booking createDefaultBookingPreview() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 510:** `        Booking booking = new Booking();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 511:** `        booking.setFlightType("domestic");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 512:** `        booking.setFromLocation("CJB");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 513:** `        booking.setToLocation("HYD");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 514:** `        booking.setPassengers(1);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 515:** `        booking.setPnr(mockPaymentService.generatePnr());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 516:** `        booking.setStatus("CONFIRMED");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 517:** `        booking.setAirline("IndiGo");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 518:** `        booking.setSeat("12B");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 519:** `        booking.setFare(5200.0);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 520:** `        booking.setFlyDate("2026-06-15");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 521:** `        return booking;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 522:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 523:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 524:** `    private double calculateFare(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 525:** `        double baseFare = "international".equalsIgnoreCase(booking.getFlightType()) ? 18500.0 : 5200.0;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 526:** `        return baseFare * Math.max(booking.getPassengers(), 1);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 527:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 528:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 529:** `    private boolean isInternationalLocation(String location) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 530:** `        return location != null && INTERNATIONAL_AIRPORT_CODES.contains(location.trim().toUpperCase(Locale.ROOT));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 531:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 532:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 533:** `    private boolean isInternationalFlight(Flight flight) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 534:** `        return isInternationalLocation(flight.getOrigin()) \|\| isInternationalLocation(flight.getDestination());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 535:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 536:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 537:** `    private LocalDate parseDate(String value) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 538:** `        if (value == null \|\| value.isBlank()) return null;`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 539:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 540:** `            return LocalDate.parse(value);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 541:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 542:** `            return null;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 543:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 544:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 545:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 546:** `    private int clampPassengers(int requested) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 547:** `        return Math.min(Math.max(requested, 1), MAX_PASSENGERS);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 548:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 549:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 550:** `    private void ensurePassengerSlots(Booking booking, int passengerCount) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 551:** `        List<Passenger> currentPassengers = booking.getPassengerDetails();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 552:** `        if (currentPassengers == null) currentPassengers = new ArrayList<>();`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 553:** `        while (currentPassengers.size() < passengerCount) currentPassengers.add(new Passenger());`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 554:** `        while (currentPassengers.size() > passengerCount) currentPassengers.removeLast();`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 555:** `        booking.setPassengerDetails(currentPassengers);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 556:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 557:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/service/MockPaymentService.java`

- **Line 1:** `package com.genc.arfoms.booking.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Booking;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `import java.security.SecureRandom;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 9:** `public class MockPaymentService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    private static final char[] ALPHANUMERIC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 12:** `    private static final SecureRandom RANDOM = new SecureRandom();`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    public MockPaymentResult processBookingPayment(Booking booking) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 15:** `        return new MockPaymentResult(generatePnr(), "CONFIRMED");`
  Ends the current method and gives this expression/value back to its caller.
- **Line 16:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    public String generatePnr() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 19:** `        return generateToken(8);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 20:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    private String generateToken(int length) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 23:** `        StringBuilder token = new StringBuilder(length);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 24:** `        for (int index = 0; index < length; index++) {`
  Loop control statement: it repeats the following block according to its condition or iteration expression.
- **Line 25:** `            token.append(ALPHANUMERIC[RANDOM.nextInt(ALPHANUMERIC.length)]);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** `        return token.toString();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 28:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 29:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 30:** `    public record MockPaymentResult(String pnr, String bookingStatus) {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/java/com/genc/arfoms/booking/service/PassengerService.java`

- **Line 1:** `package com.genc.arfoms.booking.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.repository.PassengerRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 11:** `public class PassengerService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 14:** `    private PassengerRepository passengerRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    public Passenger getPassenger() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `        List<Passenger> all = passengerRepository.findAll();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 18:** `        return all.isEmpty() ? null : all.get(0);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 19:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 20:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `booking-service/src/main/java/com/genc/arfoms/booking/service/SeatPaymentService.java`

- **Line 1:** `package com.genc.arfoms.booking.service;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.booking.dto.BookingResult;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.booking.model.Flight;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import com.genc.arfoms.booking.model.Passenger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import com.genc.arfoms.booking.model.Payment;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import com.genc.arfoms.booking.model.SeatInventory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import com.genc.arfoms.booking.model.SeatStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import com.genc.arfoms.booking.repository.PaymentRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import com.genc.arfoms.booking.repository.SeatInventoryRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import com.genc.arfoms.booking.client.FlightClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.stereotype.Service;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.transaction.annotation.Transactional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.time.LocalDateTime;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** `import java.time.format.DateTimeFormatter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 18:** `import java.time.format.DateTimeParseException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 19:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 20:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `@Service`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 23:** `public class SeatPaymentService {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    private static final int BASE_FARE = 18500;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** `    private static final int TAXES = 1250;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 27:** `    private static final int SAVINGS = 950;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 28:** `    private static final int WINDOW_CHARGE = 700;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** `    private static final int AISLE_CHARGE = 500;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 30:** `    private static final DateTimeFormatter TIME_FMT = DateTimeFormatter.ofPattern("hh:mm a");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 31:** `    private static final DateTimeFormatter STORED_FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    private final SeatInventoryRepository seatInventoryRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 34:** `    private final PaymentRepository paymentRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 35:** `    private final FlightClient flightClient;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 36:** `    private final PassengerService passengerService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 37:** `    private final MockPaymentService mockPaymentService;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 38:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 39:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 40:** `    public SeatPaymentService(SeatInventoryRepository seatInventoryRepository,`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 41:** `                              PaymentRepository paymentRepository,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 42:** `                              FlightClient flightClient,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 43:** `                              PassengerService passengerService,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 44:** `                              MockPaymentService mockPaymentService) {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 45:** `        this.seatInventoryRepository = seatInventoryRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 46:** `        this.paymentRepository = paymentRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 47:** `        this.flightClient = flightClient;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `        this.passengerService = passengerService;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `        this.mockPaymentService = mockPaymentService;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 51:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 52:** `    public List<SeatInventory> getSeatsByFlight(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 53:** `        return seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(toInt(flightId));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 54:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 55:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 56:** `    public List<SeatInventory> getAvailableSeats(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 57:** `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.AVAILABLE);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 58:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 59:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 60:** `    public List<SeatInventory> getBookedSeats(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 61:** `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.BOOKED);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 62:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 63:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 64:** `    public long countAvailableSeats(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 65:** `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.AVAILABLE).size();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 66:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 67:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 68:** `    public long countBookedSeats(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 69:** `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.BOOKED).size();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 70:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 71:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 72:** `    public boolean isSeatBooked(Long flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 73:** `        return seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber)`
  Ends the current method and gives this expression/value back to its caller.
- **Line 74:** `                .map(seat -> seat.getSeatStatus() == SeatStatus.BOOKED)`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 75:** `                .orElse(false);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 76:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 77:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 78:** `    @Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 79:** `    public boolean confirmSeatSelection(Long flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 80:** `        Optional<SeatInventory> seatOpt =`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 81:** `                seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `        if (seatOpt.isPresent()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 83:** `            SeatInventory seat = seatOpt.get();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 84:** `            if (seat.getSeatStatus() == SeatStatus.AVAILABLE) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 85:** `                seat.setSeatStatus(SeatStatus.BOOKED);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 86:** `                seatInventoryRepository.save(seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 87:** `                return true;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 88:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 89:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 90:** `        return false;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 91:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 92:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 93:** `    @Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 94:** `    public void resetSeatSelection(Long flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 95:** `        Optional<SeatInventory> seatOpt =`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 96:** `                seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 97:** `        if (seatOpt.isPresent()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 98:** `            SeatInventory seat = seatOpt.get();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 99:** `            seat.setSeatStatus(SeatStatus.AVAILABLE);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 100:** `            seatInventoryRepository.save(seat);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 101:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 102:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 103:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 104:** `    public List<Payment> getAllPayments() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 105:** `        return paymentRepository.findAll();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 106:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 107:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 108:** `    public Optional<Payment> getPaymentById(int id) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 109:** `        return paymentRepository.findById(id);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 110:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 111:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 112:** `    public Payment savePayment(Payment payment) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 113:** `        return paymentRepository.save(payment);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 114:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 115:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 116:** `    public Optional<Payment> findByFlightIdAndSeatNumber(Integer flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 117:** `        return paymentRepository.findByFlightIdAndSeatNumber(flightId, seatNumber);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 118:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 119:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 120:** `    public void deletePayment(int id) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 121:** `        paymentRepository.deleteById(id);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 122:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 123:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 124:** `    @Transactional`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 125:** `    public BookingResult confirmBooking(Long flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 126:** `        if (flightId == null \|\| seatNumber == null \|\| seatNumber.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 127:** `            return BookingResult.failure("Missing flight or seat information.");`
  Ends the current method and gives this expression/value back to its caller.
- **Line 128:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 129:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 130:** `        // 1. Break the session relationship reference tracker causing the Transient Exception error`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 131:** `        Passenger passenger = passengerService.getPassenger();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 132:** `        if (passenger != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 133:** `            passenger.setBooking(null);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 134:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 135:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 136:** `        boolean justBooked = confirmSeatSelection(flightId, seatNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 137:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 138:** `        if (!justBooked) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 139:** `            Payment existing = findByFlightIdAndSeatNumber(flightId.intValue(), seatNumber).orElse(null);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 140:** `            if (existing != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 141:** `                return BookingResult.success(existing.getBookingId(), existing.getSeatNumber(),`
  Ends the current method and gives this expression/value back to its caller.
- **Line 142:** `                        existing.getTotalAmount());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 143:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 144:** `            return BookingResult.failure("Sorry, this seat is no longer available. Please choose another seat.");`
  Ends the current method and gives this expression/value back to its caller.
- **Line 145:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 146:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 147:** `        // 2. Build payment tracking layout and assign the generated Mock PNR`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 148:** `        Payment bookingDetails = buildBooking(flightId, seatNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 149:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 150:** `        // Save to DB`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 151:** `        Payment saved = savePayment(bookingDetails);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 152:** `        return BookingResult.success(saved.getBookingId(), saved.getSeatNumber(), saved.getTotalAmount());`
  Ends the current method and gives this expression/value back to its caller.
- **Line 153:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 154:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 155:** `    public Payment buildBooking(Long flightId, String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 156:** `        int seatCharges = calculateSeatCharge(seatNumber);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 157:** `        int totalAmount = BASE_FARE + seatCharges + TAXES;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 158:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 159:** `        Flight flight = flightClient.getFlightById(flightId);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 160:** `        Passenger passenger = passengerService.getPassenger();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 161:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 162:** `        // Generate Mock PNR using the service`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 163:** `        String mockPnr = mockPaymentService.generatePnr();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 164:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 165:** `        Payment booking = new Payment();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 166:** `        booking.setBaseFare(String.valueOf(BASE_FARE));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 167:** `        booking.setSeatCharges(String.valueOf(seatCharges));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 168:** `        booking.setTaxes(String.valueOf(TAXES));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 169:** `        booking.setTotalAmount(String.valueOf(totalAmount));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 170:** `        booking.setSavings(String.valueOf(SAVINGS));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 171:** `        booking.setSeatNumber(seatNumber);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 172:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 173:** `        if (flight != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 174:** `            booking.setFlight(flight);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 175:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 176:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 177:** `        if (flight != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 178:** `            booking.setFlightNumber(flight.getFlightNumber());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 179:** `            booking.setSource(flight.getOrigin());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 180:** `            booking.setDestination(flight.getDestination());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 181:** `            booking.setDepartureTime(formatStored(flight.getDepartureTime()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 182:** `            booking.setArrivalTime(formatStored(flight.getArrivalTime()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 183:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 184:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 185:** `        if (passenger != null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 186:** `            // Append the PNR string directly into the passenger metadata string`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 187:** `            // so the confirmation page front-end display can read it smoothly!`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 188:** `            booking.setPassengerName(passenger.getName() + " (PNR: " + mockPnr + ")");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 189:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 190:** `        return booking;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 191:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 192:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 193:** `    private static String formatStored(String stored) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 194:** `        if (stored == null \|\| stored.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 195:** `            return "-";`
  Ends the current method and gives this expression/value back to its caller.
- **Line 196:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 197:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 198:** `            return LocalDateTime.parse(stored, STORED_FMT).format(TIME_FMT);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 199:** `        } catch (DateTimeParseException ex) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 200:** `            return stored;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 201:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 202:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 203:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 204:** `    private int calculateSeatCharge(String seatNumber) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 205:** `        if (seatNumber == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 206:** `            return 0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 207:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 208:** `        try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 209:** `            int col = Integer.parseInt(seatNumber.substring(1));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 210:** `            switch (col) {`
  Starts multi-way branching based on one expression.
- **Line 211:** `                case 1:`
  Selects one branch within the surrounding `switch` statement.
- **Line 212:** `                case 4:`
  Selects one branch within the surrounding `switch` statement.
- **Line 213:** `                    return WINDOW_CHARGE;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 214:** `                case 2:`
  Selects one branch within the surrounding `switch` statement.
- **Line 215:** `                case 3:`
  Selects one branch within the surrounding `switch` statement.
- **Line 216:** `                    return AISLE_CHARGE;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 217:** `                default:`
  Selects one branch within the surrounding `switch` statement.
- **Line 218:** `                    return 0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 219:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 220:** `        } catch (NumberFormatException e) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 221:** `            return 0;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 222:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 223:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 224:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 225:** `    private static Integer toInt(Long flightId) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 226:** `        return flightId == null ? null : flightId.intValue();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 227:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 228:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `booking-service/src/main/resources/application.properties`

- **Line 1:** `spring.application.name=booking-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.config.import=optional:configserver:http://localhost:8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `booking-service/src/main/resources/log4j2.properties`

- **Line 1:** `status = warn`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `name = ARFOMSLogConfig`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 4:** `property.logDir = logs`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `property.appName = booking-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `appenders = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `appender.console.type = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `appender.console.name = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** `appender.console.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `appender.rolling.type = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `appender.rolling.name = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `appender.rolling.fileName = ${logDir}/${appName}.log`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 18:** `appender.rolling.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 19:** `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 20:** `appender.rolling.policies.type = Policies`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 21:** `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 22:** `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 23:** `appender.rolling.policies.size.size = 10MB`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 24:** `appender.rolling.strategy.type = DefaultRolloverStrategy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 25:** `appender.rolling.strategy.max = 14`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `rootLogger.level = info`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 28:** `rootLogger.appenderRefs = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 29:** `rootLogger.appenderRef.console.ref = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 30:** `rootLogger.appenderRef.rolling.ref = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

## Auth Service - `auth-service`

Owns users, registration, login, password hashing, and JWT token creation/validation.

### `auth-service/pom.xml`

- **Line 1:** `<?xml version="1.0" encoding="UTF-8"?>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 6:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 9:** `        <relativePath>../pom.xml</relativePath>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 10:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `    <artifactId>auth-service</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 15:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 16:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 17:** `            <artifactId>spring-boot-starter-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 18:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 19:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 20:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 21:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 22:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 23:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 24:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 25:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 26:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 27:** `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 28:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 29:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 30:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 31:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 32:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 33:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 34:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 35:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 36:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 37:** `            <artifactId>jjwt-api</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 38:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 39:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 40:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 41:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 42:** `            <artifactId>jjwt-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 43:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 44:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 45:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 46:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 47:** `            <groupId>io.jsonwebtoken</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 48:** `            <artifactId>jjwt-jackson</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 49:** `            <version>0.11.5</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 50:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 51:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 52:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 53:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 54:** `            <artifactId>spring-boot-starter-data-jpa</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 55:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 56:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 57:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 58:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 59:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 60:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 61:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 62:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 63:** `            <groupId>com.mysql</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 64:** `            <artifactId>mysql-connector-j</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 65:** `            <scope>runtime</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 66:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 67:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 68:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 69:** `            <artifactId>spring-boot-starter-security</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 70:** `            <exclusions>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 71:** `                <exclusion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 72:** `                    <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 73:** `                    <artifactId>spring-boot-starter-logging</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 74:** `                </exclusion>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 75:** `            </exclusions>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 76:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 77:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 78:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 79:** `            <artifactId>log4j-slf4j2-impl</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 80:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 81:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 82:** `            <groupId>org.apache.logging.log4j</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 83:** `            <artifactId>log4j-core</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 84:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 85:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 86:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 87:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 88:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 89:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 90:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 91:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 92:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 93:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 94:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 95:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.

### `auth-service/src/main/java/com/genc/arfoms/auth/AuthApplication.java`

- **Line 1:** `package com.genc.arfoms.auth;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.cloud.client.discovery.EnableDiscoveryClient;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 8:** `@EnableDiscoveryClient`
  Enables the Spring Cloud/Spring feature named by this annotation during application startup.
- **Line 9:** `public class AuthApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 10:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 11:** `        SpringApplication.run(AuthApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 12:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 13:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/AuthController.java`

- **Line 1:** `package com.genc.arfoms.auth;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.auth.model.User;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.auth.repository.UserRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.web.bind.annotation.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `import com.genc.arfoms.auth.exception.PasswordIncorrectException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import com.genc.arfoms.auth.exception.UserAlreadyExistsException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `import java.util.Map;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 16:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@RestController`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `@RequestMapping("/api/auth")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 20:** `public class AuthController {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    private final Logger logger = LoggerFactory.getLogger(AuthController.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 25:** `    private JwtUtils jwtUtils;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    private UserRepository userRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 29:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 30:** `    @PostMapping("/login")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 31:** `    public ResponseEntity<?> login(@RequestBody Map<String, String> credentials) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 32:** `        String username = credentials.get("username");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 33:** `        String password = credentials.get("password");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 34:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 35:** `        logger.info("Login attempt for user: {}", username);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `        if (username == null \|\| password == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 38:** `            logger.warn("Login failed: Username or password missing.");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `            throw new IllegalArgumentException("Username and password required");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 40:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `        Optional<User> userOpt = userRepository.findByUsername(username);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 44:** `        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 45:** `            User user = userOpt.get();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 46:** `            String token = jwtUtils.generateToken(username, user.getRole());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 47:** `            logger.info("Login successful for user: {}, role: {}", username, user.getRole());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 48:** `            return ResponseEntity.ok(Map.of(`
  Ends the current method and gives this expression/value back to its caller.
- **Line 49:** `                    "token", token,`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 50:** `                    "role", user.getRole(),`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `                    "name", user.getName()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `            ));`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 53:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 54:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 55:** `        logger.warn("Login failed: Invalid credentials for user: {}", username);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 56:** `        throw new PasswordIncorrectException("Invalid credentials");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 57:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 58:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 59:** `    @PostMapping("/register")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 60:** `    public ResponseEntity<?> register(@RequestBody User newUser) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 61:** `        logger.info("Registration attempt for username: {}", newUser.getUsername());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `        if (newUser.getUsername() == null \|\| newUser.getPassword() == null \|\| newUser.getRole() == null \|\| newUser.getName() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 63:** `            logger.warn("Registration failed: Missing required fields.");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `            throw new IllegalArgumentException("All fields are required (username, password, name, role)");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 65:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 66:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 67:** `        if (userRepository.findByUsername(newUser.getUsername()).isPresent()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 68:** `            logger.warn("Registration failed: Username '{}' already exists.", newUser.getUsername());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 69:** `            throw new UserAlreadyExistsException("Username already exists");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 70:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 71:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 72:** `        // Standardize roles for consistency in the frontend mapping`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 73:** `        String role = newUser.getRole().toLowerCase().trim();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 74:** `        switch (role) {`
  Starts multi-way branching based on one expression.
- **Line 75:** `            case "admin":`
  Selects one branch within the surrounding `switch` statement.
- **Line 76:** `            case "reservation agent":`
  Selects one branch within the surrounding `switch` statement.
- **Line 77:** `            case "ground staff":`
  Selects one branch within the surrounding `switch` statement.
- **Line 78:** `            case "flight dispatcher":`
  Selects one branch within the surrounding `switch` statement.
- **Line 79:** `            case "crew scheduler":`
  Selects one branch within the surrounding `switch` statement.
- **Line 80:** `            case "loyalty manager":`
  Selects one branch within the surrounding `switch` statement.
- **Line 81:** `                newUser.setRole(role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 82:** `                break;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 83:** `            default:`
  Selects one branch within the surrounding `switch` statement.
- **Line 84:** `                logger.warn("Registration failed: Invalid role '{}' specified.", role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 85:** `                throw new IllegalArgumentException("Invalid role specified");`
  Stops normal execution by raising an exception. Spring can turn this into an HTTP error through an exception handler.
- **Line 86:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 87:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 88:** `        User savedUser = userRepository.save(newUser);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 89:** `        logger.info("User '{}' registered successfully with ID: {}", savedUser.getUsername(), savedUser.getId());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 90:** `        return ResponseEntity.status(HttpStatus.CREATED).body(Map.of(`
  Ends the current method and gives this expression/value back to its caller.
- **Line 91:** `                "message", "User registered successfully",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 92:** `                "userId", savedUser.getId()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 93:** `        ));`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 94:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 95:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 96:** `    @GetMapping("/validate")`
  Maps an HTTP request path and method to the controller method immediately below it.
- **Line 97:** `    public String validateToken(@RequestParam("token") String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 98:** `        logger.info("Validating token...");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 99:** `        jwtUtils.validateToken(token);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 100:** `        logger.info("Token validated successfully.");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 101:** `        return "Token is valid";`
  Ends the current method and gives this expression/value back to its caller.
- **Line 102:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 103:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/config/JwtRequestFilter.java`

- **Line 1:** `package com.genc.arfoms.auth.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.auth.JwtUtils;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import jakarta.servlet.FilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import jakarta.servlet.ServletException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import jakarta.servlet.http.HttpServletRequest;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import jakarta.servlet.http.HttpServletResponse;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.beans.factory.annotation.Autowired;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.core.authority.SimpleGrantedAuthority;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.core.context.SecurityContextHolder;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.filter.OncePerRequestFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.io.IOException;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 20:** `public class JwtRequestFilter extends OncePerRequestFilter {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 21:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 22:** `    @Autowired`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 23:** `    private JwtUtils jwtUtils;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 24:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 25:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 26:** `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 27:** `            throws ServletException, IOException {`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 28:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 29:** `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 30:** `            chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 32:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `        String requestTokenHeader = request.getHeader("Authorization");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 35:** `        if (requestTokenHeader == null \|\| requestTokenHeader.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 36:** `            String tokenParam = request.getParameter("access_token");`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 37:** `            if (tokenParam != null && !tokenParam.isBlank()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 38:** `                requestTokenHeader = "Bearer " + tokenParam;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 39:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `        String username = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        String jwtToken = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 44:** `        String role = null;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 47:** `            jwtToken = requestTokenHeader.substring(7);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `            try {`
  Starts protected code whose failures can be handled by the following `catch`/`finally` blocks.
- **Line 49:** `                username = jwtUtils.getUsernameFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `                role = jwtUtils.getRoleFromToken(jwtToken);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 51:** `            } catch (Exception e) {`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `                logger.error("JWT token verification failed: " + e.getMessage());`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 54:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 55:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 56:** `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 57:** `            if (jwtUtils.validateToken(jwtToken, username)) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 58:** `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 59:** `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 60:** `                        username, null, List.of(authority));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `                usernamePasswordAuthenticationToken`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 62:** `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `            }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 66:** `        chain.doFilter(request, response);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 67:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 68:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/config/SecurityConfig.java`

- **Line 1:** `package com.genc.arfoms.auth.config;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.context.annotation.Bean;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.context.annotation.Configuration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.http.HttpMethod;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.security.config.annotation.web.builders.HttpSecurity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.security.config.http.SessionCreationPolicy;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** `import org.springframework.security.web.SecurityFilterChain;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 11:** `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** `import org.springframework.web.cors.CorsConfiguration;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 13:** `import org.springframework.web.cors.CorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 14:** `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `import java.util.List;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `@Configuration`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 19:** `public class SecurityConfig {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    private final JwtRequestFilter jwtRequestFilter;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 24:** `        this.jwtRequestFilter = jwtRequestFilter;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 25:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 28:** `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        return httpSecurity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 30:** `                .csrf(CsrfConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `                .authorizeHttpRequests(requests ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** `                                .requestMatchers("/api/auth/login", "/api/auth/register", "/api/auth/validate").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 34:** `                                .requestMatchers("/error").permitAll()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `                                .anyRequest().authenticated()`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 36:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 37:** `                .sessionManagement(session ->`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 39:** `                )`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 40:** `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 41:** `                .formLogin(FormLoginConfigurer::disable)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `                .build();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    @Bean`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 47:** `    public CorsConfigurationSource corsConfigurationSource() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 48:** `        CorsConfiguration config = new CorsConfiguration();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 49:** `        // Allow all localhost variations for development`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 50:** `        config.setAllowedOrigins(List.of(`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `                "http://localhost:5600",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 52:** `                "http://127.0.0.1:5600",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 53:** `                "http://localhost:5500",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 54:** `                "http://127.0.0.1:5500",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 55:** `                "http://localhost:8000",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 56:** `                "http://127.0.0.1:8000",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 57:** `                "http://localhost:8210",`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 58:** `                "http://localhost:63342",  // JetBrains IDE server`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 59:** `                "http://127.0.0.1:63342"`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 60:** `        ));`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 61:** `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `        config.setAllowedHeaders(List.of("*"));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 63:** `        config.setAllowCredentials(true);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 64:** `        config.setMaxAge(3600L);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 65:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 66:** `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 67:** `        source.registerCorsConfiguration("/**", config);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 68:** `        return source;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 69:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 70:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/DataInitializer.java`

- **Line 1:** `package com.genc.arfoms.auth;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.auth.model.User;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import com.genc.arfoms.auth.repository.UserRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.beans.factory.annotation.Value;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.boot.CommandLineRunner;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 14:** `public class DataInitializer implements CommandLineRunner {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    private final Logger logger = LoggerFactory.getLogger(DataInitializer.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `    private final UserRepository userRepository;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 18:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 19:** `    public DataInitializer(UserRepository userRepository) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 20:** `        this.userRepository = userRepository;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 21:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 22:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 23:** `    @Override`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 24:** `    public void run(String... args) throws Exception {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 25:** `        logger.info("Initializing database with default users...");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `        upsertUser("admin", "Admin@123", "Administrator", "Admin");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `        upsertUser("scheduler", "Scheduler@123", "Flight Scheduler", "Flight Scheduler");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `        upsertUser("agent", "Agent@123", "Reservation Agent", "Reservation Agent");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `        upsertUser("crew", "Crew@123", "Crew Manager", "Crew Manager");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `        upsertUser("loyalty", "Loyalty@123", "Loyalty Manager", "Loyalty Manager");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 32:** `        upsertUser("groundstaff", "Ground@123", "Ground Staff", "Ground Staff");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `        logger.info("Database initialization completed.");`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    private void upsertUser(String username, String password, String name, String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 38:** `        Optional<User> existingUser = userRepository.findByUsername(username);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 39:** `        if (existingUser.isPresent()) {`
  Conditional branch: the enclosed block runs only when this boolean condition is true.
- **Line 40:** `            User user = existingUser.get();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 41:** `            user.setPassword(password);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 42:** `            user.setName(name);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `            user.setRole(role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 44:** `            userRepository.save(user);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `            logger.info("User '{}' updated successfully with role '{}'.", username, role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `            return;`
  Java statement or declaration that contributes to the surrounding type's behavior; read it together with the immediately adjacent block and annotations.
- **Line 47:** `        }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 48:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 49:** `        User user = new User(username, password, name, role);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 50:** `        userRepository.save(user);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `        logger.info("User '{}' created successfully with role '{}'.", username, role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 52:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 53:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/dto/ResponseData.java`

- **Line 1:** `package com.genc.arfoms.auth.dto;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class ResponseData<T> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    private T data;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 5:** `    private boolean success;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 6:** `    private String message;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 7:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 8:** `    public ResponseData() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 9:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 10:** `    public ResponseData(T data, boolean success, String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 11:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 12:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 13:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 14:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    public T getData() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 17:** `        return data;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 18:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public void setData(T data) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        this.data = data;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    public boolean isSuccess() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 25:** `        return success;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 26:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 27:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 28:** `    public void setSuccess(boolean success) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 29:** `        this.success = success;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 30:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `    public String getMessage() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 33:** `        return message;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 34:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 35:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 36:** `    public void setMessage(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 37:** `        this.message = message;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 38:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/exception/GlobalExceptionHandler.java`

- **Line 1:** `package com.genc.arfoms.auth.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.auth.dto.ResponseData;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.slf4j.Logger;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.slf4j.LoggerFactory;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.http.HttpStatus;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.http.ResponseEntity;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** `import org.springframework.web.bind.annotation.ExceptionHandler;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 9:** `import org.springframework.web.bind.annotation.RestControllerAdvice;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@RestControllerAdvice`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public class GlobalExceptionHandler {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    private final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 15:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 16:** `    @ExceptionHandler(UserAlreadyExistsException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 17:** `    public ResponseEntity<ResponseData<Object>> handleUserAlreadyExistsException(UserAlreadyExistsException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 18:** `        logger.warn("Username is Taken", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 19:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 20:** `                .status(HttpStatus.CONFLICT)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 21:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 22:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    @ExceptionHandler(PasswordIncorrectException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 25:** `    public ResponseEntity<ResponseData<Object>> handlePasswordIncorrectException(PasswordIncorrectException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** `        logger.warn("The Password Is Incorrect", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 28:** `                .status(HttpStatus.UNAUTHORIZED)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 31:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 32:** `    @ExceptionHandler(IllegalArgumentException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 33:** `    public ResponseEntity<ResponseData<Object>> handleIllegalArgumentException(IllegalArgumentException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `        logger.warn("Invalid Argument", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 35:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 36:** `                .status(HttpStatus.BAD_REQUEST)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 37:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 38:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 39:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 40:** `    @ExceptionHandler(java.util.NoSuchElementException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 41:** `    public ResponseEntity<ResponseData<Object>> handleNoSuchElementException(java.util.NoSuchElementException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 42:** `        logger.warn("Element not found", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 43:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `                .status(HttpStatus.NOT_FOUND)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 45:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 46:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 47:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 48:** `    @ExceptionHandler(IllegalStateException.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 49:** `    public ResponseEntity<ResponseData<Object>> handleIllegalStateException(IllegalStateException e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 50:** `        logger.warn("Invalid State", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 51:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 52:** `                .status(HttpStatus.CONFLICT)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 53:** `                .body(new ResponseData<>(null, false, e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 54:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 55:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 56:** `    @ExceptionHandler(Exception.class)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 57:** `    public ResponseEntity<ResponseData<Object>> handleGeneric(Exception e) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 58:** `        logger.error("Internal Server Error", e);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 59:** `        return ResponseEntity`
  Ends the current method and gives this expression/value back to its caller.
- **Line 60:** `                .status(HttpStatus.INTERNAL_SERVER_ERROR)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 61:** `                .body(new ResponseData<>(null, false, "Internal Server Error : " + e.getMessage()));`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 62:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 63:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/exception/PasswordIncorrectException.java`

- **Line 1:** `package com.genc.arfoms.auth.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class PasswordIncorrectException extends RuntimeException {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    public PasswordIncorrectException(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 5:** `        super(message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 6:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/exception/UserAlreadyExistsException.java`

- **Line 1:** `package com.genc.arfoms.auth.exception;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `public class UserAlreadyExistsException extends RuntimeException {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 4:** `    public UserAlreadyExistsException(String message) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 5:** `        super(message);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 6:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 7:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/JwtUtils.java`

- **Line 1:** `package com.genc.arfoms.auth;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import io.jsonwebtoken.Claims;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import io.jsonwebtoken.Jwts;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import io.jsonwebtoken.security.Keys;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** `import org.springframework.beans.factory.annotation.Value;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 7:** `import org.springframework.stereotype.Component;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `import javax.crypto.SecretKey;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `@Component`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 12:** `public class JwtUtils {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 15:** `    private String secret;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 16:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 17:** `    @Value("${jwt.expiration:86400000}")`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 18:** `    private long expiration;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 19:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 20:** `    public String generateToken(String username, String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 21:** `        java.util.Map<String, Object> claims = new java.util.HashMap<>();`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 22:** `        claims.put("role", role);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 23:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 24:** `        return Jwts.builder()`
  Ends the current method and gives this expression/value back to its caller.
- **Line 25:** `                .setClaims(claims)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 26:** `                .setSubject(username)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 27:** `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 28:** `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 29:** `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 30:** `                .compact();`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 31:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 32:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 33:** `    public String getUsernameFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 34:** `        return getAllClaimsFromToken(token).getSubject();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 35:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 36:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 37:** `    public String getRoleFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 38:** `        return getAllClaimsFromToken(token).get("role", String.class);`
  Ends the current method and gives this expression/value back to its caller.
- **Line 39:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 40:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 41:** `    public boolean validateToken(String token, String username) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 42:** `        final String extractedUsername = getUsernameFromToken(token);`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 43:** `        return (extractedUsername.equals(username));`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    public void validateToken(final String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `        Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 49:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 50:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 51:** `    private Claims getAllClaimsFromToken(String token) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 52:** `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 53:** `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();`
  Ends the current method and gives this expression/value back to its caller.
- **Line 54:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 55:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/model/User.java`

- **Line 1:** `package com.genc.arfoms.auth.model;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import jakarta.persistence.*;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 5:** `@Entity`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 6:** `@Table(name = "users")`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 7:** `public class User {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** `    @Id`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 9:** `    @GeneratedValue(strategy = GenerationType.IDENTITY)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 10:** `    private Long id;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 11:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 12:** `    @Column(unique = true, nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 13:** `    private String username;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 14:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 15:** `    @Column(nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 16:** `    private String password;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 17:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 18:** `    @Column(nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 19:** `    private String name;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 20:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 21:** `    @Column(nullable = false)`
  Framework annotation that supplies metadata for request binding, dependency injection, persistence mapping, validation, or exception handling.
- **Line 22:** `    private String role;`
  Declares a field. This stores state for the object/class or receives a dependency/value used by later methods.
- **Line 23:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 24:** `    // Default constructor for JPA`
  Comment/documentation line: it describes intent for readers; the Java compiler does not execute it.
- **Line 25:** `    public User() {}`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `    public User(String username, String password, String name, String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 28:** `        this.username = username;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 29:** `        this.password = password;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 30:** `        this.name = name;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 31:** `        this.role = role;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 32:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 33:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 34:** `    public Long getId() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 35:** `        return id;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 36:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 37:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 38:** `    public void setId(Long id) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 39:** `        this.id = id;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 40:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 41:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 42:** `    public String getUsername() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 43:** `        return username;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 44:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 45:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 46:** `    public void setUsername(String username) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 47:** `        this.username = username;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 48:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 49:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 50:** `    public String getPassword() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 51:** `        return password;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 52:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 53:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 54:** `    public void setPassword(String password) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 55:** `        this.password = password;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 56:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 57:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 58:** `    public String getName() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 59:** `        return name;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 60:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 61:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 62:** `    public void setName(String name) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 63:** `        this.name = name;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 64:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 65:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 66:** `    public String getRole() {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 67:** `        return role;`
  Ends the current method and gives this expression/value back to its caller.
- **Line 68:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 69:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 70:** `    public void setRole(String role) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 71:** `        this.role = role;`
  Performs an assignment or builds a value. The expression on the right is evaluated and stored/passed as indicated by the code.
- **Line 72:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 73:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/java/com/genc/arfoms/auth/repository/UserRepository.java`

- **Line 1:** `package com.genc.arfoms.auth.repository;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import com.genc.arfoms.auth.model.User;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.data.jpa.repository.JpaRepository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** `import org.springframework.stereotype.Repository;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `import java.util.Optional;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `@Repository`
  Spring/JPA stereotype annotation. It registers or maps this type so the framework can discover and manage it.
- **Line 10:** `public interface UserRepository extends JpaRepository<User, Long> {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 11:** `    Optional<User> findByUsername(String username);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 12:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.

### `auth-service/src/main/resources/application.properties`

- **Line 1:** `spring.application.name=auth-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.config.import=optional:configserver:http://localhost:8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

### `auth-service/src/main/resources/log4j2.properties`

- **Line 1:** `status = warn`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `name = ARFOMSLogConfig`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 4:** `property.logDir = logs`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 5:** `property.appName = auth-service`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 6:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 7:** `appenders = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `appender.console.type = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 10:** `appender.console.name = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 11:** `appender.console.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 12:** `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 14:** `appender.rolling.type = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 15:** `appender.rolling.name = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 16:** `appender.rolling.fileName = ${logDir}/${appName}.log`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 17:** `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 18:** `appender.rolling.layout.type = PatternLayout`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 19:** `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 20:** `appender.rolling.policies.type = Policies`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 21:** `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 22:** `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 23:** `appender.rolling.policies.size.size = 10MB`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 24:** `appender.rolling.strategy.type = DefaultRolloverStrategy`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 25:** `appender.rolling.strategy.max = 14`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 26:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 27:** `rootLogger.level = info`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 28:** `rootLogger.appenderRefs = console, rolling`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 29:** `rootLogger.appenderRef.console.ref = Console`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 30:** `rootLogger.appenderRef.rolling.ref = RollingFile`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

## API Service (API Gateway) - `api-gateway`

The single public entry point. It routes browser/API requests to the appropriate registered microservice.

### `api-gateway/pom.xml`

- **Line 1:** `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 2:** `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 3:** `    <modelVersion>4.0.0</modelVersion>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 4:** `    <parent>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 5:** `        <groupId>com.genc.arfoms</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 6:** `        <artifactId>arfoms-microservices</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 7:** `        <version>1.0.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 8:** `        <relativePath>../pom.xml</relativePath>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 9:** `    </parent>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 10:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 11:** `    <artifactId>api-gateway</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 12:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 13:** `    <!--`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 14:** `        Pin the security artifacts to the locally cached Spring Boot 4.1.0 /`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 15:** `        Spring Security 7.1.0 train so transitive resolution does not fall back`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 16:** `        to the uncached 4.0.x security POMs managed by the reactor BOM.`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 17:** `    -->`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 18:** `    <dependencyManagement>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 19:** `        <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 20:** `            <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 21:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 22:** `                <artifactId>spring-boot-security</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 23:** `                <version>4.1.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 24:** `            </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 25:** `            <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 26:** `                <groupId>org.springframework.security</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 27:** `                <artifactId>spring-security-web</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 28:** `                <version>7.1.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 29:** `            </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 30:** `            <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 31:** `                <groupId>org.springframework.security</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 32:** `                <artifactId>spring-security-config</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 33:** `                <version>7.1.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 34:** `            </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 35:** `            <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 36:** `                <groupId>org.springframework.security</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 37:** `                <artifactId>spring-security-core</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 38:** `                <version>7.1.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 39:** `            </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 40:** `            <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 41:** `                <groupId>org.springframework.security</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 42:** `                <artifactId>spring-security-crypto</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 43:** `                <version>7.1.0</version>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 44:** `            </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 45:** `        </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 46:** `    </dependencyManagement>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 47:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 48:** `    <dependencies>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 49:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 50:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 51:** `            <artifactId>spring-cloud-starter-gateway-server-webflux</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 52:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 53:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 54:** `        <!-- Eureka discovery client + Spring Cloud LoadBalancer (for lb:// routing). -->`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 55:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 56:** `            <groupId>org.springframework.cloud</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 57:** `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 58:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 59:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 60:** `        <dependency>`
  Begins one Maven dependency declaration; the nested tags identify a library Maven must download and put on the classpath.
- **Line 61:** `            <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 62:** `            <artifactId>spring-boot-starter-test</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 63:** `            <scope>test</scope>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 64:** `        </dependency>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 65:** `    </dependencies>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 66:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 67:** `    <build>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 68:** `        <plugins>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 69:** `            <plugin>`
  Maven XML configuration line. Maven reads it while resolving dependencies or building the executable JAR.
- **Line 70:** `                <groupId>org.springframework.boot</groupId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 71:** `                <artifactId>spring-boot-maven-plugin</artifactId>`
  Maven project metadata: this tag identifies the project, parent, dependency, or build setting it belongs to.
- **Line 72:** `            </plugin>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 73:** `        </plugins>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 74:** `    </build>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 75:** `</project>`
  Closes the XML element opened earlier, completing that Maven configuration section.
- **Line 76:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `api-gateway/src/main/java/com/genc/arfoms/gateway/ApiGatewayApplication.java`

- **Line 1:** `package com.genc.arfoms.gateway;`
  Declares this class package. Java uses the package to form the class's fully-qualified name and to control package-level visibility.
- **Line 2:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 3:** `import org.springframework.boot.SpringApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 4:** `import org.springframework.boot.autoconfigure.SpringBootApplication;`
  Imports a type so the rest of this file can use its short class name instead of its full package name.
- **Line 5:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 6:** `@SpringBootApplication`
  Spring Boot's main application annotation: combines configuration, auto-configuration, and component scanning from this package downward.
- **Line 7:** `public class ApiGatewayApplication {`
  Begins a public top-level type. `public` makes it accessible from other packages; the keyword determines whether it is a class, contract, enum, or record.
- **Line 8:** ``
  Blank line: it only separates related code for readability and has no runtime effect.
- **Line 9:** `    public static void main(String[] args) {`
  Declares a method or constructor. Its access modifier controls callers; parameters are the inputs and the declared return type is the output contract.
- **Line 10:** `        SpringApplication.run(ApiGatewayApplication.class, args);`
  Executes or participates in a method/constructor call. Read the arguments as the data being supplied to that operation.
- **Line 11:** `    }`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 12:** `}`
  Structural brace: it opens or closes the surrounding Java block/type. It does not perform work by itself.
- **Line 13:** ``
  Blank line: it only separates related code for readability and has no runtime effect.

### `api-gateway/src/main/resources/application.properties`

- **Line 1:** `spring.application.name=api-gateway`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 2:** `spring.config.import=optional:configserver:http://localhost:8888`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.
- **Line 3:** `spring.cloud.openfeign.okhttp.enabled=true`
  Configuration assignment. The key on the left is read by Spring/Spring Cloud; the value on the right changes this service's runtime behavior.

