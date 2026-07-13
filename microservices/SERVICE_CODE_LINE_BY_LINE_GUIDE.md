# ARFOMS microservices - friendly code guide

This is a project-first guide to the six requested services. Read the short project map first, then open a file section only when you want its exact line-by-line explanation.

## The project in one minute

```text
Frontend
   -> API Gateway (8210)
      -> Auth Service: login and JWT
      -> Flight Service: schedules, fares and seats
      -> Booking Service: passenger, seat, payment and PNR

Config Server (8888): supplies shared settings
Discovery Server (8761): lets services find each other by name
MySQL: stores users, flights, bookings, passengers, seats and payments
```

### Customer booking journey

1. The user logs in through Auth Service and receives a JWT.
2. The frontend sends the JWT to API Gateway with later requests.
3. Flight Service returns matching flights and available seats.
4. Booking Service stores passenger details, confirms a seat, records payment, and returns a PNR.

### How to read a file section

- **At a glance** tells you what the file does in ARFOMS and why it exists.
- **Why this method matters** connects a method to a real project flow before its code appears.
- The table below it is the exact line-by-line reference: source code on the left, project-specific explanation on the right.
- `api-service` in the request is the repository module named `api-gateway`.

## Config Server - `config-server`


At startup, each service asks this module for the properties named after its application name. Those properties provide ports, database access, Eureka details and gateway routes.

<details>
<summary><strong>config-server/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<?xml version="1.0" encoding="UTF-8"?>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 2 | `<project xmlns="http://maven.apache.org/POM/4.0.0"` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 3 | `         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 4 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 5 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 6 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 7 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 8 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 9 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 10 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 11 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 12 | `    <artifactId>config-server</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 13 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 14 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 15 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 16 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 17 | `            <artifactId>spring-cloud-config-server</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 18 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 19 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 20 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 21 | `            <artifactId>spring-boot-starter-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 22 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 23 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 24 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 25 | `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 26 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 27 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 28 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 29 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 30 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 31 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 32 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 33 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 34 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 35 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 36 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |
| 37 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 38 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by Config Server. |

</details>

<details>
<summary><strong>config-server/src/main/java/com/genc/arfoms/configserver/ConfigServerApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.configserver;` | places this code in the ARFOMS Config Server namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `import org.springframework.cloud.config.server.EnableConfigServer;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 6 | `import org.springframework.cloud.client.discovery.EnableDiscoveryClient;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 8 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `@EnableConfigServer` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@EnableDiscoveryClient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `public class ConfigServerApplication {` | this statement participates in the Config Server Service bootstrap behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the Config Server application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 12 | `    public static void main(String[] args) {` | this statement participates in the Config Server Service bootstrap behavior described for this file. |
| 13 | `        SpringApplication.run(ConfigServerApplication.class, args);` | this statement participates in the Config Server Service bootstrap behavior described for this file. |
| 14 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 15 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>config-server/src/main/resources/application.yml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `  port: 8888` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `` | blank line only; it separates steps in this Local Config Server bootstrap configuration file and changes no runtime behavior. |
| 4 | `spring:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `  application:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `    name: config-server` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `  profiles:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `    active: native` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `  cloud:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `    config:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `      server:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `        native:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `          search-locations: classpath:/config/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `` | blank line only; it separates steps in this Local Config Server bootstrap configuration file and changes no runtime behavior. |
| 15 | `eureka:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `  client:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `    service-url:` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `      defaultZone: http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/api-gateway.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8210` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 8 | `# --- Spring Cloud Gateway Routing ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `spring.cloud.gateway.server.webflux.routes[0].id=auth-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `spring.cloud.gateway.server.webflux.routes[0].uri=http://localhost:8180` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `spring.cloud.gateway.server.webflux.routes[0].predicates[0]=Path=/api/auth/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 13 | `spring.cloud.gateway.server.webflux.routes[1].id=flight-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `spring.cloud.gateway.server.webflux.routes[1].uri=http://localhost:8181` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `spring.cloud.gateway.server.webflux.routes[1].predicates[0]=Path=/api/flights/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 17 | `spring.cloud.gateway.server.webflux.routes[2].id=booking-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `spring.cloud.gateway.server.webflux.routes[2].uri=http://localhost:8182` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 19 | `spring.cloud.gateway.server.webflux.routes[2].predicates[0]=Path=/api/bookings/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `spring.cloud.gateway.server.webflux.routes[3].id=checkin-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 22 | `spring.cloud.gateway.server.webflux.routes[3].uri=http://localhost:8193` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 23 | `spring.cloud.gateway.server.webflux.routes[3].predicates[0]=Path=/api/checkin/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 24 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 25 | `spring.cloud.gateway.server.webflux.routes[4].id=crew-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 26 | `spring.cloud.gateway.server.webflux.routes[4].uri=http://localhost:8184` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 27 | `spring.cloud.gateway.server.webflux.routes[4].predicates[0]=Path=/api/crew/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 28 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 29 | `spring.cloud.gateway.server.webflux.routes[5].id=loyalty-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 30 | `spring.cloud.gateway.server.webflux.routes[5].uri=http://localhost:8185` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 31 | `spring.cloud.gateway.server.webflux.routes[5].predicates[0]=Path=/api/loyalty/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 32 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 33 | `spring.cloud.gateway.server.webflux.routes[6].id=booking-service-flights` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 34 | `spring.cloud.gateway.server.webflux.routes[6].uri=http://localhost:8182` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 35 | `spring.cloud.gateway.server.webflux.routes[6].predicates[0]=Path=/flights/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 36 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 37 | `spring.cloud.gateway.server.webflux.routes[7].id=booking-service-airline` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 38 | `spring.cloud.gateway.server.webflux.routes[7].uri=http://localhost:8182` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 39 | `spring.cloud.gateway.server.webflux.routes[7].predicates[0]=Path=/airline/**` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 40 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 41 | `spring.cloud.gateway.server.webflux.default-filters[0]=DedupeResponseHeader=Access-Control-Allow-Origin Access-Control-Allow-Credentials RETAIN_FIRST` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 42 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 43 | `spring.cloud.gateway.server.webflux.globalcors.add-to-simple-url-handler-mapping=true` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 44 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[0]=http://127.0.0.1:5500` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 45 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[1]=http://localhost:5500` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 46 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[2]=http://localhost:5600` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 47 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[3]=http://127.0.0.1:5600` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 48 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[4]=http://localhost:8000` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 49 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[5]=http://127.0.0.1:8000` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 50 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[6]=http://localhost:8210` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 51 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[7]=http://localhost:63342` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 52 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedOrigins[8]=http://127.0.0.1:63342` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 53 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[0]=GET` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 54 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[1]=POST` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 55 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[2]=PUT` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 56 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[3]=DELETE` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 57 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[4]=OPTIONS` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 58 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedMethods[5]=PATCH` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 59 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowedHeaders[0]=*` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 60 | `spring.cloud.gateway.server.webflux.globalcors.cors-configurations.[/**].allowCredentials=true` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/auth-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8180` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 8 | `# JWT Settings` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 10 | `# Database Configuration` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 19 | `# Default Admin Credentials` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 20 | `admin.username=admin` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 21 | `admin.password=Admin@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 22 | `admin.name=Administrator` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 23 | `admin.role=Admin` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/booking-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8182` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `# Resolved through Eureka by service id (load-balanced).` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `arfoms.flight-service.base-url=http://flight-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 12 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/checkin-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8193` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `# Resolved through Eureka by service id (load-balanced).` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `arfoms.booking-service.base-url=http://booking-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `arfoms.flight-service.base-url=http://flight-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 13 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/crew-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8184` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `server.error.include-message=always` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `# Resolved through Eureka by service id (load-balanced).` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `arfoms.flight-service.base-url=http://flight-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 13 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/discovery-server.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8761` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `# A standalone registry does not register with or fetch from itself.` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `eureka.client.register-with-eureka=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `eureka.client.fetch-registry=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 8 | `# Faster eviction of dead instances for local development.` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `eureka.server.enable-self-preservation=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `eureka.server.eviction-interval-timer-in-ms=15000` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/flight-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8181` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 10 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `# Single-machine dev setup: register by localhost so discovery keeps working` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `# even when the host's LAN IP changes (Wi-Fi/Ethernet switch). Using` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `# prefer-ip-address=true previously caused stale IPs (e.g. 192.168.0.5) to be` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `# registered, making the gateway's service-to-service calls fail with 500.` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>config-server/src/main/resources/config/loyalty-service.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `server.port=8185` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.datasource.url=jdbc:mysql://localhost:3306/microAir_db?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.datasource.username=root` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 4 | `spring.datasource.password=Root@123` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `spring.jpa.hibernate.ddl-auto=update` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 7 | `spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `spring.jpa.open-in-view=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 9 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 10 | `# Resolved through Eureka by service id (load-balanced).` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `arfoms.flight-service.base-url=http://flight-service` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 13 | `# --- Eureka service discovery ---` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 14 | `eureka.client.service-url.defaultZone=http://localhost:8761/eureka/` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `eureka.instance.hostname=localhost` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `eureka.instance.prefer-ip-address=false` | this setting controls how Config Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

## Discovery Server - `discovery-server`


This is Eureka: the live directory of service names and network locations. The gateway and Booking Service rely on it to find business services.

<details>
<summary><strong>discovery-server/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 2 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 3 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 4 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 5 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 6 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 7 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 8 | `        <relativePath>../pom.xml</relativePath>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 9 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 10 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 11 | `    <artifactId>discovery-server</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 12 | `    <description>Netflix Eureka service registry for ARFOMS microservices</description>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 13 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 14 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 15 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 16 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 17 | `            <artifactId>spring-cloud-starter-netflix-eureka-server</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 18 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 19 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 20 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 21 | `            <artifactId>spring-boot-starter-test</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 22 | `            <scope>test</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 23 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 24 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 25 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 26 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 27 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 28 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 29 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 30 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 31 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 32 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 33 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 34 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by Discovery Server. |
| 35 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |

</details>

<details>
<summary><strong>discovery-server/src/main/java/com/genc/arfoms/discovery/DiscoveryServerApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.discovery;` | places this code in the ARFOMS Discovery Server namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 7 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 8 | ` * Netflix Eureka service registry. Every ARFOMS microservice registers here so` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 9 | ` * the gateway and inter-service clients can discover each other by service id` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 10 | ` * instead of relying on hardcoded host:port values.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 11 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 12 | `@EnableEurekaServer` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class DiscoveryServerApplication {` | this statement participates in the Discovery Server Service bootstrap behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the Discovery Server application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    public static void main(String[] args) {` | this statement participates in the Discovery Server Service bootstrap behavior described for this file. |
| 17 | `        SpringApplication.run(DiscoveryServerApplication.class, args);` | this statement participates in the Discovery Server Service bootstrap behavior described for this file. |
| 18 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 19 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 20 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

</details>

<details>
<summary><strong>discovery-server/src/main/resources/application.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `spring.application.name=discovery-server` | this setting controls how Discovery Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.config.import=optional:configserver:http://localhost:8888` | this setting controls how Discovery Server participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

## Flight Service - `flight-service`


This is ARFOMS flight inventory ownership: flight schedules, airport validation, fares, available seats and flight search are implemented here.

<details>
<summary><strong>flight-service/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 2 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 3 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 4 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 5 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 6 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 7 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 8 | `        <relativePath>../pom.xml</relativePath>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 9 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 10 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 11 | `    <artifactId>flight-service</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 12 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 13 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 14 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 15 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 16 | `            <artifactId>spring-boot-starter-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 17 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 18 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 19 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 20 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 21 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 22 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 23 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 24 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 25 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 26 | `            <artifactId>spring-boot-starter-validation</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 27 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 28 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 29 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 30 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 31 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 32 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 33 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 34 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 35 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 36 | `            <artifactId>spring-boot-starter-data-jpa</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 37 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 38 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 39 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 40 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 41 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 42 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 43 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 44 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 45 | `            <groupId>com.mysql</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 46 | `            <artifactId>mysql-connector-j</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 47 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 48 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 49 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 50 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 51 | `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 52 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 53 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 54 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 55 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 56 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 57 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 58 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 59 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 60 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 61 | `            <artifactId>spring-boot-starter-security</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 62 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 63 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 64 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 65 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 66 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 67 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 68 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 69 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 70 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 71 | `            <artifactId>jjwt-api</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 72 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 73 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 74 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 75 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 76 | `            <artifactId>jjwt-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 77 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 78 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 79 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 80 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 81 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 82 | `            <artifactId>jjwt-jackson</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 83 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 84 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 85 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 86 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 87 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 88 | `            <artifactId>spring-boot-starter-test</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 89 | `            <scope>test</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 90 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 91 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 92 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 93 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 94 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 95 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 96 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 97 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 98 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 99 | `            <artifactId>log4j-slf4j2-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 100 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 101 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 102 | `            <groupId>org.projectlombok</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 103 | `            <artifactId>lombok</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 104 | `            <optional>true</optional>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 105 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 106 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 107 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 108 | `            <artifactId>log4j-core</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 109 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 110 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 111 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 112 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 113 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 114 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 115 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 116 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 117 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 118 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 119 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 120 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 121 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by Flight Service. |
| 122 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 123 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/config/JwtRequestFilter.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.config;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import jakarta.servlet.FilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import jakarta.servlet.ServletException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import jakarta.servlet.http.HttpServletRequest;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import jakarta.servlet.http.HttpServletResponse;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.core.authority.SimpleGrantedAuthority;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.core.context.SecurityContextHolder;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.web.filter.OncePerRequestFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 15 | `import java.io.IOException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 18 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class JwtRequestFilter extends OncePerRequestFilter {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    private JwtUtils jwtUtils;` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 24 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: every incoming protected request passes here before the controller. It extracts the Bearer JWT issued by Auth Service, validates it, puts the user/role into Spring Security, then continues the request chain.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 26 | `            throws ServletException, IOException {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 27 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 28 | `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 29 | `            chain.doFilter(request, response);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 30 | `            return;` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 31 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 33 | `        String requestTokenHeader = request.getHeader("Authorization");` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 34 | `        if (requestTokenHeader == null \\|\\| requestTokenHeader.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 35 | `            String tokenParam = request.getParameter("access_token");` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 36 | `            if (tokenParam != null && !tokenParam.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 37 | `                requestTokenHeader = "Bearer " + tokenParam;` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 38 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 41 | `        String username = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 42 | `        String jwtToken = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 43 | `        String role = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 44 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 45 | `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 46 | `            jwtToken = requestTokenHeader.substring(7);` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 47 | `            try {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 48 | `                username = jwtUtils.getUsernameFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 49 | `                role = jwtUtils.getRoleFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 50 | `            } catch (Exception e) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 51 | `                logger.error("JWT token verification failed: " + e.getMessage());` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 52 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 53 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 54 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 55 | `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 56 | `            if (jwtUtils.validateToken(jwtToken, username)) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 57 | `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 58 | `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 59 | `                        username, null, List.of(authority));` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 60 | `                usernamePasswordAuthenticationToken` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 61 | `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 62 | `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 63 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 64 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `        chain.doFilter(request, response);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 66 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 67 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/config/JwtUtils.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.config;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import io.jsonwebtoken.Claims;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import io.jsonwebtoken.Jwts;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import io.jsonwebtoken.security.Keys;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.beans.factory.annotation.Value;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 9 | `import javax.crypto.SecretKey;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 11 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class JwtUtils {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 14 | `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    private String secret;` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 17 | `    @Value("${jwt.expiration:86400000}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    private long expiration;` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 19 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public String generateToken(String username, String role) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 21 | `        java.util.Map<String, Object> claims = new java.util.HashMap<>();` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 22 | `        claims.put("role", role);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 23 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 24 | `        return Jwts.builder()` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 25 | `                .setClaims(claims)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 26 | `                .setSubject(username)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 27 | `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 28 | `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 29 | `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 30 | `                .compact();` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public String getUsernameFromToken(String token) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 34 | `        return getAllClaimsFromToken(token).getSubject();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 35 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 36 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 37 | `    public String getRoleFromToken(String token) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 38 | `        return getAllClaimsFromToken(token).get("role", String.class);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 39 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 41 | `    public boolean validateToken(String token, String username) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 42 | `        final String extractedUsername = getUsernameFromToken(token);` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 43 | `        return (extractedUsername.equals(username));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    private Claims getAllClaimsFromToken(String token) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 47 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 48 | `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 49 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 50 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/config/SecurityConfig.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.config;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import org.springframework.context.annotation.Bean;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import org.springframework.context.annotation.Configuration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import org.springframework.http.HttpMethod;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.security.config.annotation.web.builders.HttpSecurity;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.config.http.SessionCreationPolicy;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.web.SecurityFilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.web.cors.CorsConfiguration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.web.cors.CorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 18 | `@Configuration` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class SecurityConfig {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `    private final JwtRequestFilter jwtRequestFilter;` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 22 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 23 | `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 24 | `        this.jwtRequestFilter = jwtRequestFilter;` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 25 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 26 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 27 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 29 | `        return httpSecurity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 30 | `                .csrf(CsrfConfigurer::disable)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 31 | `                .authorizeHttpRequests(requests ->` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 32 | `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 33 | `                                .requestMatchers(HttpMethod.GET, "/api/flights", "/api/flights/**").permitAll()` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 34 | `                                .requestMatchers(HttpMethod.POST, "/api/flights/search").permitAll()` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 35 | `                                .requestMatchers("/error").permitAll()` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 36 | `                                .anyRequest().authenticated()` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 37 | `                )` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 38 | `                .sessionManagement(session ->` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 39 | `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 40 | `                )` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 41 | `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 42 | `                .formLogin(FormLoginConfigurer::disable)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 43 | `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 44 | `                .build();` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 45 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 46 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 47 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 48 | `    public CorsConfigurationSource corsConfigurationSource() {` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 49 | `        CorsConfiguration config = new CorsConfiguration();` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 50 | `        config.setAllowedOrigins(List.of(` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 51 | `                "http://127.0.0.1:5500", "http://localhost:5500",` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 52 | `                "http://127.0.0.1:5600", "http://localhost:5600",` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 53 | `                "http://127.0.0.1:8000", "http://localhost:8000",` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 54 | `                "http://localhost:8210",` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 55 | `                "http://localhost:63342", "http://127.0.0.1:63342"` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 56 | `        ));` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 57 | `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 58 | `        config.setAllowedHeaders(List.of("*"));` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 59 | `        config.setAllowCredentials(true);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 60 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 61 | `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();` | calculates or assigns data needed by this Security/infrastructure configuration in the Flight Service workflow. |
| 62 | `        source.registerCorsConfiguration("/**", config);` | this statement participates in the Flight Service Security/infrastructure configuration behavior described for this file. |
| 63 | `        return source;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 64 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/controller/FlightController.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Controller/API boundary. In this project, this file receives HTTP requests after API Gateway routes them. It converts request data into calls to Flight Service business code and returns the result to the frontend.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.controller;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.dto.FareUpdateRequest;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.flight.dto.FlightRequest;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.flight.dto.ScheduleUpdateRequest;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.flight.exception.FlightException;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 7 | `import com.genc.arfoms.flight.model.Flight;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 8 | `import com.genc.arfoms.flight.model.InternationalAirports;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 9 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 10 | `import com.genc.arfoms.flight.model.IndianAirports;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 11 | `import com.genc.arfoms.flight.service.FlightService;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 12 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 13 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.bind.annotation.*;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 17 | `import java.util.Map;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 18 | `import java.util.stream.Stream;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 19 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 20 | `@RestController` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 21 | `@RequestMapping("/api/flights")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `public class FlightController {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 24 | `    private final FlightService flightService;` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 25 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Flight Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 26 | `    public FlightController(FlightService flightService) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 27 | `        this.flightService = flightService;` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 28 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 29 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 30 | `    @GetMapping` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Flight Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 31 | `    public List<Flight> getAllFlights() {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 32 | `        return flightService.getAllFlights();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 33 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 34 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 35 | `    @GetMapping("/id/{flightId}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Flight Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 36 | `    public Flight getFlightById(@PathVariable Long flightId) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 37 | `        Flight flight = flightService.getFlight(flightId);` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 38 | `        if (flight == null) {` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 39 | `            throw new FlightException(HttpStatus.NOT_FOUND, "Flight not found for ID " + flightId);` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 40 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 41 | `        return flight;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 42 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 43 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 44 | `    @GetMapping("/{flightNumber}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Flight Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 45 | `    public Flight getFlightByNumber(@PathVariable String flightNumber) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 46 | `        return flightService.getFlightDetails(flightNumber)` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 47 | `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for number " + flightNumber));` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 48 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 49 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 50 | `    @PostMapping` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 51 | `    public ResponseEntity<Flight> addFlight(@RequestBody FlightRequest request) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 52 | `        Flight flight = request.toEntity();` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 53 | `        flightService.addFlight(flight);` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 54 | `        return ResponseEntity.status(HttpStatus.CREATED).body(getFlightByNumber(flight.getFlightNumber()));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 55 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 56 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 57 | `    @RequestMapping(value = "/{flightIdentifier}/schedule", method = {RequestMethod.PUT, RequestMethod.PATCH})` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 58 | `    public Flight updateSchedule(@PathVariable String flightIdentifier,` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 59 | `                                 @RequestBody ScheduleUpdateRequest request) {` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 60 | `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 61 | `        flightService.updateSchedule(flight.getFlightNumber(), request.getDepartureTime(), request.getArrivalTime(), request.getFlightStatus());` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 62 | `        return getFlightByNumber(flight.getFlightNumber());` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 63 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 64 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 65 | `    @RequestMapping(value = {"/{flightIdentifier}/fares", "/{flightIdentifier}/fare-class"}, method = {RequestMethod.PUT, RequestMethod.PATCH})` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 66 | `    public Flight setFares(@PathVariable String flightIdentifier,` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 67 | `                           @RequestBody FareUpdateRequest request) {` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 68 | `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 69 | `        flightService.setFares(flight.getFlightNumber(), request.getEconomyFare(), request.getPremiumFare(), request.getFirstFare());` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 70 | `        return getFlightByNumber(flight.getFlightNumber());` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 71 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 72 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 73 | `    @DeleteMapping("/{flightIdentifier}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 74 | `    public ResponseEntity<Void> deleteFlight(@PathVariable String flightIdentifier) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 75 | `        Flight flight = flightService.findByFlightNumberOrId(flightIdentifier);` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 76 | `        flightService.deleteFlight(flight.getFlightNumber());` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 77 | `        return ResponseEntity.noContent().build();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 78 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 79 | `    @PostMapping("/search")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this supports the booking search screen. It filters the Flight Service schedule by route/date/type/passenger count and returns only usable choices.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 80 | `    public ResponseEntity<List<Flight>> searchFlights(@RequestBody Map<String, Object> criteria) {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 81 | `        String fromLocation = (String) criteria.get("fromLocation");` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 82 | `        String toLocation = (String) criteria.get("toLocation");` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 83 | `        String departureDate = (String) criteria.get("departureDate");` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 84 | `        String flightType = (String) criteria.get("flightType");` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 85 | `        Integer passengers = (Integer) criteria.get("passengers");` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 86 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 87 | `        List<Flight> flights = flightService.searchAvailableFlights(fromLocation, toLocation, departureDate, flightType, passengers);` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 88 | `        return ResponseEntity.ok(flights);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 89 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 90 | `    @GetMapping("/metadata")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Flight Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 91 | `    public Map<String, Object> getMetadata() {` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 92 | `        List<IndianAirports.Airport> indianAirports = IndianAirports.AIRPORTS;` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 93 | `        List<IndianAirports.Airport> internationalAirports = InternationalAirports.AIRPORTS;` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 94 | `        List<IndianAirports.Airport> allAirports = Stream.concat(indianAirports.stream(), internationalAirports.stream())` | calculates or assigns data needed by this Controller/API boundary in the Flight Service workflow. |
| 95 | `                .toList();` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 96 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 97 | `        return Map.of(` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 98 | `                "statuses", FlightStatus.values(),` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 99 | `                "airports", allAirports,` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 100 | `                "indianAirports", indianAirports,` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 101 | `                "internationalAirports", internationalAirports` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 102 | `        );` | this statement participates in the Flight Service Controller/API boundary behavior described for this file. |
| 103 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 104 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/FareUpdateRequest.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `import lombok.Getter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 5 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import lombok.Setter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 8 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class FareUpdateRequest {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 13 | `    private double economyFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 14 | `    private double premiumFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 15 | `    private double businessFare; // supported for frontend compatibility` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 16 | `    private double firstFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 17 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 18 | `    public double getPremiumFare() {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 19 | `        return premiumFare != 0.0 ? premiumFare : businessFare;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 20 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 21 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightDistanceResponse.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 4 | ` * Response payload describing the great-circle distance (in miles) between the` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 5 | ` * origin and destination airports of a flight.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 6 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 7 | `public record FlightDistanceResponse(` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 8 | `        Long flightId,` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 9 | `        String flightNumber,` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 10 | `        String origin,` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 11 | `        String destination,` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 12 | `        double distanceMiles) {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 13 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 14 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightDTO.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import lombok.Data;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 5 | `import java.time.LocalDate;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import java.time.LocalTime;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 8 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 9 | ` * Data Transfer Object for {@link com.genc.arfoms.model.Flight}.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 10 | ` * Carries flight details (including the resolved airline name) to clients.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 11 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 12 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `public class FlightDTO {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 15 | `    private Integer flightId;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 16 | `    private Integer airlineId;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 17 | `    private String flightNumber;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 18 | `    private String origin;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 19 | `    private String destination;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 20 | `    private String flightStatus;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 21 | `    private LocalDate departureDate;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 22 | `    private LocalTime departureTimeOnly;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 23 | `    private LocalDate arrivalDate;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 24 | `    private LocalTime arrivalTimeOnly;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 25 | `    private String airlineName;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 26 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/FlightRequest.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.Flight;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 5 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import lombok.Getter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 8 | `import lombok.Setter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 10 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class FlightRequest {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 16 | `   private String flightNumber;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 17 | `   private String flightName;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 18 | `   private String origin;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 19 | `   private String destination;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 20 | `   private String departureTime;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 21 | `   private String arrivalTime;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 22 | `   private Double economyFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 23 | `   private Double premiumFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 24 | `   private Double businessFare; // supported for frontend compatibility` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 25 | `   private Double firstFare;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 26 | `   private FlightStatus flightStatus;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 27 | `   private Integer seatCount;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 28 | `   private Integer seatRows;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 29 | `   private Integer seatColumns;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 30 | `   private Integer seatAisleAfter;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 31 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 32 | `   public Flight toEntity() {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 33 | `       Flight flight = new Flight();` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 34 | `       flight.setFlightNumber(flightNumber);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 35 | `       flight.setFlightName(flightName);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 36 | `       flight.setOrigin(origin);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 37 | `       flight.setDestination(destination);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 38 | `       flight.setDepartureTime(departureTime);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 39 | `       flight.setArrivalTime(arrivalTime);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 40 | `       flight.setEconomyFare(economyFare);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 41 | `       flight.setPremiumFare(premiumFare != null ? premiumFare : businessFare);` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 42 | `       flight.setFirstFare(firstFare);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 43 | `       flight.setSeatCount(seatCount);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 44 | `       flight.setSeatRows(seatRows);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 45 | `       flight.setSeatColumns(seatColumns);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 46 | `       flight.setSeatAisleAfter(seatAisleAfter);` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 47 | `       flight.setFlightStatus(flightStatus != null ? flightStatus : FlightStatus.SCHEDULED);` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 48 | `       return flight;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 49 | `   }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 50 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 51 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/ResponseData.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `public class ResponseData<T> {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 4 | `    private T data;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 5 | `    private boolean success;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 6 | `    private String message;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 8 | `    public ResponseData() {}` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 10 | `    public ResponseData(T data, boolean success, String message) {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 11 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 12 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 13 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 14 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 15 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    public T getData() {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 17 | `        return data;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 18 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 19 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public void setData(T data) {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 21 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 22 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 24 | `    public boolean isSuccess() {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 25 | `        return success;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 26 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public void setSuccess(boolean success) {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 29 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 30 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 31 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 32 | `    public String getMessage() {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 33 | `        return message;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 34 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 35 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 36 | `    public void setMessage(String message) {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 37 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Flight Service workflow. |
| 38 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/dto/ScheduleUpdateRequest.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.dto;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 5 | `import lombok.Getter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `import lombok.Setter;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 9 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `public class ScheduleUpdateRequest {` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 14 | `    private String departureTime;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 15 | `    private String arrivalTime;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 16 | `    private FlightStatus flightStatus;` | this statement participates in the Flight Service Request/response data contract behavior described for this file. |
| 17 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/exception/FlightException.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.exception;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 4 | `import org.springframework.web.server.ResponseStatusException;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 5 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 6 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 7 | ` * Domain exception for flight-related errors.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 8 | ` * Extends {@link ResponseStatusException} so it is handled by` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 9 | ` * {@link GlobalExceptionHandler} and mapped to an HTTP response.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 10 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 11 | `public class FlightException extends ResponseStatusException {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 12 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 13 | `    /** Defaults to HTTP 400 (Bad Request) with the given message. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 14 | `    public FlightException(String message) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 15 | `        super(HttpStatus.BAD_REQUEST, message);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 16 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 17 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 18 | `    /** Uses the supplied status and message. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 19 | `    public FlightException(HttpStatus status, String message) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 20 | `        super(status, message);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 21 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 22 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/exception/GlobalExceptionHandler.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.exception;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.dto.ResponseData;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 4 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 5 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 6 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 7 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 8 | `import org.springframework.web.bind.annotation.ExceptionHandler;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 9 | `import org.springframework.web.bind.annotation.RestControllerAdvice;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 11 | `@RestControllerAdvice` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class GlobalExceptionHandler {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 14 | `    private final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);` | calculates or assigns data needed by this Error-to-HTTP translation in the Flight Service workflow. |
| 15 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 16 | `    @ExceptionHandler(NoDataFoundException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 17 | `    public ResponseEntity<ResponseData<Object>> handleNoDataFoundException(NoDataFoundException e) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 18 | `        logger.warn("No Data Found", e);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 19 | `        return ResponseEntity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 20 | `                .status(HttpStatus.NOT_FOUND)` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 21 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 22 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 24 | `    @ExceptionHandler(IllegalArgumentException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    public ResponseEntity<ResponseData<Object>> handleIllegalArgumentException(IllegalArgumentException e) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 26 | `        logger.warn("Invalid Argument", e);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 27 | `        return ResponseEntity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 28 | `                .status(HttpStatus.BAD_REQUEST)` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 29 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 30 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 31 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 32 | `    @ExceptionHandler(java.util.NoSuchElementException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public ResponseEntity<ResponseData<Object>> handleNoSuchElementException(java.util.NoSuchElementException e) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 34 | `        logger.warn("Element not found", e);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 35 | `        return ResponseEntity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 36 | `                .status(HttpStatus.NOT_FOUND)` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 37 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 38 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 40 | `    @ExceptionHandler(IllegalStateException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 41 | `    public ResponseEntity<ResponseData<Object>> handleIllegalStateException(IllegalStateException e) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 42 | `        logger.warn("Invalid State", e);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 43 | `        return ResponseEntity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `                .status(HttpStatus.CONFLICT)` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 45 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 46 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 47 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 48 | `    @ExceptionHandler(Exception.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 49 | `    public ResponseEntity<ResponseData<Object>> handleGeneric(Exception e) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 50 | `        logger.error("Internal Server Error", e);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 51 | `        return ResponseEntity` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 52 | `                .status(HttpStatus.INTERNAL_SERVER_ERROR)` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 53 | `                .body(new ResponseData<>(null, false, "Internal Server Error : " + e.getMessage()));` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 54 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 55 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/exception/NoDataFoundException.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.exception;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `public class NoDataFoundException extends RuntimeException {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 4 | `    public NoDataFoundException(String message) {` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 5 | `        super(message);` | this statement participates in the Flight Service Error-to-HTTP translation behavior described for this file. |
| 6 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/FlightServiceApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 6 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 7 | `public class FlightServiceApplication {` | this statement participates in the Flight Service Service bootstrap behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the Flight Service application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    public static void main(String[] args) {` | this statement participates in the Flight Service Service bootstrap behavior described for this file. |
| 10 | `        SpringApplication.run(FlightServiceApplication.class, args);` | this statement participates in the Flight Service Service bootstrap behavior described for this file. |
| 11 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 12 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 13 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/Flight.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.Data;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.Getter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `import lombok.Setter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 9 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@Table(name = "Flights") // Matches the SQL case-sensitivity schema` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class Flight {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 14 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 16 | `    @Column(name = "flightId") // Aligns with flightId (PK) in schema doc` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    private Long flightId;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 19 | `    @Column(name = "flightNumber", nullable = false, unique = true, length = 20)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `    private String flightNumber;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 22 | `    @Column(name = "flight_name")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    private String flightName;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 25 | `    @Column(name = "origin", length = 50)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    private String origin;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 27 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 28 | `    @Column(name = "destination", length = 50)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 29 | `    private String destination;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 30 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 31 | `    @Column(name = "distance_miles")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 32 | `    private Double distanceMiles;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 33 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 34 | `    @Column(name = "departureTime") // Aligns with departureTime DATETIME schema field` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 35 | `    private String departureTime;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 36 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 37 | `    @Column(name = "arrivalTime") // Aligns with arrivalTime DATETIME schema field` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 38 | `    private String arrivalTime;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 39 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 40 | `    // Standardized to 'Double' object wrapper to safely allow handling NULL values` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 41 | `    @Column(name = "fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 42 | `    private Double fare;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 43 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 44 | `    @Column(name = "economy_fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 45 | `    private Double economyFare;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 46 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 47 | `    @Column(name = "premium_fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 48 | `    private Double premiumFare;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 49 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 50 | `    @Column(name = "first_fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 51 | `    private Double firstFare;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 52 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 53 | `    @Enumerated(EnumType.STRING)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 54 | `    @Column(name = "flightStatus")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 55 | `    private FlightStatus flightStatus;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 56 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 57 | `    // Cabin and seating layout components` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 58 | `    @Column(name = "seat_count")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 59 | `    private Integer seatCount;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 60 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 61 | `    @Column(name = "seat_rows")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 62 | `    private Integer seatRows;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 63 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 64 | `    @Column(name = "seat_columns")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 65 | `    private Integer seatColumns;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 66 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 67 | `    @Column(name = "seat_aisle_after")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 68 | `    private Integer seatAisleAfter;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 69 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 70 | `    // Transient attributes: excluded from DB storage, reserved for external system integrations` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 71 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 72 | `    private Integer airlineId;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 73 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 74 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 75 | `    private String airlineName;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 76 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 77 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 78 | `    private Integer availableSeats; // Added to resolve BookingServiceImpl calculation requirements` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 79 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 80 | `    // Default Constructor` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 81 | `    public Flight() {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 82 | `        this.flightStatus = FlightStatus.SCHEDULED;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 83 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 84 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 85 | `    // Comprehensive Argument Constructor for service initialization tasks` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 86 | `    public Flight(String flightNumber, String origin, String destination,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 87 | `                  String departureTime, String arrivalTime, Double fare, FlightStatus flightStatus) {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 88 | `        this.flightNumber = flightNumber;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 89 | `        this.origin = origin;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 90 | `        this.destination = destination;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 91 | `        this.departureTime = departureTime;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 92 | `        this.arrivalTime = arrivalTime;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 93 | `        this.fare = fare;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 94 | `        this.flightStatus = (flightStatus != null) ? flightStatus : FlightStatus.SCHEDULED;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 95 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 96 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/FlightStatus.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `public enum FlightStatus {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 4 | `    SCHEDULED,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 5 | `    BOARDING,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 6 | `    DEPARTED,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 7 | `    ARRIVED,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 8 | `    CANCELLED` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 9 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/IndianAirports.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import java.util.List;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `public final class IndianAirports {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 6 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 7 | `    public record Airport(String code, String city) {}` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    private IndianAirports() {}` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    public static final List<Airport> AIRPORTS = List.of(` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 12 | `            new Airport("DEL", "Delhi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 13 | `            new Airport("BOM", "Mumbai"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 14 | `            new Airport("BLR", "Bengaluru"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 15 | `            new Airport("MAA", "Chennai"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 16 | `            new Airport("CCU", "Kolkata"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 17 | `            new Airport("HYD", "Hyderabad"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 18 | `            new Airport("COK", "Kochi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 19 | `            new Airport("AMD", "Ahmedabad"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 20 | `            new Airport("PNQ", "Pune"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 21 | `            new Airport("GOI", "Goa (Dabolim)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 22 | `            new Airport("GOX", "Goa (Mopa)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 23 | `            new Airport("JAI", "Jaipur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 24 | `            new Airport("LKO", "Lucknow"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 25 | `            new Airport("PAT", "Patna"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 26 | `            new Airport("TRV", "Thiruvananthapuram"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 27 | `            new Airport("CCJ", "Kozhikode"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 28 | `            new Airport("IXC", "Chandigarh"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 29 | `            new Airport("NAG", "Nagpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 30 | `            new Airport("VNS", "Varanasi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 31 | `            new Airport("BBI", "Bhubaneswar"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 32 | `            new Airport("GAU", "Guwahati"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 33 | `            new Airport("IXB", "Bagdogra"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 34 | `            new Airport("SXR", "Srinagar"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 35 | `            new Airport("IXJ", "Jammu"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 36 | `            new Airport("ATQ", "Amritsar"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 37 | `            new Airport("IDR", "Indore"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 38 | `            new Airport("BHO", "Bhopal"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 39 | `            new Airport("RPR", "Raipur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 40 | `            new Airport("VTZ", "Visakhapatnam"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 41 | `            new Airport("VGA", "Vijayawada"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 42 | `            new Airport("TIR", "Tirupati"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 43 | `            new Airport("CJB", "Coimbatore"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 44 | `            new Airport("IXM", "Madurai"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 45 | `            new Airport("TRZ", "Tiruchirappalli"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 46 | `            new Airport("MLR", "Mangaluru"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 47 | `            new Airport("IXE", "Mangalore"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 48 | `            new Airport("HBX", "Hubli"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 49 | `            new Airport("IXR", "Ranchi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 50 | `            new Airport("DBR", "Dehradun"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 51 | `            new Airport("DED", "Dehradun (Jolly Grant)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 52 | `            new Airport("IXA", "Agartala"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 53 | `            new Airport("IMF", "Imphal"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 54 | `            new Airport("DIB", "Dibrugarh"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 55 | `            new Airport("JLR", "Jabalpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 56 | `            new Airport("UDR", "Udaipur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 57 | `            new Airport("JDH", "Jodhpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 58 | `            new Airport("STV", "Surat"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 59 | `            new Airport("RAJ", "Rajkot"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 60 | `            new Airport("BDQ", "Vadodara"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 61 | `            new Airport("KNU", "Kanpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 62 | `            new Airport("GWL", "Gwalior"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 63 | `            new Airport("AYJ", "Ayodhya"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 64 | `            new Airport("PGH", "Prayagraj"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 65 | `            new Airport("IXZ", "Port Blair"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 66 | `            new Airport("LEH", "Leh"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 67 | `            new Airport("SAG", "Shirdi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 68 | `            new Airport("KLH", "Kolhapur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 69 | `            new Airport("IXU", "Aurangabad"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 70 | `            new Airport("NDC", "Nanded"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 71 | `            new Airport("BEK", "Bareilly"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 72 | `            new Airport("AGR", "Agra"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 73 | `            new Airport("DHM", "Dharamshala"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 74 | `            new Airport("KUU", "Kullu"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 75 | `            new Airport("SLV", "Shimla"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 76 | `            new Airport("PYG", "Pakyong (Gangtok)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 77 | `            new Airport("TEZ", "Tezpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 78 | `            new Airport("JRH", "Jorhat"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 79 | `            new Airport("SHL", "Shillong"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 80 | `            new Airport("DMU", "Dimapur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 81 | `            new Airport("AJL", "Aizawl"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 82 | `            new Airport("RUP", "Rupsi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 83 | `            new Airport("HSS", "Hisar")` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 84 | `    );` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 85 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 86 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/InternationalAirports.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.IndianAirports.Airport;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `import java.util.List;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 7 | `public final class InternationalAirports {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    private InternationalAirports() {}` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    public static final List<Airport> AIRPORTS = List.of(` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 12 | `            new Airport("AMS", "Amsterdam (Schiphol)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 13 | `            new Airport("AUH", "Abu Dhabi"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 14 | `            new Airport("BKK", "Bangkok"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 15 | `            new Airport("CDG", "Paris (Charles de Gaulle)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 16 | `            new Airport("DOH", "Doha"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 17 | `            new Airport("DXB", "Dubai"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 18 | `            new Airport("FCO", "Rome (Fiumicino)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 19 | `            new Airport("FRA", "Frankfurt"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 20 | `            new Airport("HKG", "Hong Kong"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 21 | `            new Airport("HND", "Tokyo (Haneda)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 22 | `            new Airport("ICN", "Seoul (Incheon)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 23 | `            new Airport("IST", "Istanbul"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 24 | `            new Airport("JFK", "New York (JFK)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 25 | `            new Airport("KUL", "Kuala Lumpur"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 26 | `            new Airport("LAX", "Los Angeles"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 27 | `            new Airport("LHR", "London Heathrow"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 28 | `            new Airport("MAD", "Madrid"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 29 | `            new Airport("MEL", "Melbourne"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 30 | `            new Airport("NRT", "Tokyo (Narita)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 31 | `            new Airport("ORD", "Chicago (O'Hare)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 32 | `            new Airport("SFO", "San Francisco"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 33 | `            new Airport("SIN", "Singapore (Changi)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 34 | `            new Airport("SYD", "Sydney"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 35 | `            new Airport("YVR", "Vancouver"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 36 | `            new Airport("YYZ", "Toronto (Pearson)"),` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 37 | `            new Airport("ZRH", "Zurich")` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 38 | `    );` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 39 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/SeatInventory.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.Getter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `import lombok.Setter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 9 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@Table(name = "seat_inventory")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `public class SeatInventory {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 17 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `    private Long id;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 21 | `    @ManyToOne(fetch = FetchType.LAZY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    @JoinColumn(name = "flight_id", nullable = false, foreignKey = @ForeignKey(name = "FK_seat_inventory_flight_fs"))` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    private Flight flight;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 25 | `    @Column(name = "seat_number", length = 10, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    private String seatNumber;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 27 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 28 | `    @Column(name = "column_letter", length = 5, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 29 | `    private String columnLetter;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 30 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 31 | `    @Column(name = "seat_row", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 32 | `    private Integer seatRow;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 33 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 34 | `    @Enumerated(EnumType.STRING)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 35 | `    @Column(name = "seat_status", length = 20, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 36 | `    private SeatStatus seatStatus = SeatStatus.AVAILABLE;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 37 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 38 | `    @Version` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 39 | `    @Column(name = "version", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 40 | `    private Long version;` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 41 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 42 | `    // Helper Compatibility Layer: Safely extracts flightId for systems expecting flat integers` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 43 | `    public Integer getFlightId() {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 44 | `        return (this.flight != null) ? this.flight.getFlightId().intValue() : null;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 45 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 46 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 47 | `    // Helper Compatibility Layer: Sets flight reference based on ID without breaking encapsulation` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 48 | `    public void setFlightId(Integer flightId) {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 49 | `        if (flightId != null) {` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 50 | `            if (this.flight == null) {` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 51 | `                this.flight = new Flight();` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 52 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 53 | `            this.flight.setFlightId(flightId.longValue());` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 54 | `        } else {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 55 | `            this.flight = null;` | calculates or assigns data needed by this Database/domain model in the Flight Service workflow. |
| 56 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 57 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 58 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/model/SeatStatus.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Flight Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.model;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `public enum SeatStatus {` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 4 | `    AVAILABLE,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 5 | `    BOOKED,` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 6 | `    BLOCKED` | this statement participates in the Flight Service Database/domain model behavior described for this file. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/repository/FlightRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.repository;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.Flight;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 8 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `public interface FlightRepository extends JpaRepository<Flight, Long> {` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 11 | `    Optional<Flight> findByFlightNumberIgnoreCase(String flightNumber);` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 12 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/repository/SeatInventoryRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.repository;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.SeatInventory;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.flight.model.SeatStatus;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `import org.springframework.data.jpa.repository.Query;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 7 | `import org.springframework.data.repository.query.Param;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 10 | `import java.util.List;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 11 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 13 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public interface SeatInventoryRepository extends JpaRepository<SeatInventory, Long> {` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 16 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    List<SeatInventory> findByFlightId(@Param("flightId") Integer flightId);` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 19 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId ORDER BY s.seatNumber ASC")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `    List<SeatInventory> findByFlightIdOrderBySeatNumberAsc(@Param("flightId") Integer flightId);` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 22 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId AND s.seatStatus = :seatStatus")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    List<SeatInventory> findByFlightIdAndSeatStatus(@Param("flightId") Integer flightId, @Param("seatStatus") SeatStatus seatStatus);` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 25 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flight.flightId = :flightId AND s.seatNumber = :seatNumber")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    Optional<SeatInventory> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);` | this statement participates in the Flight Service Persistence/repository layer behavior described for this file. |
| 27 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/service/AirportDistanceService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Flight Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.service;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 5 | `import java.util.Map;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 7 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 8 | ` * Computes the great-circle distance (in statute miles) between two airports` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 9 | ` * using the Haversine formula. Airport coordinates are held in a small,` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 10 | ` * self-contained registry keyed by IATA code so the flight service does not` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 11 | ` * depend on any external data source.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 12 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 13 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class AirportDistanceService {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 16 | `    /** Mean radius of the Earth in miles. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 17 | `    private static final double EARTH_RADIUS_MILES = 3958.7613;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 18 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 19 | `    /** IATA code -> { latitude, longitude } in decimal degrees. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    private static final Map<String, double[]> AIRPORTS = Map.ofEntries(` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 21 | `            // --- India ---` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 22 | `            Map.entry("DEL", new double[]{28.5562, 77.1000}),  // Delhi` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 23 | `            Map.entry("BOM", new double[]{19.0896, 72.8656}),  // Mumbai` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 24 | `            Map.entry("BLR", new double[]{13.1986, 77.7066}),  // Bengaluru` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 25 | `            Map.entry("MAA", new double[]{12.9941, 80.1709}),  // Chennai` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 26 | `            Map.entry("HYD", new double[]{17.2403, 78.4294}),  // Hyderabad` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 27 | `            Map.entry("CCU", new double[]{22.6547, 88.4467}),  // Kolkata` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 28 | `            Map.entry("COK", new double[]{10.1520, 76.4019}),  // Kochi` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 29 | `            Map.entry("GOI", new double[]{15.3808, 73.8314}),  // Goa` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 30 | `            Map.entry("PNQ", new double[]{18.5793, 73.9089}),  // Pune` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 31 | `            Map.entry("AMD", new double[]{23.0772, 72.6347}),  // Ahmedabad` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 32 | `            // --- North America ---` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 33 | `            Map.entry("JFK", new double[]{40.6413, -73.7781}), // New York` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 34 | `            Map.entry("LAX", new double[]{33.9416, -118.4085}),// Los Angeles` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 35 | `            Map.entry("ORD", new double[]{41.9742, -87.9073}), // Chicago` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 36 | `            Map.entry("ATL", new double[]{33.6407, -84.4277}), // Atlanta` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 37 | `            Map.entry("DFW", new double[]{32.8998, -97.0403}), // Dallas` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 38 | `            Map.entry("SFO", new double[]{37.6213, -122.3790}),// San Francisco` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 39 | `            Map.entry("SEA", new double[]{47.4502, -122.3088}),// Seattle` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 40 | `            Map.entry("MIA", new double[]{25.7959, -80.2870}), // Miami` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 41 | `            Map.entry("BOS", new double[]{42.3656, -71.0096}), // Boston` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 42 | `            Map.entry("YYZ", new double[]{43.6777, -79.6248}), // Toronto` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 43 | `            // --- Europe ---` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 44 | `            Map.entry("LHR", new double[]{51.4700, -0.4543}),  // London Heathrow` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 45 | `            Map.entry("CDG", new double[]{49.0097, 2.5479}),   // Paris` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 46 | `            Map.entry("FRA", new double[]{50.0379, 8.5622}),   // Frankfurt` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 47 | `            Map.entry("AMS", new double[]{52.3105, 4.7683}),   // Amsterdam` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 48 | `            Map.entry("MAD", new double[]{40.4839, -3.5680}),  // Madrid` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 49 | `            Map.entry("FCO", new double[]{41.8003, 12.2389}),  // Rome` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 50 | `            // --- Middle East / Asia / Oceania ---` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 51 | `            Map.entry("DXB", new double[]{25.2532, 55.3657}),  // Dubai` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 52 | `            Map.entry("DOH", new double[]{25.2731, 51.6080}),  // Doha` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 53 | `            Map.entry("SIN", new double[]{1.3644, 103.9915}),  // Singapore` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 54 | `            Map.entry("HKG", new double[]{22.3080, 113.9185}), // Hong Kong` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 55 | `            Map.entry("NRT", new double[]{35.7720, 140.3929}), // Tokyo Narita` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 56 | `            Map.entry("ICN", new double[]{37.4602, 126.4407}), // Seoul` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 57 | `            Map.entry("SYD", new double[]{-33.9399, 151.1753}) // Sydney` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 58 | `    );` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 59 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 60 | `    /**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 61 | `     * Returns the distance between two airports in miles, rounded to one decimal.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 62 | `     *` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 63 | `     * @param origin      origin IATA code (case-insensitive)` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 64 | `     * @param destination destination IATA code (case-insensitive)` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 65 | `     */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 66 | `    public double distanceMiles(String origin, String destination) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 67 | `        double[] from = coordinatesFor(origin);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 68 | `        double[] to = coordinatesFor(destination);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 69 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 70 | `        double lat1 = Math.toRadians(from[0]);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 71 | `        double lat2 = Math.toRadians(to[0]);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 72 | `        double deltaLat = Math.toRadians(to[0] - from[0]);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 73 | `        double deltaLon = Math.toRadians(to[1] - from[1]);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 74 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 75 | `        double a = Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2)` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 76 | `                + Math.cos(lat1) * Math.cos(lat2)` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 77 | `                * Math.sin(deltaLon / 2) * Math.sin(deltaLon / 2);` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 78 | `        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 79 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 80 | `        double miles = EARTH_RADIUS_MILES * c;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 81 | `        return Math.round(miles * 10.0) / 10.0;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 82 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 83 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 84 | `    public boolean isKnownAirport(String code) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 85 | `        return code != null && AIRPORTS.containsKey(code.trim().toUpperCase());` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 86 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 87 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 88 | `    private double[] coordinatesFor(String code) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 89 | `        if (code == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 90 | `            throw new IllegalArgumentException("Airport code must not be null");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 91 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 92 | `        double[] coords = AIRPORTS.get(code.trim().toUpperCase());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 93 | `        if (coords == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 94 | `            throw new IllegalArgumentException(` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 95 | `                    "Unknown airport code '" + code + "'. Coordinates are not available.");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 96 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 97 | `        return coords;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 98 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 99 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 100 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/service/FlightService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Flight Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.service;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.model.Flight;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 6 | `import java.util.List;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `import java.util.Optional;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 9 | `public interface FlightService {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 11 | `    List<Flight> getAllFlights();` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 12 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 13 | `    Optional<Flight> getFlightDetails(String flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 15 | `    Flight getFlight(Long flightId);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 17 | `    void addFlight(Flight flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 19 | `    void deleteFlight(String flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 21 | `    void updateSchedule(String flightNumber, String departureTime, String arrivalTime, FlightStatus flightStatus);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 22 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 23 | `    void setFares(String flightNumber, double economyFare, double premiumFare, double firstFare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 25 | `    void setFareClass(String flightNumber, double fare, String fareClass);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 27 | `    Flight findByFlightNumberOrId(String identifier);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 29 | `    List<Flight> searchAvailableFlights(String from, String to, String date, String type, Integer passengers);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 30 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/java/com/genc/arfoms/flight/service/FlightServiceImpl.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Flight Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.flight.service;` | places this code in the ARFOMS Flight Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.flight.exception.FlightException;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.flight.model.Flight;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.flight.model.IndianAirports;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.flight.model.InternationalAirports;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `import com.genc.arfoms.flight.model.SeatInventory;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 8 | `import com.genc.arfoms.flight.model.FlightStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 9 | `import com.genc.arfoms.flight.model.SeatStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 10 | `import com.genc.arfoms.flight.repository.FlightRepository;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 11 | `import com.genc.arfoms.flight.repository.SeatInventoryRepository;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 12 | `import jakarta.annotation.PostConstruct;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 13 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 14 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 15 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 16 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 17 | `import org.springframework.transaction.annotation.Transactional;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 18 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 19 | `import java.time.Duration;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 20 | `import java.time.LocalDate;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 21 | `import java.time.LocalDateTime;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 22 | `import java.time.ZoneId;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 23 | `import java.time.format.DateTimeFormatter;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 24 | `import java.time.format.DateTimeParseException;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 25 | `import java.util.*;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 26 | `import java.util.stream.Collectors;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 27 | `import java.util.stream.Stream;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 28 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 29 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 30 | `@Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 31 | `public class FlightServiceImpl implements FlightService {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 32 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    private static final Logger log = LoggerFactory.getLogger(FlightServiceImpl.class);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 34 | `    private static final DateTimeFormatter INPUT_DATE_TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 35 | `    private static final DateTimeFormatter OUTPUT_DATE_TIME_FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 36 | `    private static final double EARTH_RADIUS_MILES = 3958.8;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 37 | `    private static final double DEFAULT_CRUISE_SPEED_MPH = 510.0;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 38 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 39 | `    private static final Set<String> VALID_AIRPORT_CODES = Stream.concat(` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 40 | `                    IndianAirports.AIRPORTS.stream(),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 41 | `                    InternationalAirports.AIRPORTS.stream()` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 42 | `            )` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 43 | `            .map(IndianAirports.Airport::code)` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 44 | `            .collect(Collectors.toUnmodifiableSet());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 45 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    private static final Map<String, GeoPoint> AIRPORT_COORDINATES = Map.ofEntries(` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 47 | `            Map.entry("DEL", new GeoPoint(28.5562, 77.1000)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 48 | `            Map.entry("BOM", new GeoPoint(19.0896, 72.8656)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 49 | `            Map.entry("BLR", new GeoPoint(13.1986, 77.7066)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 50 | `            Map.entry("MAA", new GeoPoint(12.9941, 80.1709)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 51 | `            Map.entry("CCU", new GeoPoint(22.6547, 88.4467)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 52 | `            Map.entry("HYD", new GeoPoint(17.2403, 78.4294)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 53 | `            Map.entry("COK", new GeoPoint(10.1520, 76.4019)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 54 | `            Map.entry("AMD", new GeoPoint(23.0772, 72.6347)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 55 | `            Map.entry("PNQ", new GeoPoint(18.5821, 73.9197)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 56 | `            Map.entry("GOI", new GeoPoint(15.3808, 73.8314)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 57 | `            Map.entry("GOX", new GeoPoint(15.7368, 73.8606)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 58 | `            Map.entry("TRV", new GeoPoint(8.4821, 76.9201)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 59 | `            Map.entry("IXC", new GeoPoint(30.6735, 76.7885)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 60 | `            Map.entry("ATQ", new GeoPoint(31.7096, 74.7973)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 61 | `            Map.entry("SXR", new GeoPoint(33.9871, 74.7742)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 62 | `            Map.entry("IXJ", new GeoPoint(32.6891, 74.8374)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 63 | `            Map.entry("BBI", new GeoPoint(20.2444, 85.8178)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 64 | `            Map.entry("GAU", new GeoPoint(26.1061, 91.5859)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 65 | `            Map.entry("IXZ", new GeoPoint(11.6412, 92.7297)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 66 | `            Map.entry("DXB", new GeoPoint(25.2532, 55.3657)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 67 | `            Map.entry("AUH", new GeoPoint(24.4330, 54.6511)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 68 | `            Map.entry("DOH", new GeoPoint(25.2731, 51.6081)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 69 | `            Map.entry("LHR", new GeoPoint(51.4700, -0.4543)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 70 | `            Map.entry("CDG", new GeoPoint(49.0097, 2.5479)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 71 | `            Map.entry("JFK", new GeoPoint(40.6413, -73.7781)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 72 | `            Map.entry("SIN", new GeoPoint(1.3644, 103.9915)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 73 | `            Map.entry("HKG", new GeoPoint(22.3080, 113.9185)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 74 | `            Map.entry("BKK", new GeoPoint(13.6900, 100.7501)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 75 | `            Map.entry("FRA", new GeoPoint(50.0379, 8.5622)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 76 | `            Map.entry("AMS", new GeoPoint(52.3105, 4.7683)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 77 | `            Map.entry("MAD", new GeoPoint(40.4983, -3.5676)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 78 | `            Map.entry("FCO", new GeoPoint(41.8003, 12.2389)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 79 | `            Map.entry("IST", new GeoPoint(41.2753, 28.7519)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 80 | `            Map.entry("ZRH", new GeoPoint(47.4581, 8.5555)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 81 | `            Map.entry("NRT", new GeoPoint(35.7720, 140.3929)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 82 | `            Map.entry("HND", new GeoPoint(35.5494, 139.7798)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 83 | `            Map.entry("ICN", new GeoPoint(37.4602, 126.4407)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 84 | `            Map.entry("KUL", new GeoPoint(2.7456, 101.7099)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 85 | `            Map.entry("SYD", new GeoPoint(-33.9399, 151.1753)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 86 | `            Map.entry("MEL", new GeoPoint(-37.6690, 144.8410)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 87 | `            Map.entry("LAX", new GeoPoint(33.9416, -118.4085)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 88 | `            Map.entry("SFO", new GeoPoint(37.6213, -122.3790)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 89 | `            Map.entry("ORD", new GeoPoint(41.9742, -87.9073)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 90 | `            Map.entry("YYZ", new GeoPoint(43.6777, -79.6248)),` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 91 | `            Map.entry("YVR", new GeoPoint(49.1967, -123.1815))` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 92 | `    );` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 93 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 94 | `    private final FlightRepository flightRepository;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 95 | `    private final SeatInventoryRepository seatInventoryRepository;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 96 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 97 | `    public FlightServiceImpl(FlightRepository flightRepository, SeatInventoryRepository seatInventoryRepository) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 98 | `        this.flightRepository = flightRepository;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 99 | `        this.seatInventoryRepository = seatInventoryRepository;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 100 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 101 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 102 | `    @PostConstruct` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this maintains the seat rows/counts for each flight. Booking uses those availability facts to avoid selling a seat that is already taken.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 103 | `    public void seedSeatInventoryIfRequested() {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 104 | `        String seedFlag = System.getProperty("seed.seats");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 105 | `        if (!"true".equalsIgnoreCase(seedFlag)) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 106 | `            return; // no-op unless explicitly requested` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 107 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 108 | `        String fidStr = System.getProperty("seed.flightId", "1");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 109 | `        Long flightId;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 110 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 111 | `            flightId = Long.parseLong(fidStr);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 112 | `        } catch (NumberFormatException ex) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 113 | `            log.warn("Invalid seed.flightId '{}', aborting seeding", fidStr);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 114 | `            return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 115 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 116 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 117 | `        Optional<Flight> flightOpt = flightRepository.findById(flightId);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 118 | `        if (flightOpt.isEmpty()) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 119 | `            log.warn("No flight found for id {} - cannot seed seats", flightId);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 120 | `            return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 121 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 122 | `        Flight flight = flightOpt.get();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 123 | `        int rows = flight.getSeatRows() != null ? flight.getSeatRows() : 0;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 124 | `        int cols = flight.getSeatColumns() != null ? flight.getSeatColumns() : 0;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 125 | `        if (rows < 1 \\|\\| cols < 1) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 126 | `            log.warn("Flight {} has invalid seatRows/seatColumns ({} / {}) - skipping seeding", flight.getFlightNumber(), rows, cols);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 127 | `            return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 128 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 129 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 130 | `        // check existing inventory` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 131 | `        List<SeatInventory> existing = seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(flight.getFlightId().intValue());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 132 | `        if (!existing.isEmpty()) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 133 | `            log.info("Flight {} already has {} seat inventory rows - skipping seeding", flight.getFlightNumber(), existing.size());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 134 | `            return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 135 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 136 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 137 | `        List<SeatInventory> seats = new ArrayList<>();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 138 | `        for (int r = 0; r < rows; r++) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 139 | `            String rowLabel = rowLetter(r);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 140 | `            for (int c = 1; c <= cols; c++) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 141 | `                SeatInventory seat = new SeatInventory();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 142 | `                seat.setFlight(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 143 | `                seat.setSeatNumber(rowLabel + c);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 144 | `                seat.setColumnLetter(rowLabel);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 145 | `                seat.setSeatRow(r + 1);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 146 | `                seat.setSeatStatus(SeatStatus.AVAILABLE);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 147 | `                seats.add(seat);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 148 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 149 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 150 | `        seatInventoryRepository.saveAll(seats);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 151 | `        log.info("Seeded {} seats for flight {} (id={})", seats.size(), flight.getFlightNumber(), flightId);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 152 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 153 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 154 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 155 | `    @Transactional(readOnly = true)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Flight Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 156 | `    public List<Flight> getAllFlights() {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 157 | `        return flightRepository.findAll();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 158 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 159 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 160 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 161 | `    @Transactional(readOnly = true)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 162 | `    public Optional<Flight> getFlightDetails(String flightNumber) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 163 | `        validateFlightNumber(flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 164 | `        return flightRepository.findByFlightNumberIgnoreCase(flightNumber);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 165 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 166 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 167 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 168 | `    @Transactional(readOnly = true)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 169 | `    public Flight getFlight(Long flightId) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 170 | `        if (flightId == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 171 | `            return null;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 172 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 173 | `        return flightRepository.findById(flightId).orElse(null);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 174 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 175 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 176 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 177 | `    public void addFlight(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 178 | `        validateNewFlight(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 179 | `        String normalizedOrigin = normalizeAirportCode(flight.getOrigin(), "origin");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 180 | `        String normalizedDestination = normalizeAirportCode(flight.getDestination(), "destination");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 181 | `        validateDistinctRoute(normalizedOrigin, normalizedDestination);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 182 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 183 | `        flight.setFlightNumber(flight.getFlightNumber().trim());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 184 | `        flight.setOrigin(normalizedOrigin);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 185 | `        flight.setDestination(normalizedDestination);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 186 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 187 | `        flight.setDepartureTime(normalizeDateTime(flight.getDepartureTime(), "departureTime"));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 188 | `        flight.setArrivalTime(normalizeDateTime(flight.getArrivalTime(), "arrivalTime"));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 189 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 190 | `        validateNotInPast(flight.getDepartureTime(), "departureTime");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 191 | `        validateScheduleOrder(flight.getDepartureTime(), flight.getArrivalTime());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 192 | `        flight.setDistanceMiles(calculateRouteDistanceMiles(flight));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 193 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 194 | `        if (flight.getFlightStatus() == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 195 | `            flight.setFlightStatus(FlightStatus.SCHEDULED);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 196 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 197 | `        if (flight.getEconomyFare() == null \\|\\| flight.getPremiumFare() == null \\|\\| flight.getFirstFare() == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 198 | `            throw new FlightException("All fare fields are required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 199 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 200 | `        validateFare(flight.getEconomyFare(), "economyFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 201 | `        validateFare(flight.getPremiumFare(), "premiumFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 202 | `        validateFare(flight.getFirstFare(), "firstFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 203 | `        flight.setFare(flight.getEconomyFare());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 204 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 205 | `        flightRepository.findByFlightNumberIgnoreCase(flight.getFlightNumber())` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 206 | `                .ifPresent(existing -> {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 207 | `                    throw new FlightException(HttpStatus.CONFLICT, "Flight with number " + flight.getFlightNumber() + " already exists");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 208 | `                });` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 209 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 210 | `        Flight saved = flightRepository.save(flight);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 211 | `        createSeatInventory(saved);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 212 | `        log.info("Added flight {} ({} -> {})", saved.getFlightNumber(), saved.getOrigin(), saved.getDestination());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 213 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 214 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this maintains the seat rows/counts for each flight. Booking uses those availability facts to avoid selling a seat that is already taken.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 215 | `    private void createSeatInventory(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 216 | `        Integer rows = flight.getSeatRows();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 217 | `        Integer cols = flight.getSeatColumns();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 218 | `        if (flight.getFlightId() == null \\|\\| rows == null \\|\\| cols == null \\|\\| rows < 1 \\|\\| cols < 1) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 219 | `            return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 220 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 221 | `        List<SeatInventory> seats = new ArrayList<>();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 222 | `        for (int r = 0; r < rows; r++) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 223 | `            String rowLabel = rowLetter(r);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 224 | `            for (int c = 1; c <= cols; c++) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 225 | `                SeatInventory seat = new SeatInventory();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 226 | `                seat.setFlight(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 227 | `                seat.setSeatNumber(rowLabel + c);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 228 | `                seat.setColumnLetter(rowLabel);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 229 | `                seat.setSeatRow(r + 1);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 230 | `                seat.setSeatStatus(SeatStatus.AVAILABLE);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 231 | `                seats.add(seat);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 232 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 233 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 234 | `        seatInventoryRepository.saveAll(seats);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 235 | `        log.info("Created {} seat(s) for flight {}", seats.size(), flight.getFlightNumber());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 236 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 237 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 238 | `    private static String rowLetter(int index) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 239 | `        StringBuilder label = new StringBuilder();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 240 | `        int n = index;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 241 | `        do {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 242 | `            label.insert(0, (char) ('A' + (n % 26)));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 243 | `            n = n / 26 - 1;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 244 | `        } while (n >= 0);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 245 | `        return label.toString();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 246 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 247 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 248 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 249 | `    public void deleteFlight(String flightNumber) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 250 | `        validateFlightNumber(flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 251 | `        Flight flight = findByFlightNumberOrThrow(flightNumber);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 252 | `        if (flight.getFlightId() != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 253 | `            List<SeatInventory> seats =` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 254 | `                    seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(flight.getFlightId().intValue());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 255 | `            if (!seats.isEmpty()) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 256 | `                seatInventoryRepository.deleteAll(seats);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 257 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 258 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 259 | `        flightRepository.delete(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 260 | `        log.info("Deleted flight {}", flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 261 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 262 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 263 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 264 | `    public void updateSchedule(String flightNumber, String departureTime, String arrivalTime, FlightStatus flightStatus) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 265 | `        validateFlightNumber(flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 266 | `        Flight flight = findByFlightNumberOrThrow(flightNumber);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 267 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 268 | `        if (departureTime != null && !departureTime.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 269 | `            flight.setDepartureTime(normalizeDateTime(departureTime, "departureTime"));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 270 | `            validateNotInPast(flight.getDepartureTime(), "departureTime");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 271 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 272 | `        if (arrivalTime != null && !arrivalTime.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 273 | `            flight.setArrivalTime(normalizeDateTime(arrivalTime, "arrivalTime"));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 274 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 275 | `        validateScheduleOrder(flight.getDepartureTime(), flight.getArrivalTime());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 276 | `        flight.setDistanceMiles(calculateRouteDistanceMiles(flight));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 277 | `        if (flightStatus != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 278 | `            flight.setFlightStatus(flightStatus);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 279 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 280 | `        flightRepository.save(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 281 | `        log.info("Updated schedule for flight {}", flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 282 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 283 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 284 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 285 | `    public void setFares(String flightNumber, double economyFare, double premiumFare, double firstFare) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 286 | `        validateFlightNumber(flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 287 | `        validateFare(economyFare, "economyFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 288 | `        validateFare(premiumFare, "premiumFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 289 | `        validateFare(firstFare, "firstFare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 290 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 291 | `        Flight flight = findByFlightNumberOrThrow(flightNumber);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 292 | `        flight.setEconomyFare(economyFare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 293 | `        flight.setPremiumFare(premiumFare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 294 | `        flight.setFirstFare(firstFare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 295 | `        flight.setFare(economyFare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 296 | `        flightRepository.save(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 297 | `        log.info("Updated fares for flight {}", flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 298 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 299 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 300 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is an airline staff operation. It changes the schedule/fare inventory that the customer booking flow later reads.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 301 | `    public void setFareClass(String flightNumber, double fare, String fareClass) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 302 | `        validateFlightNumber(flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 303 | `        validateFare(fare, "fare");` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 304 | `        if (fareClass == null \\|\\| fareClass.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 305 | `            throw new FlightException("fareClass is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 306 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 307 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 308 | `        Flight flight = findByFlightNumberOrThrow(flightNumber);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 309 | `        flight.setFare(fare);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 310 | `        flightRepository.save(flight);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 311 | `        log.info("Updated fare class profile to {} for flight {}", fareClass, flightNumber);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 312 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 313 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 314 | `    private Flight findByFlightNumberOrThrow(String flightNumber) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 315 | `        return flightRepository.findByFlightNumberIgnoreCase(flightNumber)` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 316 | `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for number " + flightNumber));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 317 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 318 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 319 | `    private void validateFlightNumber(String flightNumber) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 320 | `        if (flightNumber == null \\|\\| flightNumber.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 321 | `            throw new FlightException("flightNumber is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 322 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 323 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 324 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 325 | `    private void validateNewFlight(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 326 | `        if (flight == null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 327 | `            throw new FlightException("Flight payload cannot be null");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 328 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 329 | `        validateFlightNumber(flight.getFlightNumber());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 330 | `        if (flight.getOrigin() == null \\|\\| flight.getOrigin().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 331 | `            throw new FlightException("origin is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 332 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 333 | `        if (flight.getDestination() == null \\|\\| flight.getDestination().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 334 | `            throw new FlightException("destination is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 335 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 336 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 337 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 338 | `    private String normalizeAirportCode(String airportCode, String field) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 339 | `        if (airportCode == null \\|\\| airportCode.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 340 | `            throw new FlightException(field + " is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 341 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 342 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 343 | `        String normalizedCode = airportCode.trim().toUpperCase();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 344 | `        if (!VALID_AIRPORT_CODES.contains(normalizedCode)) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 345 | `            throw new FlightException(field + " must be a valid Indian or international airport code");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 346 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 347 | `        return normalizedCode;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 348 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 349 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 350 | `    private void validateDistinctRoute(String origin, String destination) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 351 | `        if (origin.equals(destination)) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 352 | `            throw new FlightException("origin and destination cannot be the same");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 353 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 354 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 355 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 356 | `    private void validateFare(double fare, String field) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 357 | `        if (Double.isNaN(fare) \\|\\| Double.isInfinite(fare) \\|\\| fare < 0) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 358 | `            throw new FlightException(field + " must be a non-negative number");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 359 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 360 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 361 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 362 | `    private String normalizeDateTime(String raw, String field) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 363 | `        if (raw == null \\|\\| raw.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 364 | `            throw new FlightException(field + " is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 365 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 366 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 367 | `        String value = raw.trim();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 368 | `        if (value.contains("T")) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 369 | `            try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 370 | `                return LocalDateTime.parse(value, INPUT_DATE_TIME_FORMAT).format(OUTPUT_DATE_TIME_FORMAT);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 371 | `            } catch (DateTimeParseException ignored) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 372 | `                throw new FlightException(field + " must be in yyyy-MM-ddTHH:mm format");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 373 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 374 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 375 | `        if (value.matches("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}")) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 376 | `            return value;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 377 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 378 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 379 | `        throw new FlightException(field + " must be in yyyy-MM-ddTHH:mm format");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 380 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 381 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 382 | `    private void validateScheduleOrder(String departureTime, String arrivalTime) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 383 | `        Optional<LocalDateTime> departure = parseStoredDateTime(departureTime);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 384 | `        Optional<LocalDateTime> arrival = parseStoredDateTime(arrivalTime);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 385 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 386 | `        if (departure.isPresent() && arrival.isPresent() && !arrival.get().isAfter(departure.get())) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 387 | `            throw new FlightException("arrivalTime must be after departureTime");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 388 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 389 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 390 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 391 | `    private void validateNotInPast(String departureTime, String field) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 392 | `        parseStoredDateTime(departureTime).ifPresent(dep -> {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 393 | `            // Added check to allow matching minute operations during rapid local UI execution passes` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 394 | `            if (dep.isBefore(LocalDateTime.now().minusMinutes(1))) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 395 | `                throw new FlightException(field + " cannot be in the past");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 396 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 397 | `        });` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 398 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 399 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 400 | `    private Optional<LocalDateTime> parseStoredDateTime(String value) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 401 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 402 | `            return Optional.of(LocalDateTime.parse(value, OUTPUT_DATE_TIME_FORMAT));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 403 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 404 | `            log.debug("Skipping schedule ordering validation for non-standard datetime: {}", value);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 405 | `            return Optional.empty();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 406 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 407 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 408 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 409 | `    private Double calculateRouteDistanceMiles(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 410 | `        GeoPoint originPoint = AIRPORT_COORDINATES.get(flight.getOrigin());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 411 | `        GeoPoint destinationPoint = AIRPORT_COORDINATES.get(flight.getDestination());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 412 | `        if (originPoint != null && destinationPoint != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 413 | `            return roundToOneDecimal(haversineMiles(originPoint, destinationPoint));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 414 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 415 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 416 | `        Optional<LocalDateTime> departure = parseStoredDateTime(flight.getDepartureTime());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 417 | `        Optional<LocalDateTime> arrival = parseStoredDateTime(flight.getArrivalTime());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 418 | `        if (departure.isPresent() && arrival.isPresent() && arrival.get().isAfter(departure.get())) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 419 | `            double durationHours = Duration.between(departure.get(), arrival.get()).toMinutes() / 60.0;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 420 | `            return roundToOneDecimal(durationHours * DEFAULT_CRUISE_SPEED_MPH);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 421 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 422 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 423 | `        return null;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 424 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 425 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 426 | `    private double haversineMiles(GeoPoint from, GeoPoint to) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 427 | `        double lat1 = Math.toRadians(from.latitude());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 428 | `        double lon1 = Math.toRadians(from.longitude());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 429 | `        double lat2 = Math.toRadians(to.latitude());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 430 | `        double lon2 = Math.toRadians(to.longitude());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 431 | `        double dLat = lat2 - lat1;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 432 | `        double dLon = lon2 - lon1;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 433 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 434 | `        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2)` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 435 | `                + Math.cos(lat1) * Math.cos(lat2) * Math.sin(dLon / 2) * Math.sin(dLon / 2);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 436 | `        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 437 | `        return EARTH_RADIUS_MILES * c;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 438 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 439 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 440 | `    private double roundToOneDecimal(double value) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 441 | `        return Math.round(value * 10.0) / 10.0;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 442 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 443 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 444 | `    private record GeoPoint(double latitude, double longitude) {}` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 445 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 446 | `    private static final ZoneId IST_ZONE = ZoneId.of("Asia/Kolkata");` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 447 | `    private static final Map<String, String> LOCATION_TO_CODE = buildLocationToCode();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 448 | `    private static final Set<String> INTERNATIONAL_AIRPORT_CODES = buildInternationalAirportCodes();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 449 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 450 | `    private static Map<String, String> buildLocationToCode() {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 451 | `        Map<String, String> map = new HashMap<>();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 452 | `        for (IndianAirports.Airport airport : IndianAirports.AIRPORTS) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 453 | `            String code = airport.code().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 454 | `            map.put(code, code);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 455 | `            map.put(airport.city().toUpperCase(Locale.ROOT), code);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 456 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 457 | `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 458 | `            String code = airport.code().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 459 | `            map.put(code, code);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 460 | `            map.put(airport.city().toUpperCase(Locale.ROOT), code);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 461 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 462 | `        return map;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 463 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 464 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 465 | `    private static Set<String> buildInternationalAirportCodes() {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 466 | `        Set<String> codes = new HashSet<>();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 467 | `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 468 | `            codes.add(airport.code().toUpperCase(Locale.ROOT));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 469 | `            codes.add(airport.city().toUpperCase(Locale.ROOT));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 470 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 471 | `        return codes;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 472 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 473 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 474 | `    private static String canonicalLocation(String location) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 475 | `        if (location == null) return null;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 476 | `        String key = location.trim().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 477 | `        if (key.isEmpty()) return null;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 478 | `        return LOCATION_TO_CODE.getOrDefault(key, key);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 479 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 480 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 481 | `    private static boolean matchesLocation(String stored, String queryCanonical) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 482 | `        if (queryCanonical == null) return true;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 483 | `        return queryCanonical.equals(canonicalLocation(stored));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 484 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 485 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 486 | `    private static LocalDate extractDate(String value) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 487 | `        if (value == null \\|\\| value.isBlank()) return null;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 488 | `        String datePart = value.trim().replace('T', ' ').split(" ")[0];` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 489 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 490 | `            return LocalDate.parse(datePart);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 491 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 492 | `            return null;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 493 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 494 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 495 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 496 | `    private static LocalDate parseDate(String value) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 497 | `        if (value == null \\|\\| value.isBlank()) return null;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 498 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 499 | `            return LocalDate.parse(value);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 500 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 501 | `            return null;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 502 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 503 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 504 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 505 | `    private boolean isInternationalLocation(String location) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 506 | `        return location != null && INTERNATIONAL_AIRPORT_CODES.contains(location.trim().toUpperCase(Locale.ROOT));` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 507 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 508 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 509 | `    private boolean isInternationalFlight(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 510 | `        return isInternationalLocation(flight.getOrigin()) \\|\\| isInternationalLocation(flight.getDestination());` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 511 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 512 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Flight Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 513 | `    private static int declaredCapacity(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 514 | `        if (flight.getSeatCount() != null && flight.getSeatCount() > 0) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 515 | `            return flight.getSeatCount();` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 516 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 517 | `        if (flight.getSeatRows() != null && flight.getSeatColumns() != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 518 | `            return Math.max(flight.getSeatRows() * flight.getSeatColumns(), 0);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 519 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 520 | `        return 0;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 521 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 522 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this maintains the seat rows/counts for each flight. Booking uses those availability facts to avoid selling a seat that is already taken.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 523 | `    private void attachAvailableSeats(Flight flight) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 524 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 525 | `            Integer fid = flight.getFlightId() != null ? flight.getFlightId().intValue() : null;` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 526 | `            if (fid != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 527 | `                int available = seatInventoryRepository.findByFlightIdAndSeatStatus(fid, SeatStatus.AVAILABLE).size();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 528 | `                if (available > 0) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 529 | `                    flight.setAvailableSeats(available);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 530 | `                    return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 531 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 532 | `                boolean hasInventory = !seatInventoryRepository.findByFlightId(fid).isEmpty();` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 533 | `                if (hasInventory) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 534 | `                    flight.setAvailableSeats(0);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 535 | `                    return;` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 536 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 537 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 538 | `            flight.setAvailableSeats(declaredCapacity(flight));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 539 | `        } catch (Exception ex) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 540 | `            log.warn("Available-seat lookup failed for flight {} ({})", flight.getFlightNumber(), ex.getMessage());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 541 | `            flight.setAvailableSeats(declaredCapacity(flight));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 542 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 543 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 544 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 545 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this supports the booking search screen. It filters the Flight Service schedule by route/date/type/passenger count and returns only usable choices.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 546 | `    public List<Flight> searchAvailableFlights(String from, String to, String date, String type, Integer passengers) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 547 | `        String fromCanonical = canonicalLocation(from);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 548 | `        String toCanonical = canonicalLocation(to);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 549 | `        LocalDate departureDate = parseDate(date);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 550 | `        LocalDate todayIst = LocalDate.now(IST_ZONE);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 551 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 552 | `        List<Flight> flights = flightRepository.findAll().stream()` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 553 | `                .filter(f -> matchesLocation(f.getOrigin(), fromCanonical))` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 554 | `                .filter(f -> matchesLocation(f.getDestination(), toCanonical))` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 555 | `                .filter(f -> {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 556 | `                    LocalDate dep = extractDate(f.getDepartureTime());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 557 | `                    if (departureDate != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 558 | `                        return dep != null && dep.equals(departureDate);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 559 | `                    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 560 | `                    return dep == null \\|\\| !dep.isBefore(todayIst);` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 561 | `                })` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 562 | `                .collect(Collectors.toList());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 563 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 564 | `        flights = new ArrayList<>(flights.stream()` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 565 | `                .collect(Collectors.toMap(` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 566 | `                        Flight::getFlightNumber, f -> f,` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 567 | `                        (a, b) -> a.getFlightId() <= b.getFlightId() ? a : b,` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 568 | `                        LinkedHashMap::new` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 569 | `                )).values()` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 570 | `        );` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 571 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 572 | `        if (type != null && !type.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 573 | `            boolean wantInternational = "international".equalsIgnoreCase(type);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 574 | `            flights = flights.stream()` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 575 | `                    .filter(f -> isInternationalFlight(f) == wantInternational)` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 576 | `                    .collect(Collectors.toList());` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 577 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 578 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 579 | `        flights.forEach(f -> f.setAirlineName(f.getFlightName() != null ? f.getFlightName() : "Unknown"));` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 580 | `        flights.forEach(this::attachAvailableSeats);` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 581 | `        return flights;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 582 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 583 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 584 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Flight Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 585 | `    public Flight findByFlightNumberOrId(String identifier) {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 586 | `        if (identifier == null \\|\\| identifier.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 587 | `            throw new FlightException("identifier is required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 588 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 589 | `        try {` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 590 | `            Long id = Long.parseLong(identifier.trim());` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 591 | `            Flight flight = getFlight(id);` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 592 | `            if (flight != null) {` | calculates or assigns data needed by this Business-service layer in the Flight Service workflow. |
| 593 | `                return flight;` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 594 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 595 | `        } catch (NumberFormatException ignored) {}` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 596 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 597 | `        return flightRepository.findByFlightNumberIgnoreCase(identifier.trim())` | returns this result to the caller in the Flight Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 598 | `                .orElseThrow(() -> new FlightException(HttpStatus.NOT_FOUND, "Flight not found for identifier: " + identifier));` | this statement participates in the Flight Service Business-service layer behavior described for this file. |
| 599 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 600 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>flight-service/src/main/resources/application.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `spring.application.name=flight-service` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.config.import=optional:configserver:http://localhost:8888` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>flight-service/src/main/resources/log4j2.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Runtime configuration. In this project, these settings control ports, database connectivity, Eureka registration, logging or Gateway routing at runtime.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `status = warn` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `name = ARFOMSLogConfig` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 4 | `property.logDir = logs` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `property.appName = flight-service` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 7 | `appenders = console, rolling` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 9 | `appender.console.type = Console` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `appender.console.name = Console` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `appender.console.layout.type = PatternLayout` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 14 | `appender.rolling.type = RollingFile` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `appender.rolling.name = RollingFile` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `appender.rolling.fileName = ${logDir}/${appName}.log` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `appender.rolling.layout.type = PatternLayout` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 19 | `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 20 | `appender.rolling.policies.type = Policies` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 21 | `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 22 | `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 23 | `appender.rolling.policies.size.size = 10MB` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 24 | `appender.rolling.strategy.type = DefaultRolloverStrategy` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 25 | `appender.rolling.strategy.max = 14` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 26 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 27 | `rootLogger.level = info` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 28 | `rootLogger.appenderRefs = console, rolling` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 29 | `rootLogger.appenderRef.console.ref = Console` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 30 | `rootLogger.appenderRef.rolling.ref = RollingFile` | this setting controls how Flight Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

## Booking Service - `booking-service`


This implements the customer reservation path: find a flight, prepare booking/passenger data, choose a seat, record payment, generate PNR and persist the booking.

<details>
<summary><strong>booking-service/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 2 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 3 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 4 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 5 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 6 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 7 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 8 | `        <relativePath>../pom.xml</relativePath>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 9 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 10 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 11 | `    <artifactId>booking-service</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 12 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 13 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 14 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 15 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 16 | `            <artifactId>spring-boot-starter-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 17 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 18 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 19 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 20 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 21 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 22 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 23 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 24 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 25 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 26 | `            <artifactId>spring-cloud-starter-openfeign</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 27 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 28 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 29 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 30 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 31 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 32 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 33 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 34 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 35 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 36 | `            <artifactId>spring-boot-starter-validation</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 37 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 38 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 39 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 40 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 41 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 42 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 43 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 44 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 45 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 46 | `            <artifactId>spring-boot-starter-data-jpa</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 47 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 48 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 49 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 50 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 51 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 52 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 53 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 54 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 55 | `            <groupId>com.mysql</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 56 | `            <artifactId>mysql-connector-j</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 57 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 58 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 59 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 60 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 61 | `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 62 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 63 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 64 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 65 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 66 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 67 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 68 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 69 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 70 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 71 | `            <artifactId>spring-boot-starter-test</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 72 | `            <scope>test</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 73 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 74 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 75 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 76 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 77 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 78 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 79 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 80 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 81 | `            <groupId>org.springframework</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 82 | `            <artifactId>spring-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 83 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 84 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 85 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 86 | `            <artifactId>spring-boot-starter-security</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 87 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 88 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 89 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 90 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 91 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 92 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 93 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 94 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 95 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 96 | `            <artifactId>log4j-slf4j2-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 97 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 98 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 99 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 100 | `            <artifactId>log4j-core</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 101 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 102 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 103 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 104 | `            <artifactId>jjwt-api</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 105 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 106 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 107 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 108 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 109 | `            <artifactId>jjwt-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 110 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 111 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 112 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 113 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 114 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 115 | `            <artifactId>jjwt-jackson</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 116 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 117 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 118 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 119 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 120 | `            <groupId>org.projectlombok</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 121 | `            <artifactId>lombok</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 122 | `            <scope>provided</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 123 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 124 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 125 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 126 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 127 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 128 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 129 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 130 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 131 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 132 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 133 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 134 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by Booking Service. |
| 135 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 136 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/BookingServiceApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `import org.springframework.cloud.openfeign.EnableFeignClients;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 7 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 8 | `@EnableFeignClients` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `public class BookingServiceApplication {` | this statement participates in the Booking Service Service bootstrap behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the Booking Service application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    public static void main(String[] args) {` | this statement participates in the Booking Service Service bootstrap behavior described for this file. |
| 12 | `        SpringApplication.run(BookingServiceApplication.class, args);` | this statement participates in the Booking Service Service bootstrap behavior described for this file. |
| 13 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 14 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 15 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/client/FlightClient.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Inter-service client. In this project, this file is the typed HTTP bridge between services. Booking uses it to obtain/validate Flight Service data through its Eureka service name.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.client;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Flight;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 4 | `import org.springframework.cloud.openfeign.FeignClient;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 5 | `import org.springframework.web.bind.annotation.GetMapping;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 6 | `import org.springframework.web.bind.annotation.PathVariable;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 7 | `import org.springframework.web.bind.annotation.PostMapping;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 8 | `import org.springframework.web.bind.annotation.RequestBody;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 10 | `import java.util.List;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 11 | `import java.util.Map;` | brings in a framework/domain type required by this Inter-service client; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 13 | `@FeignClient(name = "flight-service")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public interface FlightClient {` | this statement participates in the Booking Service Inter-service client behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 16 | `    @GetMapping("/api/flights/id/{flightId}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    Flight getFlightById(@PathVariable("flightId") Long flightId);` | this statement participates in the Booking Service Inter-service client behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 19 | `    @PostMapping("/api/flights/search")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `    List<Flight> searchFlights(@RequestBody Map<String, Object> criteria);` | this statement participates in the Booking Service Inter-service client behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Inter-service client file and changes no runtime behavior. |
| 22 | `    @GetMapping("/api/flights")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    List<Flight> getAllFlights();` | this statement participates in the Booking Service Inter-service client behavior described for this file. |
| 24 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/config/FeignClientInterceptor.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.config;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import feign.RequestInterceptor;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import feign.RequestTemplate;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import org.springframework.context.annotation.Configuration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.web.context.request.RequestContextHolder;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.web.context.request.ServletRequestAttributes;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 9 | `@Configuration` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `public class FeignClientInterceptor implements RequestInterceptor {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 11 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 12 | `    public void apply(RequestTemplate requestTemplate) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 13 | `        ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 14 | `        if (attributes != null && attributes.getRequest() != null) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 15 | `            String token = attributes.getRequest().getHeader("Authorization");` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 16 | `            if (token != null) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 17 | `                requestTemplate.header("Authorization", token);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 18 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 19 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 20 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 21 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/config/JwtRequestFilter.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.config;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import jakarta.servlet.FilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import jakarta.servlet.ServletException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import jakarta.servlet.http.HttpServletRequest;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import jakarta.servlet.http.HttpServletResponse;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.core.authority.SimpleGrantedAuthority;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.core.context.SecurityContextHolder;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.web.filter.OncePerRequestFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 15 | `import java.io.IOException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 18 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class JwtRequestFilter extends OncePerRequestFilter {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    private JwtUtils jwtUtils;` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 24 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: every incoming protected request passes here before the controller. It extracts the Bearer JWT issued by Auth Service, validates it, puts the user/role into Spring Security, then continues the request chain.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 26 | `            throws ServletException, IOException {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 27 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 28 | `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 29 | `            chain.doFilter(request, response);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 30 | `            return;` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 31 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 33 | `        String requestTokenHeader = request.getHeader("Authorization");` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 34 | `        if (requestTokenHeader == null \\|\\| requestTokenHeader.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 35 | `            String tokenParam = request.getParameter("access_token");` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 36 | `            if (tokenParam != null && !tokenParam.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 37 | `                requestTokenHeader = "Bearer " + tokenParam;` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 38 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 41 | `        String username = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 42 | `        String jwtToken = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 43 | `        String role = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 44 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 45 | `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 46 | `            jwtToken = requestTokenHeader.substring(7);` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 47 | `            try {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 48 | `                username = jwtUtils.getUsernameFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 49 | `                role = jwtUtils.getRoleFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 50 | `            } catch (Exception e) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 51 | `                logger.error("JWT token verification failed: " + e.getMessage());` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 52 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 53 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 54 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 55 | `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 56 | `            if (jwtUtils.validateToken(jwtToken, username)) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 57 | `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 58 | `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 59 | `                        username, null, List.of(authority));` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 60 | `                usernamePasswordAuthenticationToken` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 61 | `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 62 | `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 63 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 64 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `        chain.doFilter(request, response);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 66 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 67 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/config/JwtUtils.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.config;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import io.jsonwebtoken.Claims;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import io.jsonwebtoken.Jwts;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import io.jsonwebtoken.security.Keys;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.beans.factory.annotation.Value;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 9 | `import javax.crypto.SecretKey;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 11 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class JwtUtils {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 14 | `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    private String secret;` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 17 | `    @Value("${jwt.expiration:86400000}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    private long expiration;` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 19 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public String generateToken(String username, String role) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 21 | `        java.util.Map<String, Object> claims = new java.util.HashMap<>();` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 22 | `        claims.put("role", role);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 23 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 24 | `        return Jwts.builder()` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 25 | `                .setClaims(claims)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 26 | `                .setSubject(username)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 27 | `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 28 | `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 29 | `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 30 | `                .compact();` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public String getUsernameFromToken(String token) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 34 | `        return getAllClaimsFromToken(token).getSubject();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 35 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 36 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 37 | `    public String getRoleFromToken(String token) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 38 | `        return getAllClaimsFromToken(token).get("role", String.class);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 39 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 41 | `    public boolean validateToken(String token, String username) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 42 | `        final String extractedUsername = getUsernameFromToken(token);` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 43 | `        return (extractedUsername.equals(username));` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    private Claims getAllClaimsFromToken(String token) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 47 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 48 | `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 49 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 50 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/config/SecurityConfig.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.config;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import org.springframework.context.annotation.Bean;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import org.springframework.context.annotation.Configuration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import org.springframework.http.HttpMethod;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.security.config.annotation.web.builders.HttpSecurity;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.config.http.SessionCreationPolicy;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.web.SecurityFilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.web.cors.CorsConfiguration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.web.cors.CorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 18 | `@Configuration` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class SecurityConfig {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `    private final JwtRequestFilter jwtRequestFilter;` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 22 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 23 | `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 24 | `        this.jwtRequestFilter = jwtRequestFilter;` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 25 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 26 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 27 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 29 | `        return httpSecurity` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 30 | `                .csrf(CsrfConfigurer::disable)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 31 | `                .authorizeHttpRequests(requests ->` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 32 | `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 33 | `                                .requestMatchers("/flights/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 34 | `                                .requestMatchers("/api/bookings/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 35 | `                                .requestMatchers("/airline/api/seats/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 36 | `                                .requestMatchers("/api/payment/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 37 | `                                .requestMatchers("/booking/confirm/**").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 38 | `                                .requestMatchers("/error").permitAll()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 39 | `                                .anyRequest().authenticated()` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 40 | `                )` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 41 | `                .sessionManagement(session ->` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 42 | `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 43 | `                )` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 44 | `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 45 | `                .formLogin(FormLoginConfigurer::disable)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 46 | `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 47 | `                .build();` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 48 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 49 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 50 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 51 | `    public CorsConfigurationSource corsConfigurationSource() {` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 52 | `        CorsConfiguration config = new CorsConfiguration();` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 53 | `        config.setAllowedOrigins(List.of(` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 54 | `                "http://127.0.0.1:5500", "http://localhost:5500",` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 55 | `                "http://127.0.0.1:5600", "http://localhost:5600",` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 56 | `                "http://127.0.0.1:8000", "http://localhost:8000",` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 57 | `                "http://localhost:8210",` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 58 | `                "http://localhost:63342", "http://127.0.0.1:63342"` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 59 | `        ));` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 60 | `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 61 | `        config.setAllowedHeaders(List.of("*"));` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 62 | `        config.setAllowCredentials(true);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 63 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 64 | `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();` | calculates or assigns data needed by this Security/infrastructure configuration in the Booking Service workflow. |
| 65 | `        source.registerCorsConfiguration("/**", config);` | this statement participates in the Booking Service Security/infrastructure configuration behavior described for this file. |
| 66 | `        return source;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 67 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 68 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/controller/BookingController.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Controller/API boundary. In this project, this file receives HTTP requests after API Gateway routes them. It converts request data into calls to Booking Service business code and returns the result to the frontend.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.controller;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Booking;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.model.Flight;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.booking.service.BookingService;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 7 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 8 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 9 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 10 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 11 | `import org.springframework.web.bind.annotation.*;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 13 | `import java.util.List;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 14 | `import java.util.Map;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 16 | `@RestController` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `public class BookingController {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 19 | `    private static final Logger log = LoggerFactory.getLogger(BookingController.class);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 20 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 21 | `    private final BookingService bookingService;` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 22 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 23 | `    public BookingController(BookingService bookingService) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 24 | `        this.bookingService = bookingService;` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 25 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 26 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 27 | `    /** List all available flights (browser-friendly GET, e.g. /flights). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 28 | `    @GetMapping("/flights")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 29 | `    public List<Flight> listFlights() {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 30 | `        log.info("GET /flights - listing all available flights");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 31 | `        return bookingService.searchAvailableFlights(new Booking());` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 32 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 33 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 34 | `    /** Search available flights for the given criteria. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 35 | `    @PostMapping("/flights/search")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this supports the booking search screen. It filters the Flight Service schedule by route/date/type/passenger count and returns only usable choices.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 36 | `    public List<Flight> searchFlights(@RequestBody Booking searchCriteria) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 37 | `        log.info("POST /flights/search - from={}, to={}, date={}, type={}",` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 38 | `                searchCriteria.getFromLocation(), searchCriteria.getToLocation(),` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 39 | `                searchCriteria.getDepartureDate(), searchCriteria.getFlightType());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 40 | `        return bookingService.searchAvailableFlights(searchCriteria);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 41 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 42 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 43 | `    /** Prepare a booking draft (ensures passenger slots) for the passenger-details page. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 44 | `    @PostMapping("/flights/passenger")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the reservation workflow step that builds and persists the booking data after a flight is chosen.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 45 | `    public Booking prepareDraft(@RequestBody Booking booking) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 46 | `        log.info("POST /flights/passenger - preparing booking draft");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 47 | `        return bookingService.prepareBookingDraft(booking);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 48 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 49 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 50 | `    /** Fetch passenger details by their unique ID. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 51 | `    @GetMapping("/flights/passenger/{passengerId}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 52 | `    public Passenger getPassenger(@PathVariable Long passengerId) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 53 | `        log.info("GET /flights/passenger/{} - fetching passenger details", passengerId);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 54 | `        return bookingService.getPassengerById(passengerId);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 55 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 56 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 57 | `    /** Check passenger uniqueness constraints on a target flight. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 58 | `    @PostMapping("/flights/passenger/validate")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 59 | `    public Map<String, Object> validatePassengers(@RequestBody Booking booking) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 60 | `        log.info("POST /flights/passenger/validate - checking passenger uniqueness on flight {}",` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 61 | `                booking.getFlightId());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 62 | `        bookingService.validateNoDuplicatePassengerOnFlight(booking);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 63 | `        return Map.of("ok", true);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 64 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 66 | `    /** Persist a new booking and return the saved record (including generated id and PNR). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 67 | `    @PostMapping("/flights/passenger/confirm")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the reservation workflow step that builds and persists the booking data after a flight is chosen.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 68 | `    public Booking createBooking(@RequestBody Booking booking) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 69 | `        log.info("POST /flights/passenger/confirm - creating new booking");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 70 | `        return bookingService.createBooking(booking);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 71 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 72 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 73 | `    @PostMapping("/api/bookings")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the reservation workflow step that builds and persists the booking data after a flight is chosen.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 74 | `    public ResponseEntity<Booking> createBookingFromPayload(@RequestBody Map<String, Object> payload) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 75 | `        log.info("POST /api/bookings - payload={}", payload);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 76 | `        Booking booking = new Booking();` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 77 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 78 | `        Object flightIdVal = payload.get("flightId");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 79 | `        if (flightIdVal != null) {` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 80 | `            booking.setFlightId(Long.valueOf(flightIdVal.toString()));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 81 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 82 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 83 | `        String seatNumber = (String) payload.get("seatNumber");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 84 | `        booking.setSeat(seatNumber);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 85 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 86 | `        Object fareVal = payload.get("fareAmount");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 87 | `        if (fareVal != null) {` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 88 | `            booking.setFare(Double.parseDouble(fareVal.toString()));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 89 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 90 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 91 | `        String passengerName = (String) payload.get("passengerName");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 92 | `        Passenger passenger = new Passenger();` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 93 | `        passenger.setFullName(passengerName != null ? passengerName : "Unknown");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 94 | `        passenger.setEmail(passengerName != null ? (passengerName.toLowerCase().replaceAll("\\s+", "") + "@example.com") : "passenger@example.com");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 95 | `        passenger.setPhone("9876543210");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 96 | `        passenger.setAge(30);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 97 | `        passenger.setGender("Male");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 98 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 99 | `        booking.setPassengerDetails(List.of(passenger));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 100 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 101 | `        Booking saved = bookingService.createBooking(booking);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 102 | `        return ResponseEntity.status(HttpStatus.CREATED).body(saved);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 103 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 104 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 105 | `    /** Fetch a single booking by id for the confirmation page. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 106 | `    @GetMapping("/api/bookings/confirmation/{bookingId}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 107 | `    public Booking getConfirmation(@PathVariable Long bookingId) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 108 | `        log.info("GET /api/bookings/confirmation/{} - fetching booking confirmation", bookingId);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 109 | `        return bookingService.getBookingById(bookingId);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 110 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 111 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 112 | `    /** Fetch the most recent booking for the manage-booking dashboard. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 113 | `    @GetMapping("/api/bookings/manage")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 114 | `    public Booking manage() {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 115 | `        log.info("GET /api/bookings/manage - fetching most recent booking");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 116 | `        return bookingService.getBookingDetails();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 117 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 118 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 119 | `    /** Fetch all past bookings (most recent first) for the manage-booking dashboard. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 120 | `    @GetMapping("/api/bookings")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 121 | `    public List<Booking> allBookings() {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 122 | `        log.info("GET /api/bookings - fetching all bookings");` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 123 | `        return bookingService.getAllBookings();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 124 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 125 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 126 | `    /** Modify an existing booking (date / seat / etc.). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 127 | `    @PostMapping("/api/bookings/{bookingId}/modify")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 128 | `    public Booking modify(@PathVariable Long bookingId, @RequestBody Booking updatedBooking) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 129 | `        log.info("POST /api/bookings/{}/modify - modifying booking", bookingId);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 130 | `        return bookingService.modifyBooking(bookingId, updatedBooking);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 131 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 132 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 133 | `    /** Cancel an existing booking. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 134 | `    @PostMapping("/api/bookings/{bookingId}/cancel")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 135 | `    public Booking cancel(@PathVariable Long bookingId) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 136 | `        log.info("POST /api/bookings/{}/cancel - cancelling booking", bookingId);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 137 | `        return bookingService.cancelBooking(bookingId);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 138 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 139 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 140 | `    /** Exception handler for catching conflicting validation states. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 141 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 142 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/controller/SeatPaymentController.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Controller/API boundary. In this project, this file receives HTTP requests after API Gateway routes them. It converts request data into calls to Booking Service business code and returns the result to the frontend.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.controller;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.dto.BookingResult;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.model.Flight;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.booking.model.Payment;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 7 | `import com.genc.arfoms.booking.model.SeatInventory;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 8 | `import com.genc.arfoms.booking.model.SeatStatus;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 9 | `import com.genc.arfoms.booking.client.FlightClient;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 10 | `import com.genc.arfoms.booking.service.PassengerService;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 11 | `import com.genc.arfoms.booking.service.SeatPaymentService;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 12 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 13 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.bind.annotation.GetMapping;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 15 | `import org.springframework.web.bind.annotation.PostMapping;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 16 | `import org.springframework.web.bind.annotation.RequestParam;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 17 | `import org.springframework.web.bind.annotation.RestController;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 18 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 19 | `import java.time.LocalDateTime;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 20 | `import java.time.format.DateTimeFormatter;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 21 | `import java.time.format.DateTimeParseException;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 22 | `import java.util.HashMap;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 23 | `import java.util.List;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 24 | `import java.util.Map;` | brings in a framework/domain type required by this Controller/API boundary; the imported API enables the behavior used below. |
| 25 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 26 | `@RestController` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 27 | `public class SeatPaymentController {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 29 | `    private static final DateTimeFormatter TIME_FMT = DateTimeFormatter.ofPattern("hh:mm a");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 30 | `    private static final DateTimeFormatter DATE_FMT = DateTimeFormatter.ofPattern("dd MMMM yyyy");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 31 | `    private static final DateTimeFormatter STORED_FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 32 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 33 | `    private static final String KEY_SUCCESS = "success";` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 34 | `    private static final String KEY_MESSAGE = "message";` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 35 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 36 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 37 | `    private SeatPaymentService seatPaymentService;` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 38 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 39 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 40 | `    private FlightClient flightClient;` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 41 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 42 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 43 | `    private PassengerService passengerService;` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 44 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 45 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 46 | `    @GetMapping("/airline/api/seats")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 47 | `    public Map<String, Object> getSeatData(@RequestParam(defaultValue = "1") Long flightId) {` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 48 | `        org.slf4j.Logger log = org.slf4j.LoggerFactory.getLogger(SeatPaymentController.class);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 49 | `        ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 50 | `        log.info("getSeatData: Fetching seats for flightId={}", flightId);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 51 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 52 | `        List<SeatInventory> allSeats = seatPaymentService.getSeatsByFlight(flightId);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 53 | `        log.info("getSeatData: Found {} total seats", allSeats.size());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 54 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 55 | `        List<String> bookedSeats = allSeats.stream()` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 56 | `                .filter(s -> s.getSeatStatus() == SeatStatus.BOOKED)` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 57 | `                .map(SeatInventory::getSeatNumber)` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 58 | `                .toList();` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 59 | `        log.info("getSeatData: Found {} booked seats: {}", bookedSeats.size(), bookedSeats);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 60 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 61 | `        Flight flight = flightClient.getFlightById(flightId);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 62 | `        Passenger passenger = passengerService.getPassenger();` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 63 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 64 | `        Map<String, Object> response = new HashMap<>();` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 65 | `        response.put("flightId", flightId);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 66 | `        response.put("allSeats", allSeats);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 67 | `        response.put("bookedSeatNumbers", bookedSeats);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 68 | `        response.put("flight", flight);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 69 | `        response.put("passenger", passenger);` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 70 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 71 | `        if (flight != null) {` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 72 | `            response.put("departureTime", formatStored(flight.getDepartureTime(), TIME_FMT));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 73 | `            response.put("arrivalTime", formatStored(flight.getArrivalTime(), TIME_FMT));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 74 | `            response.put("flightDate", formatStored(flight.getDepartureTime(), DATE_FMT));` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 75 | `            ` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 76 | `            // Include seat layout configuration from flight` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 77 | `            response.put("seatRows", flight.getSeatRows());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 78 | `            response.put("seatColumns", flight.getSeatColumns());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 79 | `            response.put("seatAisleAfter", flight.getSeatAisleAfter());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 80 | `            response.put("seatCount", flight.getSeatCount());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 81 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 82 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 83 | `        return response;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 84 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 85 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 86 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 87 | `    private static String formatStored(String stored, DateTimeFormatter target) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 88 | `        if (stored == null \\|\\| stored.isBlank()) {` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 89 | `            return "-";` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 90 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 91 | `        try {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 92 | `            return LocalDateTime.parse(stored, STORED_FMT).format(target);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 93 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 94 | `            return stored;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 95 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 96 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 97 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 98 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 99 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 100 | `    @GetMapping("/api/payment")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this endpoint is a public application action. API Gateway forwards the matching browser request here, then this method delegates to the Booking Service workflow and returns HTTP data.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 101 | `    public Payment getBooking(` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 102 | `            @RequestParam(required = false) Long flightId,` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 103 | `            @RequestParam(required = false) String seatNumber) {` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 104 | `        return seatPaymentService.buildBooking(flightId, seatNumber);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 105 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 106 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 107 | `    @PostMapping("/booking/confirm")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the final reservation step. It confirms the selected seat, records payment/booking state and returns the confirmation/PNR data shown to the customer.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 108 | `    public ResponseEntity<Map<String, Object>> confirmBooking(` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 109 | `            @RequestParam(required = false) Long flightId,` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 110 | `            @RequestParam(required = false) String seatNumber) {` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 111 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 112 | `        BookingResult result = seatPaymentService.confirmBooking(flightId, seatNumber);` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 113 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 114 | `        Map<String, Object> response = new HashMap<>();` | calculates or assigns data needed by this Controller/API boundary in the Booking Service workflow. |
| 115 | `        response.put(KEY_SUCCESS, result.isSuccess());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 116 | `        response.put(KEY_MESSAGE, result.getMessage());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 117 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |
| 118 | `        if (result.isSuccess()) {` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 119 | `            response.put("bookingId", result.getBookingId());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 120 | `            response.put("seatNumber", result.getSeatNumber());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 121 | `            response.put("totalAmount", result.getTotalAmount());` | this statement participates in the Booking Service Controller/API boundary behavior described for this file. |
| 122 | `            return ResponseEntity.ok(response);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 123 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 124 | `        return ResponseEntity.badRequest().body(response);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 125 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 126 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 127 | `` | blank line only; it separates steps in this Controller/API boundary file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/dto/BookingDTO.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.dto;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import lombok.Data;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 5 | `import java.util.ArrayList;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import java.util.List;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 8 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 9 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `public class BookingDTO {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 11 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 12 | `    private Long id;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 13 | `    private String flightType;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 14 | `    private String fromLocation;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 15 | `    private String toLocation;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 16 | `    private String departureDate;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 17 | `    private int passengers;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 18 | `    private String pnr;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 19 | `    private String status;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 20 | `    private String airline;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 21 | `    private String seat;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 22 | `    private double fare;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 23 | `    private String flyDate;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    private List<PassengerDTO> passengerDetails = new ArrayList<>();` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 26 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/dto/BookingResult.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.dto;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `public class BookingResult {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 4 | `    private final boolean success;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 5 | `    private final String message;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 6 | `    private final Integer bookingId;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 7 | `    private final String seatNumber;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 8 | `    private final String totalAmount;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 10 | `    public BookingResult(boolean success, String message, Integer bookingId, String seatNumber, String totalAmount) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 11 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 12 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 13 | `        this.bookingId = bookingId;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 14 | `        this.seatNumber = seatNumber;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 15 | `        this.totalAmount = totalAmount;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 16 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 17 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 18 | `    public static BookingResult success(Integer bookingId, String seatNumber, String totalAmount) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 19 | `        return new BookingResult(true, "Success", bookingId, seatNumber, totalAmount);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 20 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 21 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 22 | `    public static BookingResult failure(String message) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 23 | `        return new BookingResult(false, message, null, null, null);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 24 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 25 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 26 | `    public boolean isSuccess() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 27 | `        return success;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 28 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 29 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 30 | `    public String getMessage() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 31 | `        return message;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 32 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 33 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 34 | `    public Integer getBookingId() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 35 | `        return bookingId;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 36 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 37 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 38 | `    public String getSeatNumber() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 39 | `        return seatNumber;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 40 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 41 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 42 | `    public String getTotalAmount() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 43 | `        return totalAmount;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/dto/PassengerDTO.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.dto;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import lombok.Data;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 5 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 6 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 7 | `public class PassengerDTO {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 9 | `    private Long id;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 10 | `    private String fullName;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 11 | `    private Integer age;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 12 | `    private String gender;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 13 | `    private String email;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 14 | `    private String phone;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 15 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 16 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/dto/PassengerFlightInfo.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.dto;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 4 | `import lombok.Builder;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 5 | `import lombok.Data;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 6 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 8 | `import java.util.List;` | brings in a framework/domain type required by this Request/response data contract; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 10 | `/**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 11 | ` * Ground-staff lookup result: tells which passenger(s) belong to a booking and` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 12 | ` * which flight they are travelling on. Assembled read-only from the shared` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 13 | ` * {@code bookings}, {@code passenger} and {@code flights} tables.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 14 | ` */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 15 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 16 | `@Builder` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class PassengerFlightInfo {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 21 | `    private Long bookingId;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 22 | `    private String pnr;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 24 | `    /** Primary passenger name (first on the booking). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 25 | `    private String passengerName;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 26 | `    /** All passenger names on the booking. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 27 | `    private List<String> passengerNames;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 29 | `    private Long flightId;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 30 | `    private String flightNumber;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 31 | `    private String flightName;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 32 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 33 | `    private String origin;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 34 | `    private String destination;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 35 | `    private String route;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 36 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 37 | `    private String seat;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 38 | `    /** Travel class / fare type from the booking (e.g. ECONOMY, BUSINESS). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 39 | `    private String travelClass;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 40 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 41 | `    /** Current check-in status for ground staff ("Not Checked In" if none yet). */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 42 | `    private String status;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 43 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 44 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/dto/ResponseData.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.dto;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `public class ResponseData<T> {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 4 | `    private T data;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 5 | `    private boolean success;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 6 | `    private String message;` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 8 | `    public ResponseData() {}` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 10 | `    public ResponseData(T data, boolean success, String message) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 11 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 12 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 13 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 14 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 15 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    public T getData() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 17 | `        return data;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 18 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 19 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public void setData(T data) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 21 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 22 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 24 | `    public boolean isSuccess() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 25 | `        return success;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 26 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public void setSuccess(boolean success) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 29 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 30 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 31 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 32 | `    public String getMessage() {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 33 | `        return message;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 34 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 35 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 36 | `    public void setMessage(String message) {` | this statement participates in the Booking Service Request/response data contract behavior described for this file. |
| 37 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Booking Service workflow. |
| 38 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/exception/GlobalExceptionHandler.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.exception;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 4 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 5 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 6 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 7 | `import org.springframework.web.bind.annotation.ExceptionHandler;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 8 | `import org.springframework.web.bind.annotation.RestControllerAdvice;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 9 | `import org.springframework.web.server.ResponseStatusException;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 11 | `import java.util.Map;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 13 | `@RestControllerAdvice` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class GlobalExceptionHandler {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    private static final Logger log = LoggerFactory.getLogger(GlobalExceptionHandler.class);` | calculates or assigns data needed by this Error-to-HTTP translation in the Booking Service workflow. |
| 17 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 18 | `    @ExceptionHandler(ResponseStatusException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 19 | `    public ResponseEntity<Map<String, Object>> handleResponseStatus(ResponseStatusException ex) {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 20 | `        String message = ex.getReason() != null ? ex.getReason() : "Error";` | calculates or assigns data needed by this Error-to-HTTP translation in the Booking Service workflow. |
| 21 | `        return ResponseEntity.status(ex.getStatusCode())` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 22 | `                .body(Map.of("status", ex.getStatusCode().value(), "message", message));` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 23 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 24 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 25 | `    // REMOVED IllegalStateException from here` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 26 | `    @ExceptionHandler(IllegalArgumentException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 27 | `    public ResponseEntity<Map<String, Object>> handleIllegalArgument(IllegalArgumentException ex) {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 28 | `        String detail = ex.getMessage() != null ? ex.getMessage() : "Invalid input parameters.";` | calculates or assigns data needed by this Error-to-HTTP translation in the Booking Service workflow. |
| 29 | `        return ResponseEntity.status(HttpStatus.BAD_REQUEST)` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 30 | `                .body(Map.of("status", 400, "message", detail));` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 33 | `    // Kept here for a custom 409 CONFLICT response` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 34 | `    @ExceptionHandler(IllegalStateException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 35 | `    public ResponseEntity<Map<String, Object>> handleIllegalState(IllegalStateException ex) {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 36 | `        log.warn("Validation failed: {}", ex.getMessage());` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 37 | `        return ResponseEntity.status(HttpStatus.CONFLICT)` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 38 | `                .body(Map.of("status", 409, "message", ex.getMessage()));` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 39 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 41 | `    @ExceptionHandler(Exception.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 42 | `    public ResponseEntity<Map<String, Object>> handleOther(Exception ex) {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 43 | `        log.error("Unhandled exception processed by exception engine", ex);` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 44 | `        String detail = ex.getMessage() != null ? ex.getMessage() : ex.getClass().getSimpleName();` | calculates or assigns data needed by this Error-to-HTTP translation in the Booking Service workflow. |
| 45 | `        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 46 | `                .body(Map.of("status", 500, "message", detail));` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 47 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 48 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/exception/NoDataFoundException.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.exception;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `public class NoDataFoundException extends RuntimeException {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 4 | `    public NoDataFoundException(String message) {` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 5 | `        super(message);` | this statement participates in the Booking Service Error-to-HTTP translation behavior described for this file. |
| 6 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/Booking.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import lombok.Data;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.EqualsAndHashCode;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.ToString;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 8 | `import java.util.ArrayList;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 9 | `import java.util.List;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 11 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@Table(name = "bookings")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class Booking {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 16 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    @Column(name = "id")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `    private Long id;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 21 | `    @Column(name = "flight_id", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    private Long flightId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 24 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 25 | `    private Flight flight;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 27 | `    @Column(name = "flightType")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 28 | `    private String flightType;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 29 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 30 | `    @Column(name = "fromLocation")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 31 | `    private String fromLocation;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 32 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 33 | `    @Column(name = "toLocation")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 34 | `    private String toLocation;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 35 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 36 | `    @Column(name = "departureDate")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 37 | `    private String departureDate;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 38 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 39 | `    @Column(name = "passengers")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 40 | `    private int passengers;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 41 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 42 | `    @Column(name = "pnr")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 43 | `    private String pnr;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 44 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 45 | `    @Column(name = "status")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 46 | `    private String status;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 47 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 48 | `    @Column(name = "airline")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 49 | `    private String airline;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 50 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 51 | `    @Column(name = "seat")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 52 | `    private String seat;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 53 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 54 | `    @Column(name = "fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 55 | `    private double fare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 56 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 57 | `    @Column(name = "flyDate")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 58 | `    private String flyDate;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 59 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 60 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 61 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 62 | `    // Find this inside Booking.java:` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 63 | `    @OneToMany(mappedBy = "booking", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 64 | `    @ToString.Exclude` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 65 | `    @EqualsAndHashCode.Exclude` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 66 | `    private List<Passenger> passengerDetails = new ArrayList<>();` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 67 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 68 | `    // Custom setter kept (Lombok will not override it) to maintain the bidirectional link` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 69 | `    public void setPassengerDetails(List<Passenger> passengerDetails) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 70 | `        List<Passenger> incoming = (passengerDetails == null)` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 71 | `                ? new ArrayList<>()` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 72 | `                : new ArrayList<>(passengerDetails);` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 73 | `        this.passengerDetails.clear();` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 74 | `        incoming.forEach(this::addPassengerDetail);` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 75 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 76 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 77 | `    public void addPassengerDetail(Passenger passenger) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 78 | `        if (passenger == null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 79 | `            return;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 80 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 81 | `        passenger.setBooking(this);` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 82 | `        this.passengerDetails.add(passenger);` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 83 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 84 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 85 | `    // Helper Compatibility Layer: Safely extracts flightId for systems expecting flat integers` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 86 | `    public Long getFlightId() {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 87 | `        if (this.flightId != null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 88 | `            return this.flightId;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 89 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 90 | `        return (this.flight != null) ? this.flight.getFlightId() : null;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 91 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 92 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 93 | `    // Helper Compatibility Layer: Sets flight reference based on ID without breaking encapsulation` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 94 | `    public void setFlightId(Long flightId) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 95 | `        this.flightId = flightId;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 96 | `        if (flightId != null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 97 | `            if (this.flight == null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 98 | `                this.flight = new Flight();` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 99 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 100 | `            this.flight.setFlightId(flightId);` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 101 | `        } else {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 102 | `            this.flight = null;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 103 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 104 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 105 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 106 | `    public void setFlight(Flight flight) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 107 | `        this.flight = flight;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 108 | `        if (flight != null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 109 | `            this.flightId = flight.getFlightId();` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 110 | `        } else {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 111 | `            this.flightId = null;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 112 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 113 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 114 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/BookingStatus.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `public enum BookingStatus {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 4 | `    CONFIRMED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 5 | `    CANCELLED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 6 | `    NO_SHOW,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 7 | `    COMPLETED` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 8 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 9 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/Flight.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import lombok.Data;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 6 | `public class Flight {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 7 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 8 | `    private Long flightId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 9 | `    private String flightNumber;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 10 | `    private String flightName;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 11 | `    private String origin;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 12 | `    private String destination;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 13 | `    private Double distanceMiles;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 14 | `    private String departureTime;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 15 | `    private String arrivalTime;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 16 | `    private Double fare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 17 | `    private Double economyFare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 18 | `    private Double premiumFare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 19 | `    private Double firstFare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `    private FlightStatus flightStatus;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 21 | `    private Integer seatCount;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 22 | `    private Integer seatRows;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `    private Integer seatColumns;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 24 | `    private Integer seatAisleAfter;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 25 | `    private Integer airlineId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 26 | `    private String airlineName;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 27 | `    private Integer availableSeats;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 29 | `    public Flight() {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 30 | `        this.flightStatus = FlightStatus.SCHEDULED;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public Flight(String flightNumber, String origin, String destination,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 34 | `                  String departureTime, String arrivalTime, Double fare, FlightStatus flightStatus) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 35 | `        this.flightNumber = flightNumber;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 36 | `        this.origin = origin;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 37 | `        this.destination = destination;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 38 | `        this.departureTime = departureTime;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 39 | `        this.arrivalTime = arrivalTime;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 40 | `        this.fare = fare;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 41 | `        this.flightStatus = (flightStatus != null) ? flightStatus : FlightStatus.SCHEDULED;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 42 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 43 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/FlightStatus.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `public enum FlightStatus {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 4 | `    SCHEDULED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 5 | `    BOARDING,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 6 | `    DEPARTED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 7 | `    ARRIVED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 8 | `    CANCELLED` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 9 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/IndianAirports.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import java.util.List;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `public final class IndianAirports {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 6 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 7 | `    public record Airport(String code, String city) {}` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    private IndianAirports() {}` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    public static final List<Airport> AIRPORTS = List.of(` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 12 | `            new Airport("DEL", "Delhi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 13 | `            new Airport("BOM", "Mumbai"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 14 | `            new Airport("BLR", "Bengaluru"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 15 | `            new Airport("MAA", "Chennai"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 16 | `            new Airport("CCU", "Kolkata"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 17 | `            new Airport("HYD", "Hyderabad"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 18 | `            new Airport("COK", "Kochi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 19 | `            new Airport("AMD", "Ahmedabad"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `            new Airport("PNQ", "Pune"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 21 | `            new Airport("GOI", "Goa (Dabolim)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 22 | `            new Airport("GOX", "Goa (Mopa)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `            new Airport("JAI", "Jaipur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 24 | `            new Airport("LKO", "Lucknow"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 25 | `            new Airport("PAT", "Patna"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 26 | `            new Airport("TRV", "Thiruvananthapuram"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 27 | `            new Airport("CCJ", "Kozhikode"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 28 | `            new Airport("IXC", "Chandigarh"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 29 | `            new Airport("NAG", "Nagpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 30 | `            new Airport("VNS", "Varanasi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 31 | `            new Airport("BBI", "Bhubaneswar"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 32 | `            new Airport("GAU", "Guwahati"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 33 | `            new Airport("IXB", "Bagdogra"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 34 | `            new Airport("SXR", "Srinagar"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 35 | `            new Airport("IXJ", "Jammu"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 36 | `            new Airport("ATQ", "Amritsar"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 37 | `            new Airport("IDR", "Indore"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 38 | `            new Airport("BHO", "Bhopal"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 39 | `            new Airport("RPR", "Raipur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 40 | `            new Airport("VTZ", "Visakhapatnam"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 41 | `            new Airport("VGA", "Vijayawada"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 42 | `            new Airport("TIR", "Tirupati"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 43 | `            new Airport("CJB", "Coimbatore"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 44 | `            new Airport("IXM", "Madurai"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 45 | `            new Airport("TRZ", "Tiruchirappalli"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 46 | `            new Airport("MLR", "Mangaluru"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 47 | `            new Airport("IXE", "Mangalore"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 48 | `            new Airport("HBX", "Hubli"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 49 | `            new Airport("IXR", "Ranchi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 50 | `            new Airport("DBR", "Dehradun"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 51 | `            new Airport("DED", "Dehradun (Jolly Grant)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 52 | `            new Airport("IXA", "Agartala"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 53 | `            new Airport("IMF", "Imphal"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 54 | `            new Airport("DIB", "Dibrugarh"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 55 | `            new Airport("JLR", "Jabalpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 56 | `            new Airport("UDR", "Udaipur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 57 | `            new Airport("JDH", "Jodhpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 58 | `            new Airport("STV", "Surat"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 59 | `            new Airport("RAJ", "Rajkot"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 60 | `            new Airport("BDQ", "Vadodara"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 61 | `            new Airport("KNU", "Kanpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 62 | `            new Airport("GWL", "Gwalior"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 63 | `            new Airport("AYJ", "Ayodhya"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 64 | `            new Airport("PGH", "Prayagraj"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 65 | `            new Airport("IXZ", "Port Blair"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 66 | `            new Airport("LEH", "Leh"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 67 | `            new Airport("SAG", "Shirdi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 68 | `            new Airport("KLH", "Kolhapur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 69 | `            new Airport("IXU", "Aurangabad"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 70 | `            new Airport("NDC", "Nanded"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 71 | `            new Airport("BEK", "Bareilly"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 72 | `            new Airport("AGR", "Agra"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 73 | `            new Airport("DHM", "Dharamshala"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 74 | `            new Airport("KUU", "Kullu"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 75 | `            new Airport("SLV", "Shimla"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 76 | `            new Airport("PYG", "Pakyong (Gangtok)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 77 | `            new Airport("TEZ", "Tezpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 78 | `            new Airport("JRH", "Jorhat"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 79 | `            new Airport("SHL", "Shillong"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 80 | `            new Airport("DMU", "Dimapur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 81 | `            new Airport("AJL", "Aizawl"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 82 | `            new Airport("RUP", "Rupsi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 83 | `            new Airport("HSS", "Hisar")` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 84 | `    );` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 85 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/InternationalAirports.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.IndianAirports.Airport;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `import java.util.List;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 7 | `public final class InternationalAirports {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    private InternationalAirports() {}` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    public static final List<Airport> AIRPORTS = List.of(` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 12 | `            new Airport("AMS", "Amsterdam (Schiphol)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 13 | `            new Airport("AUH", "Abu Dhabi"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 14 | `            new Airport("BKK", "Bangkok"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 15 | `            new Airport("CDG", "Paris (Charles de Gaulle)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 16 | `            new Airport("DOH", "Doha"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 17 | `            new Airport("DXB", "Dubai"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 18 | `            new Airport("FCO", "Rome (Fiumicino)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 19 | `            new Airport("FRA", "Frankfurt"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `            new Airport("HKG", "Hong Kong"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 21 | `            new Airport("HND", "Tokyo (Haneda)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 22 | `            new Airport("ICN", "Seoul (Incheon)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `            new Airport("IST", "Istanbul"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 24 | `            new Airport("JFK", "New York (JFK)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 25 | `            new Airport("KUL", "Kuala Lumpur"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 26 | `            new Airport("LAX", "Los Angeles"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 27 | `            new Airport("LHR", "London Heathrow"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 28 | `            new Airport("MAD", "Madrid"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 29 | `            new Airport("MEL", "Melbourne"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 30 | `            new Airport("NRT", "Tokyo (Narita)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 31 | `            new Airport("ORD", "Chicago (O'Hare)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 32 | `            new Airport("SFO", "San Francisco"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 33 | `            new Airport("SIN", "Singapore (Changi)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 34 | `            new Airport("SYD", "Sydney"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 35 | `            new Airport("YVR", "Vancouver"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 36 | `            new Airport("YYZ", "Toronto (Pearson)"),` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 37 | `            new Airport("ZRH", "Zurich")` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 38 | `    );` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 39 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/Passenger.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import com.fasterxml.jackson.annotation.JsonIgnore;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.Data;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.EqualsAndHashCode;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `import lombok.ToString;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 9 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@Table(name = "passenger")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Data` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class Passenger {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 14 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 16 | `    private Long id;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 17 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 18 | `    private String fullName;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 19 | `    private Integer age;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `    private String gender;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 21 | `    private String email;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 22 | `    private String phone;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 24 | `    @ManyToOne(fetch = FetchType.LAZY, cascade = {CascadeType.PERSIST, CascadeType.MERGE})` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 25 | `    @JoinColumn(name = "booking_id")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    @JsonIgnore` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 27 | `    @ToString.Exclude` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 28 | `    @EqualsAndHashCode.Exclude` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 29 | `    private Booking booking;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 30 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 31 | `    /** Transient attribute reserved for mileage accumulation inside the booking system. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 32 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 33 | `    private Double distanceMiles = 0.0;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 34 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 35 | `    /** Convenience alias used by the seat/payment module. */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 36 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 37 | `    public String getName() {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 38 | `        return fullName;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 39 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/Payment.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.Getter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `import lombok.Setter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 9 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `@Table(name = "payment")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `public class Payment {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 16 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    @Column(name = "booking_id")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `    private Integer bookingId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 21 | `    @Column(name = "base_fare")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    private String baseFare;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 23 | `    @Column(name = "seat_charges")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 24 | `    private String seatCharges;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 25 | `    @Column(name = "taxes")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    private String taxes;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 27 | `    @Column(name = "total_amount")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 28 | `    private String totalAmount;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 29 | `    @Column(name = "savings")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 30 | `    private String savings;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 31 | `    @Column(name = "flight_number")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 32 | `    private String flightNumber;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 33 | `    @Column(name = "source")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 34 | `    private String source;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 35 | `    @Column(name = "destination")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 36 | `    private String destination;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 37 | `    @Column(name = "departure_time")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 38 | `    private String departureTime;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 39 | `    @Column(name = "arrival_time")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 40 | `    private String arrivalTime;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 41 | `    @Column(name = "passenger_name")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 42 | `    private String passengerName;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 43 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 44 | `    @Column(name = "flight_id", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 45 | `    private Integer flightId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 46 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 47 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 48 | `    private Flight flight;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 49 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 50 | `    @Column(name = "seat_number", length = 10)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 51 | `    private String seatNumber;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 52 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 53 | `    public void setFlight(Flight flight) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 54 | `        this.flight = flight;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 55 | `        if (flight != null && flight.getFlightId() != null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 56 | `            this.flightId = flight.getFlightId().intValue();` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 57 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 58 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 59 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/SeatInventory.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.SeatStatus;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 5 | `import lombok.AllArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 6 | `import lombok.Getter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 7 | `import lombok.NoArgsConstructor;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 8 | `import lombok.Setter;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 10 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `@Table(name = "seat_inventory")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `@Getter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `@Setter` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `@NoArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `@AllArgsConstructor` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 16 | `public class SeatInventory {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 17 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 18 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `    private Long id;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 22 | `    @Column(name = "flight_id", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    private Integer flightId;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 25 | `    @Transient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    private Flight flight;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 27 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 28 | `    @Column(name = "seat_number", length = 10, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 29 | `    private String seatNumber;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 30 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 31 | `    @Column(name = "column_letter", length = 5, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 32 | `    private String columnLetter;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 33 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 34 | `    @Column(name = "seat_row", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 35 | `    private Integer seatRow;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 36 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 37 | `    @Enumerated(EnumType.STRING)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 38 | `    @Column(name = "seat_status", length = 20, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 39 | `    private SeatStatus seatStatus = SeatStatus.AVAILABLE;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 40 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 41 | `    @Version` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 42 | `    @Column(name = "version", nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 43 | `    private Long version;` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 44 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 45 | `    public void setFlight(Flight flight) {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 46 | `        this.flight = flight;` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 47 | `        if (flight != null && flight.getFlightId() != null) {` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 48 | `            this.flightId = flight.getFlightId().intValue();` | calculates or assigns data needed by this Database/domain model in the Booking Service workflow. |
| 49 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 50 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 51 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/model/SeatStatus.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Booking Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.model;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `public enum SeatStatus {` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 4 | `    AVAILABLE,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 5 | `    BOOKED,` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 6 | `    BLOCKED` | this statement participates in the Booking Service Database/domain model behavior described for this file. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 8 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/repository/BookingRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.repository;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Booking;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 7 | `import java.util.List;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 10 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `public interface BookingRepository extends JpaRepository<Booking, Long> {` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 12 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 13 | `    Optional<Booking> findTopByOrderByIdDesc();` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 15 | `    List<Booking> findAllByOrderByIdDesc();` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 17 | `    Optional<Booking> findByPnr(String pnr);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 18 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/repository/PassengerRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.repository;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.data.jpa.repository.Query;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `import org.springframework.data.repository.query.Param;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 7 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 9 | `import java.util.List;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 10 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 11 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 12 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `public interface PassengerRepository extends JpaRepository<Passenger, Long> {` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 15 | `    List<Passenger> findByEmailIgnoreCase(String email);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 17 | `    @Query("SELECT p FROM Passenger p WHERE p.booking.flightId = :flightId AND " +` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `           "(p.id = :passengerId OR (p.email IS NOT NULL AND LOWER(p.email) = LOWER(:email)))")` | calculates or assigns data needed by this Persistence/repository layer in the Booking Service workflow. |
| 19 | `    List<Passenger> findPassengerBookingsOnFlight(@Param("flightId") Long flightId,` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 20 | `                                                    @Param("passengerId") Long passengerId,` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 21 | `                                                    @Param("email") String email);` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/repository/PaymentRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.repository;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Payment;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.data.jpa.repository.Query;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `import org.springframework.data.repository.query.Param;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 7 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 9 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 11 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public interface PaymentRepository extends JpaRepository<Payment, Integer> {` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 14 | `    @Query("SELECT p FROM Payment p WHERE p.flightId = :flightId AND p.seatNumber = :seatNumber")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    Optional<Payment> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 16 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/repository/SeatInventoryRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.repository;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.SeatInventory;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.model.SeatStatus;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `import org.springframework.data.jpa.repository.Query;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 7 | `import org.springframework.data.repository.query.Param;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 10 | `import java.util.List;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 11 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 13 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public interface SeatInventoryRepository extends JpaRepository<SeatInventory, Long> {` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 16 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 17 | `    List<SeatInventory> findByFlightId(@Param("flightId") Integer flightId);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 19 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId ORDER BY s.seatNumber ASC")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `    List<SeatInventory> findByFlightIdOrderBySeatNumberAsc(@Param("flightId") Integer flightId);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 22 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId AND s.seatStatus = :seatStatus")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    List<SeatInventory> findByFlightIdAndSeatStatus(@Param("flightId") Integer flightId, @Param("seatStatus") SeatStatus seatStatus);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 25 | `    @Query("SELECT s FROM SeatInventory s WHERE s.flightId = :flightId AND s.seatNumber = :seatNumber")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 26 | `    Optional<SeatInventory> findByFlightIdAndSeatNumber(@Param("flightId") Integer flightId, @Param("seatNumber") String seatNumber);` | this statement participates in the Booking Service Persistence/repository layer behavior described for this file. |
| 27 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/service/BookingService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Booking Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.service;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Booking;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.model.Flight;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 7 | `import java.util.List;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 9 | `public interface BookingService {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 11 | `    List<Flight> searchAvailableFlights(Booking searchCriteria);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 12 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 13 | `    Booking prepareBookingDraft(Booking booking);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 15 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 16 | `    Booking createBooking(Booking booking);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 17 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 18 | `    /**` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 19 | `     * Verifies that none of the booking's passengers already hold an active seat` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 20 | `     * on the same flight. Throws IllegalStateException (with a user-facing message)` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 21 | `     * when a duplicate is found. Used to validate early on the passenger page.` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 22 | `     */` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 23 | `    void validateNoDuplicatePassengerOnFlight(Booking booking);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 25 | `    Booking selectSeat(Long bookingId, String seat);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 27 | `    Booking modifyBooking(Long bookingId, Booking updatedBooking);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 29 | `    Booking cancelBooking(Long bookingId);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 30 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 31 | `    Booking getBookingDetails();` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 32 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 33 | `    Booking getBookingById(Long bookingId);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 34 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 35 | `    List<Booking> getAllBookings();` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 36 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 37 | `    Passenger getPassengerById(Long passengerId);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 38 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/service/BookingServiceImpl.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Booking Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.service;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.*;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.repository.*;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.booking.client.FlightClient;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.booking.model.SeatStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 8 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 9 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 10 | `import org.springframework.transaction.annotation.Transactional;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 11 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 12 | `import java.time.LocalDate;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 13 | `import java.time.ZoneId;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 14 | `import java.time.format.DateTimeParseException;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 15 | `import java.util.*;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 16 | `import java.util.stream.Collectors;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 18 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class BookingServiceImpl implements BookingService {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    private static final Logger log = LoggerFactory.getLogger(BookingServiceImpl.class);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 21 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 22 | `    private static final String BOOKING_NOT_FOUND = "Booking not found for id: ";` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 23 | `    private static final int MAX_PASSENGERS = 9;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 24 | `    private static final ZoneId IST_ZONE = ZoneId.of("Asia/Kolkata");` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 25 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 26 | `    private static final Set<String> INTERNATIONAL_AIRPORT_CODES = buildInternationalAirportCodes();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 27 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 28 | `    private final BookingRepository bookingRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 29 | `    private final FlightClient flightClient;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 30 | `    private final SeatInventoryRepository seatInventoryRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 31 | `    private final PassengerRepository passengerRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 32 | `    private final MockPaymentService mockPaymentService;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 33 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 34 | `    public BookingServiceImpl(BookingRepository bookingRepository, FlightClient flightClient,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 35 | `                              SeatInventoryRepository seatInventoryRepository,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 36 | `                              PassengerRepository passengerRepository,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 37 | `                              MockPaymentService mockPaymentService) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 38 | `        this.bookingRepository = bookingRepository;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 39 | `        this.flightClient = flightClient;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 40 | `        this.seatInventoryRepository = seatInventoryRepository;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 41 | `        this.passengerRepository = passengerRepository;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 42 | `        this.mockPaymentService = mockPaymentService;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 43 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 44 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 45 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this supports the booking search screen. It filters the Flight Service schedule by route/date/type/passenger count and returns only usable choices.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    public List<Flight> searchAvailableFlights(Booking searchCriteria) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 47 | `        String fromCanonical = canonicalLocation(searchCriteria.getFromLocation());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 48 | `        String toCanonical = canonicalLocation(searchCriteria.getToLocation());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 49 | `        LocalDate departureDate = parseDate(searchCriteria.getDepartureDate());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 50 | `        LocalDate todayIst = LocalDate.now(IST_ZONE);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 51 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 52 | `        List<Flight> flights = flightClient.getAllFlights().stream()` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 53 | `                .filter(f -> matchesLocation(f.getOrigin(), fromCanonical))` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 54 | `                .filter(f -> matchesLocation(f.getDestination(), toCanonical))` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 55 | `                .filter(f -> {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 56 | `                    LocalDate dep = extractDate(f.getDepartureTime());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 57 | `                    if (departureDate != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 58 | `                        return dep != null && dep.equals(departureDate);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 59 | `                    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 60 | `                    return dep == null \\|\\| !dep.isBefore(todayIst);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 61 | `                })` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 62 | `                .collect(Collectors.toList());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 63 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 64 | `        flights = new ArrayList<>(flights.stream()` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 65 | `                .collect(Collectors.toMap(` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 66 | `                        Flight::getFlightNumber, f -> f,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 67 | `                        (a, b) -> a.getFlightId() <= b.getFlightId() ? a : b,` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 68 | `                        LinkedHashMap::new` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 69 | `                )).values()` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 70 | `        );` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 71 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 72 | `        String flightType = searchCriteria.getFlightType();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 73 | `        if (flightType != null && !flightType.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 74 | `            boolean wantInternational = "international".equalsIgnoreCase(flightType);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 75 | `            flights = flights.stream()` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 76 | `                    .filter(f -> isInternationalFlight(f) == wantInternational)` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 77 | `                    .collect(Collectors.toList());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 78 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 79 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 80 | `        Map<Integer, String> airlineMap = Collections.emptyMap();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 81 | `        final Map<Integer, String> resolvedAirlineMap = airlineMap;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 82 | `        flights.forEach(f -> f.setAirlineName(resolveAirlineName(f, resolvedAirlineMap)));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 83 | `        flights.forEach(this::attachAvailableSeats);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 84 | `        return flights;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 85 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 86 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this maintains the seat rows/counts for each flight. Booking uses those availability facts to avoid selling a seat that is already taken.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 87 | `    private void attachAvailableSeats(Flight flight) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 88 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 89 | `            Integer fid = flight.getFlightId() != null ? flight.getFlightId().intValue() : null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 90 | `            if (fid != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 91 | `                int available = seatInventoryRepository.findByFlightIdAndSeatStatus(fid, SeatStatus.AVAILABLE).size();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 92 | `                if (available > 0) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 93 | `                    flight.setAvailableSeats(available);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 94 | `                    return;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 95 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 96 | `                boolean hasInventory = !seatInventoryRepository.findByFlightId(fid).isEmpty();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 97 | `                if (hasInventory) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 98 | `                    flight.setAvailableSeats(0);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 99 | `                    return;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 100 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 101 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 102 | `            flight.setAvailableSeats(declaredCapacity(flight));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 103 | `        } catch (Exception ex) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 104 | `            log.warn("Available-seat lookup failed for flight {} ({})", flight.getFlightNumber(), ex.getMessage());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 105 | `            flight.setAvailableSeats(declaredCapacity(flight));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 106 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 107 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 108 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 109 | `    private static int declaredCapacity(Flight flight) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 110 | `        if (flight.getSeatCount() != null && flight.getSeatCount() > 0) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 111 | `            return flight.getSeatCount();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 112 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 113 | `        if (flight.getSeatRows() != null && flight.getSeatColumns() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 114 | `            return Math.max(flight.getSeatRows() * flight.getSeatColumns(), 0);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 115 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 116 | `        return 0;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 117 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 118 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 119 | `    private static String resolveAirlineName(Flight flight, Map<Integer, String> airlineMap) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 120 | `        if (flight.getAirlineId() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 121 | `            String mapped = airlineMap.get(flight.getAirlineId());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 122 | `            if (mapped != null && !mapped.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 123 | `                return mapped;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 124 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 125 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 126 | `        if (flight.getFlightName() != null && !flight.getFlightName().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 127 | `            return flight.getFlightName();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 128 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 129 | `        return "Unknown";` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 130 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 131 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 132 | `    private static final Map<String, String> LOCATION_TO_CODE = buildLocationToCode();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 133 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 134 | `    private static Set<String> buildInternationalAirportCodes() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 135 | `        Set<String> codes = new HashSet<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 136 | `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 137 | `            codes.add(airport.code().toUpperCase(Locale.ROOT));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 138 | `            codes.add(airport.city().toUpperCase(Locale.ROOT));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 139 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 140 | `        return codes;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 141 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 142 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 143 | `    private static Map<String, String> buildLocationToCode() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 144 | `        Map<String, String> map = new HashMap<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 145 | `        // Add domestic airports` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 146 | `        for (IndianAirports.Airport airport : IndianAirports.AIRPORTS) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 147 | `            String code = airport.code().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 148 | `            map.put(code, code);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 149 | `            map.put(airport.city().toUpperCase(Locale.ROOT), code);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 150 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 151 | `        // Add international airports` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 152 | `        for (IndianAirports.Airport airport : InternationalAirports.AIRPORTS) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 153 | `            String code = airport.code().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 154 | `            map.put(code, code);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 155 | `            map.put(airport.city().toUpperCase(Locale.ROOT), code);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 156 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 157 | `        return map;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 158 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 159 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 160 | `    private static String canonicalLocation(String location) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 161 | `        if (location == null) return null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 162 | `        String key = location.trim().toUpperCase(Locale.ROOT);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 163 | `        if (key.isEmpty()) return null;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 164 | `        return LOCATION_TO_CODE.getOrDefault(key, key);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 165 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 166 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 167 | `    private static boolean matchesLocation(String stored, String queryCanonical) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 168 | `        if (queryCanonical == null) return true;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 169 | `        return queryCanonical.equals(canonicalLocation(stored));` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 170 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 171 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 172 | `    private static LocalDate extractDate(String value) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 173 | `        if (value == null \\|\\| value.isBlank()) return null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 174 | `        String datePart = value.trim().replace('T', ' ').split(" ")[0];` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 175 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 176 | `            return LocalDate.parse(datePart);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 177 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 178 | `            return null;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 179 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 180 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 181 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 182 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 183 | `    public Booking prepareBookingDraft(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 184 | `        Booking bookingDraft = booking == null ? new Booking() : booking;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 185 | `        int passengerCount = clampPassengers(bookingDraft.getPassengers());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 186 | `        bookingDraft.setPassengers(passengerCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 187 | `        ensurePassengerSlots(bookingDraft, passengerCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 188 | `        return bookingDraft;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 189 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 190 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 191 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 192 | `    @Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the reservation workflow step that builds and persists the booking data after a flight is chosen.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 193 | `    public Booking createBooking(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 194 | `        Booking bookingToSave = booking == null ? new Booking() : booking;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 195 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 196 | `        Flight resolvedFlight = resolveFlightReference(bookingToSave);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 197 | `        bookingToSave.setFlight(resolvedFlight);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 198 | `        bookingToSave.setFromLocation(resolvedFlight.getOrigin());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 199 | `        bookingToSave.setToLocation(resolvedFlight.getDestination());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 200 | `        bookingToSave.setAirline(resolvedFlight.getAirlineName());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 201 | `        bookingToSave.setFlightType(isInternationalFlight(resolvedFlight) ? "international" : "domestic");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 202 | `        if (resolvedFlight.getDepartureTime() != null && !resolvedFlight.getDepartureTime().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 203 | `            String depDate = resolvedFlight.getDepartureTime().trim().split(" ")[0].split("T")[0];` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 204 | `            bookingToSave.setDepartureDate(depDate);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 205 | `            bookingToSave.setFlyDate(depDate);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 206 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 207 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 208 | `        int passengerCount = clampPassengers(bookingToSave.getPassengers());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 209 | `        bookingToSave.setPassengers(passengerCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 210 | `        ensurePassengerSlots(bookingToSave, passengerCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 211 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 212 | `        // FIXED: Passengers are mapped without calling immediate early repository updates` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 213 | `        bookingToSave.setPassengerDetails(resolvePassengers(bookingToSave.getPassengerDetails()));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 214 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 215 | `        enforceOnePassengerPerFlight(bookingToSave);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 216 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 217 | `        if (bookingToSave.getFlightType() == null \\|\\| bookingToSave.getFlightType().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 218 | `            bookingToSave.setFlightType("domestic");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 219 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 220 | `        MockPaymentService.MockPaymentResult paymentResult = mockPaymentService.processBookingPayment(bookingToSave);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 221 | `        bookingToSave.setPnr(paymentResult.pnr());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 222 | `        bookingToSave.setStatus(paymentResult.bookingStatus());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 223 | `        if (bookingToSave.getSeat() == null \\|\\| bookingToSave.getSeat().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 224 | `            bookingToSave.setSeat("12B");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 225 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 226 | `        if (bookingToSave.getPassengers() <= 0) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 227 | `            bookingToSave.setPassengers(1);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 228 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 229 | `        if (bookingToSave.getDepartureDate() != null && !bookingToSave.getDepartureDate().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 230 | `            bookingToSave.setFlyDate(bookingToSave.getDepartureDate());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 231 | `        } else if (bookingToSave.getFlyDate() == null \\|\\| bookingToSave.getFlyDate().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 232 | `            bookingToSave.setFlyDate(LocalDate.now().plusDays(7).toString());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 233 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 234 | `        if (bookingToSave.getFare() <= 0) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 235 | `            bookingToSave.setFare(calculateFare(bookingToSave));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 236 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 237 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 238 | `        List<SeatInventory> seatsToMark = new ArrayList<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 239 | `        if (bookingToSave.getSeat() != null && !bookingToSave.getSeat().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 240 | `            String[] parts = bookingToSave.getSeat().split(",");` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 241 | `            for (String p : parts) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 242 | `                String sNum = p == null ? null : p.trim();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 243 | `                if (sNum == null \\|\\| sNum.isBlank()) continue;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 244 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 245 | `                Object fIdRaw = bookingToSave.getFlightId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 246 | `                Integer flightIdInt = null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 247 | `                if (fIdRaw != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 248 | `                    if (fIdRaw instanceof Number) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 249 | `                        flightIdInt = ((Number) fIdRaw).intValue();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 250 | `                    } else {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 251 | `                        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 252 | `                            flightIdInt = Integer.valueOf(fIdRaw.toString());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 253 | `                        } catch (NumberFormatException e) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 254 | `                            flightIdInt = null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 255 | `                        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 256 | `                    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 257 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 258 | `                SeatInventory si = findSeat(flightIdInt, sNum);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 259 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 260 | `                if (si != null && si.getSeatStatus() == SeatStatus.BOOKED) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 261 | `                    throw new IllegalStateException("Seat " + sNum + " is already booked. Please choose another seat.");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 262 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 263 | `                if (si != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 264 | `                    log.info("Adding seat to mark as booked: flightId={}, seatNumber={}, currentStatus={}", flightIdInt, sNum, si.getSeatStatus());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 265 | `                    seatsToMark.add(si);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 266 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 267 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 268 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 269 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 270 | `        // Setup bidirectional reference links explicitly right before execution save` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 271 | `        if (bookingToSave.getPassengerDetails() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 272 | `            bookingToSave.getPassengerDetails().forEach(p -> p.setBooking(bookingToSave));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 273 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 274 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 275 | `        Booking saved = bookingRepository.save(bookingToSave);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 276 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 277 | `        log.info("Marking {} seats as booked", seatsToMark.size());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 278 | `        for (SeatInventory si : seatsToMark) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 279 | `            si.setSeatStatus(SeatStatus.BOOKED);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 280 | `            SeatInventory updated = seatInventoryRepository.save(si);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 281 | `            log.info("Seat marked as booked: seatNumber={}, newStatus={}", updated.getSeatNumber(), updated.getSeatStatus());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 282 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 283 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 284 | `        awardDistanceMiles(saved);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 285 | `        return saved;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 286 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 287 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 288 | `    private Flight resolveFlightReference(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 289 | `        Long flightId = booking.getFlightId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 290 | `        if (flightId == null && booking.getFlight() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 291 | `            flightId = booking.getFlight().getFlightId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 292 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 293 | `        if (flightId == null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 294 | `            throw new IllegalArgumentException("Flight id is required for booking creation.");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 295 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 296 | `        final Long resolvedFlightId = flightId;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 297 | `        Flight flight = flightClient.getFlightById(resolvedFlightId);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 298 | `        if (flight == null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 299 | `            throw new IllegalArgumentException("Flight not found for id: " + resolvedFlightId);` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 300 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 301 | `        booking.setFlight(flight);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 302 | `        return flight;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 303 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 304 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 305 | `    // FIXED: Cleaned up logic to eliminate early .save() calls inside loops` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 306 | `    private List<Passenger> resolvePassengers(List<Passenger> incoming) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 307 | `        List<Passenger> resolved = new ArrayList<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 308 | `        if (incoming == null) return resolved;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 309 | `        for (Passenger p : incoming) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 310 | `            if (p == null) continue;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 311 | `            Passenger existing = null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 312 | `            if (p.getId() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 313 | `                existing = passengerRepository.findById(p.getId()).orElse(null);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 314 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 315 | `            if (existing == null && p.getEmail() != null && !p.getEmail().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 316 | `                List<Passenger> matches = passengerRepository.findByEmailIgnoreCase(p.getEmail().trim());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 317 | `                existing = matches.isEmpty() ? null : matches.get(0);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 318 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 319 | `            if (existing != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 320 | `                if (p.getFullName() != null && !p.getFullName().isBlank()) existing.setFullName(p.getFullName());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 321 | `                if (p.getAge() != null) existing.setAge(p.getAge());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 322 | `                if (p.getGender() != null && !p.getGender().isBlank()) existing.setGender(p.getGender());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 323 | `                if (p.getEmail() != null && !p.getEmail().isBlank()) existing.setEmail(p.getEmail());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 324 | `                if (p.getPhone() != null && !p.getPhone().isBlank()) existing.setPhone(p.getPhone());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 325 | `                if (existing.getDistanceMiles() == null) existing.setDistanceMiles(0.0);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 326 | `                resolved.add(existing);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 327 | `            } else {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 328 | `                if (p.getId() != null) p.setId(null);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 329 | `                if (p.getDistanceMiles() == null) p.setDistanceMiles(0.0);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 330 | `                resolved.add(p);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 331 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 332 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 333 | `        return resolved;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 334 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 335 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 336 | `    private void enforceOnePassengerPerFlight(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 337 | `        Object rawFlightId = booking != null ? booking.getFlightId() : null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 338 | `        if (rawFlightId == null) return;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 339 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 340 | `        List<Passenger> currentDetails = null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 341 | `        try { currentDetails = booking.getPassengerDetails(); } catch (Exception e) {}` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 342 | `        if (currentDetails == null) return;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 343 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 344 | `        Set<Long> seenIds = new HashSet<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 345 | `        Set<String> seenEmails = new HashSet<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 346 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 347 | `        for (Passenger p : currentDetails) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 348 | `            if (p == null) continue;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 349 | `            Long id = p.getId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 350 | `            String email = (p.getEmail() != null && !p.getEmail().trim().isEmpty())` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 351 | `                    ? p.getEmail().trim().toLowerCase(Locale.ROOT) : null;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 352 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 353 | `            if (id != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 354 | `                if (!seenIds.add(id)) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 355 | `                    throw new IllegalStateException("Passenger " + describePassenger(p) + " is duplicated in this booking request form.");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 356 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 357 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 358 | `            if (email != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 359 | `                if (!seenEmails.add(email)) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 360 | `                    throw new IllegalStateException("Passenger with email " + email + " is duplicated in this booking request form.");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 361 | `                }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 362 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 363 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 364 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 365 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 366 | `    private static String describePassenger(Passenger p) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 367 | `        if (p.getFullName() != null && !p.getFullName().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 368 | `            return p.getId() != null ? p.getFullName() + " (ID " + p.getId() + ")" : p.getFullName();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 369 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 370 | `        if (p.getId() != null) return "ID " + p.getId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 371 | `        if (p.getEmail() != null && !p.getEmail().isBlank()) return p.getEmail();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 372 | `        return "provided";` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 373 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 374 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 375 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 376 | `    public void validateNoDuplicatePassengerOnFlight(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 377 | `        enforceOnePassengerPerFlight(booking);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 378 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 379 | `        // Check if any passenger is already booked on the same flight` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 380 | `        Long flightId = booking.getFlightId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 381 | `        List<Passenger> currentPassengers = booking.getPassengerDetails();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 382 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 383 | `        if (flightId == null \\|\\| currentPassengers == null \\|\\| currentPassengers.isEmpty()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 384 | `            return;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 385 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 386 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 387 | `        for (Passenger passenger : currentPassengers) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 388 | `            if (passenger == null) continue;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 389 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 390 | `            Long passengerId = passenger.getId();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 391 | `            String email = (passenger.getEmail() != null && !passenger.getEmail().trim().isEmpty())` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 392 | `                    ? passenger.getEmail().trim() : null;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 393 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 394 | `            // Check if this passenger already has bookings on this flight` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 395 | `            List<Passenger> existingBookings = passengerRepository.findPassengerBookingsOnFlight(` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 396 | `                    flightId,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 397 | `                    passengerId,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 398 | `                    email` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 399 | `            );` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 400 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 401 | `            if (!existingBookings.isEmpty()) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 402 | `                throw new IllegalStateException(` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 403 | `                        "Passenger " + describePassenger(passenger) + " is already booked on this flight. " +` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 404 | `                                "prA person cannot book multiple seats on the same flight."` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 405 | `                );` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 406 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 407 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 408 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 409 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this calculates route distance from airport coordinates. The result is used as flight information and can support downstream loyalty/fare behavior.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 410 | `    private void awardDistanceMiles(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 411 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 412 | `            if (booking.getFlightId() == null \\|\\| booking.getPassengerDetails() == null \\|\\| booking.getPassengerDetails().isEmpty()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 413 | `                return;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 414 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 415 | `            Flight flight = flightClient.getFlightById(booking.getFlightId().longValue());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 416 | `            double routeMiles = (flight != null && flight.getDistanceMiles() != null) ? flight.getDistanceMiles() : 0.0;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 417 | `            if (routeMiles <= 0) return;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 418 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 419 | `            booking.getPassengerDetails().forEach(p -> {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 420 | `                double current = (p.getDistanceMiles() != null) ? p.getDistanceMiles() : 0.0;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 421 | `                p.setDistanceMiles(current + routeMiles);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 422 | `            });` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 423 | `            passengerRepository.saveAll(booking.getPassengerDetails());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 424 | `        } catch (Exception ex) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 425 | `            log.warn("Could not award distance miles ({})", ex.getMessage());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 426 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 427 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 428 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 429 | `    private SeatInventory findSeat(Integer flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 430 | `        if (flightId == null \\|\\| seatNumber == null \\|\\| seatNumber.isBlank()) return null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 431 | `        return seatInventoryRepository.findByFlightIdAndSeatNumber(flightId, seatNumber).orElse(null);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 432 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 433 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 434 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 435 | `    public Booking selectSeat(Long bookingId, String seat) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 436 | `        Booking booking = bookingRepository.findById(bookingId)` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 437 | `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 438 | `        if (seat != null && !seat.isBlank()) booking.setSeat(seat);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 439 | `        return bookingRepository.save(booking);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 440 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 441 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 442 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 443 | `    public Booking modifyBooking(Long bookingId, Booking updatedBooking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 444 | `        Booking existing = bookingRepository.findById(bookingId)` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 445 | `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 446 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 447 | `        if (updatedBooking != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 448 | `            if (updatedBooking.getFlightType() != null && !updatedBooking.getFlightType().isBlank()) existing.setFlightType(updatedBooking.getFlightType());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 449 | `            if (updatedBooking.getFromLocation() != null && !updatedBooking.getFromLocation().isBlank()) existing.setFromLocation(updatedBooking.getFromLocation());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 450 | `            if (updatedBooking.getToLocation() != null && !updatedBooking.getToLocation().isBlank()) existing.setToLocation(updatedBooking.getToLocation());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 451 | `            if (updatedBooking.getAirline() != null && !updatedBooking.getAirline().isBlank()) existing.setAirline(updatedBooking.getAirline());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 452 | `            if (updatedBooking.getSeat() != null && !updatedBooking.getSeat().isBlank()) existing.setSeat(updatedBooking.getSeat());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 453 | `            if (updatedBooking.getDepartureDate() != null && !updatedBooking.getDepartureDate().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 454 | `                existing.setDepartureDate(updatedBooking.getDepartureDate());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 455 | `                existing.setFlyDate(updatedBooking.getDepartureDate());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 456 | `            } else if (updatedBooking.getFlyDate() != null && !updatedBooking.getFlyDate().isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 457 | `                existing.setFlyDate(updatedBooking.getFlyDate());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 458 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 459 | `            if (updatedBooking.getPassengers() > 0) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 460 | `                int updatedCount = clampPassengers(updatedBooking.getPassengers());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 461 | `                existing.setPassengers(updatedCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 462 | `                ensurePassengerSlots(existing, updatedCount);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 463 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 464 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 465 | `        existing.setFare(calculateFare(existing));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 466 | `        return bookingRepository.save(existing);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 467 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 468 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 469 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 470 | `    @Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 471 | `    public Booking cancelBooking(Long bookingId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 472 | `        Booking booking = bookingRepository.findById(bookingId)` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 473 | `                .orElseThrow(() -> new IllegalArgumentException(BOOKING_NOT_FOUND + bookingId));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 474 | `        booking.setStatus("CANCELLED");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 475 | `        Booking saved = bookingRepository.save(booking);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 476 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 477 | `        if (booking.getFlightId() != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 478 | `            SeatInventory seat = findSeat(Math.toIntExact(booking.getFlightId()), booking.getSeat());` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 479 | `            if (seat != null && seat.getSeatStatus() == SeatStatus.BOOKED) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 480 | `                seat.setSeatStatus(SeatStatus.AVAILABLE);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 481 | `                seatInventoryRepository.save(seat);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 482 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 483 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 484 | `        return saved;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 485 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 486 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 487 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 488 | `    public Booking getBookingDetails() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 489 | `        return bookingRepository.findTopByOrderByIdDesc().orElseGet(this::createDefaultBookingPreview);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 490 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 491 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 492 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Booking Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 493 | `    public Booking getBookingById(Long bookingId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 494 | `        if (bookingId == null) return createDefaultBookingPreview();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 495 | `        return bookingRepository.findById(bookingId).orElseGet(this::createDefaultBookingPreview);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 496 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 497 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 498 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Booking Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 499 | `    public List<Booking> getAllBookings() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 500 | `        return bookingRepository.findAllByOrderByIdDesc();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 501 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 502 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 503 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Booking Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 504 | `    public Passenger getPassengerById(Long passengerId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 505 | `        if (passengerId == null) return null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 506 | `        return passengerRepository.findById(passengerId).orElse(null);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 507 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 508 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 509 | `    private Booking createDefaultBookingPreview() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 510 | `        Booking booking = new Booking();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 511 | `        booking.setFlightType("domestic");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 512 | `        booking.setFromLocation("CJB");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 513 | `        booking.setToLocation("HYD");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 514 | `        booking.setPassengers(1);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 515 | `        booking.setPnr(mockPaymentService.generatePnr());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 516 | `        booking.setStatus("CONFIRMED");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 517 | `        booking.setAirline("IndiGo");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 518 | `        booking.setSeat("12B");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 519 | `        booking.setFare(5200.0);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 520 | `        booking.setFlyDate("2026-06-15");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 521 | `        return booking;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 522 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 523 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 524 | `    private double calculateFare(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 525 | `        double baseFare = "international".equalsIgnoreCase(booking.getFlightType()) ? 18500.0 : 5200.0;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 526 | `        return baseFare * Math.max(booking.getPassengers(), 1);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 527 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 528 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 529 | `    private boolean isInternationalLocation(String location) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 530 | `        return location != null && INTERNATIONAL_AIRPORT_CODES.contains(location.trim().toUpperCase(Locale.ROOT));` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 531 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 532 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 533 | `    private boolean isInternationalFlight(Flight flight) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 534 | `        return isInternationalLocation(flight.getOrigin()) \\|\\| isInternationalLocation(flight.getDestination());` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 535 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 536 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this helper protects the workflow before data is saved or returned. It rejects invalid flight/booking input early and keeps controllers simpler.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 537 | `    private LocalDate parseDate(String value) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 538 | `        if (value == null \\|\\| value.isBlank()) return null;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 539 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 540 | `            return LocalDate.parse(value);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 541 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 542 | `            return null;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 543 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 544 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 545 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 546 | `    private int clampPassengers(int requested) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 547 | `        return Math.min(Math.max(requested, 1), MAX_PASSENGERS);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 548 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 549 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 550 | `    private void ensurePassengerSlots(Booking booking, int passengerCount) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 551 | `        List<Passenger> currentPassengers = booking.getPassengerDetails();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 552 | `        if (currentPassengers == null) currentPassengers = new ArrayList<>();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 553 | `        while (currentPassengers.size() < passengerCount) currentPassengers.add(new Passenger());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 554 | `        while (currentPassengers.size() > passengerCount) currentPassengers.removeLast();` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 555 | `        booking.setPassengerDetails(currentPassengers);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 556 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 557 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/service/MockPaymentService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Booking Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.service;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Booking;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 6 | `import java.security.SecureRandom;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 8 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `public class MockPaymentService {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 10 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 11 | `    private static final char[] ALPHANUMERIC = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".toCharArray();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 12 | `    private static final SecureRandom RANDOM = new SecureRandom();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 13 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the final reservation step. It confirms the selected seat, records payment/booking state and returns the confirmation/PNR data shown to the customer.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 14 | `    public MockPaymentResult processBookingPayment(Booking booking) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 15 | `        return new MockPaymentResult(generatePnr(), "CONFIRMED");` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 16 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 17 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this generates the reference used by passengers and staff to identify the completed reservation.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 18 | `    public String generatePnr() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 19 | `        return generateToken(8);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 20 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 21 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 22 | `    private String generateToken(int length) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 23 | `        StringBuilder token = new StringBuilder(length);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 24 | `        for (int index = 0; index < length; index++) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 25 | `            token.append(ALPHANUMERIC[RANDOM.nextInt(ALPHANUMERIC.length)]);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 26 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `        return token.toString();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 28 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 29 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 30 | `    public record MockPaymentResult(String pnr, String bookingStatus) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/service/PassengerService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Booking Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.service;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.repository.PassengerRepository;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 8 | `import java.util.List;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 9 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 10 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 11 | `public class PassengerService {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 12 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 13 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `    private PassengerRepository passengerRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    public Passenger getPassenger() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 17 | `        List<Passenger> all = passengerRepository.findAll();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 18 | `        return all.isEmpty() ? null : all.get(0);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 19 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 20 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 21 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

</details>

<details>
<summary><strong>booking-service/src/main/java/com/genc/arfoms/booking/service/SeatPaymentService.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Business-service layer. In this project, this file contains the rules that make the Booking Service workflow work. Controllers call it; it reads/writes repositories and may call another microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.booking.service;` | places this code in the ARFOMS Booking Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.booking.dto.BookingResult;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.booking.model.Flight;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 5 | `import com.genc.arfoms.booking.model.Passenger;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 6 | `import com.genc.arfoms.booking.model.Payment;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 7 | `import com.genc.arfoms.booking.model.SeatInventory;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 8 | `import com.genc.arfoms.booking.model.SeatStatus;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 9 | `import com.genc.arfoms.booking.repository.PaymentRepository;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 10 | `import com.genc.arfoms.booking.repository.SeatInventoryRepository;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 11 | `import com.genc.arfoms.booking.client.FlightClient;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 12 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 13 | `import org.springframework.stereotype.Service;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 14 | `import org.springframework.transaction.annotation.Transactional;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 16 | `import java.time.LocalDateTime;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 17 | `import java.time.format.DateTimeFormatter;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 18 | `import java.time.format.DateTimeParseException;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 19 | `import java.util.List;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 20 | `import java.util.Optional;` | brings in a framework/domain type required by this Business-service layer; the imported API enables the behavior used below. |
| 21 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 22 | `@Service` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `public class SeatPaymentService {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 25 | `    private static final int BASE_FARE = 18500;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 26 | `    private static final int TAXES = 1250;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 27 | `    private static final int SAVINGS = 950;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 28 | `    private static final int WINDOW_CHARGE = 700;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 29 | `    private static final int AISLE_CHARGE = 500;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 30 | `    private static final DateTimeFormatter TIME_FMT = DateTimeFormatter.ofPattern("hh:mm a");` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 31 | `    private static final DateTimeFormatter STORED_FMT = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 32 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 33 | `    private final SeatInventoryRepository seatInventoryRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 34 | `    private final PaymentRepository paymentRepository;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 35 | `    private final FlightClient flightClient;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 36 | `    private final PassengerService passengerService;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 37 | `    private final MockPaymentService mockPaymentService;` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 38 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 39 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 40 | `    public SeatPaymentService(SeatInventoryRepository seatInventoryRepository,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 41 | `                              PaymentRepository paymentRepository,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 42 | `                              FlightClient flightClient,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 43 | `                              PassengerService passengerService,` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 44 | `                              MockPaymentService mockPaymentService) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 45 | `        this.seatInventoryRepository = seatInventoryRepository;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 46 | `        this.paymentRepository = paymentRepository;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 47 | `        this.flightClient = flightClient;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 48 | `        this.passengerService = passengerService;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 49 | `        this.mockPaymentService = mockPaymentService;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 50 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 51 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 52 | `    public List<SeatInventory> getSeatsByFlight(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 53 | `        return seatInventoryRepository.findByFlightIdOrderBySeatNumberAsc(toInt(flightId));` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 54 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 55 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 56 | `    public List<SeatInventory> getAvailableSeats(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 57 | `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.AVAILABLE);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 58 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 59 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 60 | `    public List<SeatInventory> getBookedSeats(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 61 | `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.BOOKED);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 62 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 63 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 64 | `    public long countAvailableSeats(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 65 | `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.AVAILABLE).size();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 66 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 67 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 68 | `    public long countBookedSeats(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 69 | `        return seatInventoryRepository.findByFlightIdAndSeatStatus(toInt(flightId), SeatStatus.BOOKED).size();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 70 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 71 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 72 | `    public boolean isSeatBooked(Long flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 73 | `        return seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber)` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 74 | `                .map(seat -> seat.getSeatStatus() == SeatStatus.BOOKED)` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 75 | `                .orElse(false);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 76 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 77 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 78 | `    @Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 79 | `    public boolean confirmSeatSelection(Long flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 80 | `        Optional<SeatInventory> seatOpt =` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 81 | `                seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 82 | `        if (seatOpt.isPresent()) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 83 | `            SeatInventory seat = seatOpt.get();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 84 | `            if (seat.getSeatStatus() == SeatStatus.AVAILABLE) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 85 | `                seat.setSeatStatus(SeatStatus.BOOKED);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 86 | `                seatInventoryRepository.save(seat);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 87 | `                return true;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 88 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 89 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 90 | `        return false;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 91 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 92 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 93 | `    @Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 94 | `    public void resetSeatSelection(Long flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 95 | `        Optional<SeatInventory> seatOpt =` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 96 | `                seatInventoryRepository.findByFlightIdAndSeatNumber(toInt(flightId), seatNumber);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 97 | `        if (seatOpt.isPresent()) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 98 | `            SeatInventory seat = seatOpt.get();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 99 | `            seat.setSeatStatus(SeatStatus.AVAILABLE);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 100 | `            seatInventoryRepository.save(seat);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 101 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 102 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 103 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Booking Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 104 | `    public List<Payment> getAllPayments() {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 105 | `        return paymentRepository.findAll();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 106 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 107 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is a read operation used by a controller or another workflow step to retrieve the Booking Service data needed for the current screen/request.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 108 | `    public Optional<Payment> getPaymentById(int id) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 109 | `        return paymentRepository.findById(id);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 110 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 111 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the final reservation step. It confirms the selected seat, records payment/booking state and returns the confirmation/PNR data shown to the customer.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 112 | `    public Payment savePayment(Payment payment) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 113 | `        return paymentRepository.save(payment);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 114 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 115 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 116 | `    public Optional<Payment> findByFlightIdAndSeatNumber(Integer flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 117 | `        return paymentRepository.findByFlightIdAndSeatNumber(flightId, seatNumber);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 118 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 119 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 120 | `    public void deletePayment(int id) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 121 | `        paymentRepository.deleteById(id);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 122 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 123 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 124 | `    @Transactional` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is the final reservation step. It confirms the selected seat, records payment/booking state and returns the confirmation/PNR data shown to the customer.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 125 | `    public BookingResult confirmBooking(Long flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 126 | `        if (flightId == null \\|\\| seatNumber == null \\|\\| seatNumber.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 127 | `            return BookingResult.failure("Missing flight or seat information.");` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 128 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 129 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 130 | `        // 1. Break the session relationship reference tracker causing the Transient Exception error` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 131 | `        Passenger passenger = passengerService.getPassenger();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 132 | `        if (passenger != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 133 | `            passenger.setBooking(null);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 134 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 135 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 136 | `        boolean justBooked = confirmSeatSelection(flightId, seatNumber);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 137 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 138 | `        if (!justBooked) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 139 | `            Payment existing = findByFlightIdAndSeatNumber(flightId.intValue(), seatNumber).orElse(null);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 140 | `            if (existing != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 141 | `                return BookingResult.success(existing.getBookingId(), existing.getSeatNumber(),` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 142 | `                        existing.getTotalAmount());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 143 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 144 | `            return BookingResult.failure("Sorry, this seat is no longer available. Please choose another seat.");` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 145 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 146 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 147 | `        // 2. Build payment tracking layout and assign the generated Mock PNR` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 148 | `        Payment bookingDetails = buildBooking(flightId, seatNumber);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 149 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 150 | `        // Save to DB` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 151 | `        Payment saved = savePayment(bookingDetails);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 152 | `        return BookingResult.success(saved.getBookingId(), saved.getSeatNumber(), saved.getTotalAmount());` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 153 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 154 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the final reservation step. It confirms the selected seat, records payment/booking state and returns the confirmation/PNR data shown to the customer.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 155 | `    public Payment buildBooking(Long flightId, String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 156 | `        int seatCharges = calculateSeatCharge(seatNumber);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 157 | `        int totalAmount = BASE_FARE + seatCharges + TAXES;` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 158 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 159 | `        Flight flight = flightClient.getFlightById(flightId);` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 160 | `        Passenger passenger = passengerService.getPassenger();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 161 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 162 | `        // Generate Mock PNR using the service` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 163 | `        String mockPnr = mockPaymentService.generatePnr();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 164 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 165 | `        Payment booking = new Payment();` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 166 | `        booking.setBaseFare(String.valueOf(BASE_FARE));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 167 | `        booking.setSeatCharges(String.valueOf(seatCharges));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 168 | `        booking.setTaxes(String.valueOf(TAXES));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 169 | `        booking.setTotalAmount(String.valueOf(totalAmount));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 170 | `        booking.setSavings(String.valueOf(SAVINGS));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 171 | `        booking.setSeatNumber(seatNumber);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 172 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 173 | `        if (flight != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 174 | `            booking.setFlight(flight);` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 175 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 176 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 177 | `        if (flight != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 178 | `            booking.setFlightNumber(flight.getFlightNumber());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 179 | `            booking.setSource(flight.getOrigin());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 180 | `            booking.setDestination(flight.getDestination());` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 181 | `            booking.setDepartureTime(formatStored(flight.getDepartureTime()));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 182 | `            booking.setArrivalTime(formatStored(flight.getArrivalTime()));` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 183 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 184 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |
| 185 | `        if (passenger != null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 186 | `            // Append the PNR string directly into the passenger metadata string` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 187 | `            // so the confirmation page front-end display can read it smoothly!` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 188 | `            booking.setPassengerName(passenger.getName() + " (PNR: " + mockPnr + ")");` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 189 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 190 | `        return booking;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 191 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 192 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 193 | `    private static String formatStored(String stored) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 194 | `        if (stored == null \\|\\| stored.isBlank()) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 195 | `            return "-";` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 196 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 197 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 198 | `            return LocalDateTime.parse(stored, STORED_FMT).format(TIME_FMT);` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 199 | `        } catch (DateTimeParseException ex) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 200 | `            return stored;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 201 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 202 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 203 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method serves the seat-map/payment flow. It reads or updates seat status so the UI can show available seats and prevent duplicate selection.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 204 | `    private int calculateSeatCharge(String seatNumber) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 205 | `        if (seatNumber == null) {` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 206 | `            return 0;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 207 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 208 | `        try {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 209 | `            int col = Integer.parseInt(seatNumber.substring(1));` | calculates or assigns data needed by this Business-service layer in the Booking Service workflow. |
| 210 | `            switch (col) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 211 | `                case 1:` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 212 | `                case 4:` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 213 | `                    return WINDOW_CHARGE;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 214 | `                case 2:` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 215 | `                case 3:` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 216 | `                    return AISLE_CHARGE;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 217 | `                default:` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 218 | `                    return 0;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 219 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 220 | `        } catch (NumberFormatException e) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 221 | `            return 0;` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 222 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 223 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 224 | `` | blank line only; it separates steps in this Business-service layer file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Booking Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 225 | `    private static Integer toInt(Long flightId) {` | this statement participates in the Booking Service Business-service layer behavior described for this file. |
| 226 | `        return flightId == null ? null : flightId.intValue();` | returns this result to the caller in the Booking Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 227 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 228 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>booking-service/src/main/resources/application.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `spring.application.name=booking-service` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.config.import=optional:configserver:http://localhost:8888` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>booking-service/src/main/resources/log4j2.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Runtime configuration. In this project, these settings control ports, database connectivity, Eureka registration, logging or Gateway routing at runtime.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `status = warn` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `name = ARFOMSLogConfig` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 4 | `property.logDir = logs` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `property.appName = booking-service` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 7 | `appenders = console, rolling` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 9 | `appender.console.type = Console` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `appender.console.name = Console` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `appender.console.layout.type = PatternLayout` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 14 | `appender.rolling.type = RollingFile` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `appender.rolling.name = RollingFile` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `appender.rolling.fileName = ${logDir}/${appName}.log` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `appender.rolling.layout.type = PatternLayout` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 19 | `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 20 | `appender.rolling.policies.type = Policies` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 21 | `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 22 | `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 23 | `appender.rolling.policies.size.size = 10MB` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 24 | `appender.rolling.strategy.type = DefaultRolloverStrategy` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 25 | `appender.rolling.strategy.max = 14` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 26 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 27 | `rootLogger.level = info` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 28 | `rootLogger.appenderRefs = console, rolling` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 29 | `rootLogger.appenderRef.console.ref = Console` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 30 | `rootLogger.appenderRef.rolling.ref = RollingFile` | this setting controls how Booking Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

## Auth Service - `auth-service`


This owns user accounts and login. It creates JWTs; the other services validate those JWTs before allowing protected operations.

<details>
<summary><strong>auth-service/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<?xml version="1.0" encoding="UTF-8"?>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 2 | `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 3 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 4 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 5 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 6 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 7 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 8 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 9 | `        <relativePath>../pom.xml</relativePath>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 10 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 11 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 12 | `    <artifactId>auth-service</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 13 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 14 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 15 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 16 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 17 | `            <artifactId>spring-boot-starter-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 18 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 19 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 20 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 21 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 22 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 23 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 24 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 25 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 26 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 27 | `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 28 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 29 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 30 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 31 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 32 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 33 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 34 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 35 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 36 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 37 | `            <artifactId>jjwt-api</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 38 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 39 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 40 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 41 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 42 | `            <artifactId>jjwt-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 43 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 44 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 45 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 46 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 47 | `            <groupId>io.jsonwebtoken</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 48 | `            <artifactId>jjwt-jackson</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 49 | `            <version>0.11.5</version>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 50 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 51 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 52 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 53 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 54 | `            <artifactId>spring-boot-starter-data-jpa</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 55 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 56 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 57 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 58 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 59 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 60 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 61 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 62 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 63 | `            <groupId>com.mysql</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 64 | `            <artifactId>mysql-connector-j</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 65 | `            <scope>runtime</scope>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 66 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 67 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 68 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 69 | `            <artifactId>spring-boot-starter-security</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 70 | `            <exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 71 | `                <exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 72 | `                    <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 73 | `                    <artifactId>spring-boot-starter-logging</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 74 | `                </exclusion>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 75 | `            </exclusions>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 76 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 77 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 78 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 79 | `            <artifactId>log4j-slf4j2-impl</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 80 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 81 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 82 | `            <groupId>org.apache.logging.log4j</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 83 | `            <artifactId>log4j-core</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 84 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 85 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 86 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 87 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 88 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 89 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 90 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 91 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 92 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 93 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 94 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |
| 95 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by Auth Service. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/AuthApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `import org.springframework.cloud.client.discovery.EnableDiscoveryClient;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 7 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 8 | `@EnableDiscoveryClient` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `public class AuthApplication {` | this statement participates in the Auth Service Service bootstrap behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the Auth Service application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 10 | `    public static void main(String[] args) {` | this statement participates in the Auth Service Service bootstrap behavior described for this file. |
| 11 | `        SpringApplication.run(AuthApplication.class, args);` | this statement participates in the Auth Service Service bootstrap behavior described for this file. |
| 12 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 13 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/AuthController.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Supporting project code. This file supports the Auth Service role in the ARFOMS microservice system.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.auth.model.User;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.auth.repository.UserRepository;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 5 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 6 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 7 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 8 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 9 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 10 | `import org.springframework.web.bind.annotation.*;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 11 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 12 | `import com.genc.arfoms.auth.exception.PasswordIncorrectException;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 13 | `import com.genc.arfoms.auth.exception.UserAlreadyExistsException;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 14 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 15 | `import java.util.Map;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 16 | `import java.util.Optional;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 18 | `@RestController` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `@RequestMapping("/api/auth")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `public class AuthController {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 22 | `    private final Logger logger = LoggerFactory.getLogger(AuthController.class);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 23 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 24 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 25 | `    private JwtUtils jwtUtils;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 27 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 28 | `    private UserRepository userRepository;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 29 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 30 | `    @PostMapping("/login")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: the login page sends credentials here. This method checks the User record and returns a JWT that the frontend attaches to later requests.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 31 | `    public ResponseEntity<?> login(@RequestBody Map<String, String> credentials) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 32 | `        String username = credentials.get("username");` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 33 | `        String password = credentials.get("password");` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 34 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 35 | `        logger.info("Login attempt for user: {}", username);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 36 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 37 | `        if (username == null \\|\\| password == null) {` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 38 | `            logger.warn("Login failed: Username or password missing.");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 39 | `            throw new IllegalArgumentException("Username and password required");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 40 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 41 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 42 | `        Optional<User> userOpt = userRepository.findByUsername(username);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 43 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 44 | `        if (userOpt.isPresent() && userOpt.get().getPassword().equals(password)) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 45 | `            User user = userOpt.get();` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 46 | `            String token = jwtUtils.generateToken(username, user.getRole());` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 47 | `            logger.info("Login successful for user: {}, role: {}", username, user.getRole());` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 48 | `            return ResponseEntity.ok(Map.of(` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 49 | `                    "token", token,` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 50 | `                    "role", user.getRole(),` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 51 | `                    "name", user.getName()` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 52 | `            ));` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 53 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 54 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 55 | `        logger.warn("Login failed: Invalid credentials for user: {}", username);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 56 | `        throw new PasswordIncorrectException("Invalid credentials");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 57 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 58 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 59 | `    @PostMapping("/register")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: the registration page sends a new user here. The method prevents duplicate usernames, hashes the password, stores the user and returns the created account.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 60 | `    public ResponseEntity<?> register(@RequestBody User newUser) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 61 | `        logger.info("Registration attempt for username: {}", newUser.getUsername());` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 62 | `        if (newUser.getUsername() == null \\|\\| newUser.getPassword() == null \\|\\| newUser.getRole() == null \\|\\| newUser.getName() == null) {` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 63 | `            logger.warn("Registration failed: Missing required fields.");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 64 | `            throw new IllegalArgumentException("All fields are required (username, password, name, role)");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 65 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 66 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 67 | `        if (userRepository.findByUsername(newUser.getUsername()).isPresent()) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 68 | `            logger.warn("Registration failed: Username '{}' already exists.", newUser.getUsername());` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 69 | `            throw new UserAlreadyExistsException("Username already exists");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 70 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 71 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 72 | `        // Standardize roles for consistency in the frontend mapping` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 73 | `        String role = newUser.getRole().toLowerCase().trim();` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 74 | `        switch (role) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 75 | `            case "admin":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 76 | `            case "reservation agent":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 77 | `            case "ground staff":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 78 | `            case "flight dispatcher":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 79 | `            case "crew scheduler":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 80 | `            case "loyalty manager":` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 81 | `                newUser.setRole(role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 82 | `                break;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 83 | `            default:` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 84 | `                logger.warn("Registration failed: Invalid role '{}' specified.", role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 85 | `                throw new IllegalArgumentException("Invalid role specified");` | stops this invalid workflow and hands the failure to the project exception handler, which produces a safe HTTP response. |
| 86 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 87 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 88 | `        User savedUser = userRepository.save(newUser);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 89 | `        logger.info("User '{}' registered successfully with ID: {}", savedUser.getUsername(), savedUser.getId());` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 90 | `        return ResponseEntity.status(HttpStatus.CREATED).body(Map.of(` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 91 | `                "message", "User registered successfully",` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 92 | `                "userId", savedUser.getId()` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 93 | `        ));` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 94 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 95 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 96 | `    @GetMapping("/validate")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 97 | `    public String validateToken(@RequestParam("token") String token) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 98 | `        logger.info("Validating token...");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 99 | `        jwtUtils.validateToken(token);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 100 | `        logger.info("Token validated successfully.");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 101 | `        return "Token is valid";` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 102 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 103 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/config/JwtRequestFilter.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.config;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.auth.JwtUtils;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import jakarta.servlet.FilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import jakarta.servlet.ServletException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import jakarta.servlet.http.HttpServletRequest;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import jakarta.servlet.http.HttpServletResponse;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.beans.factory.annotation.Autowired;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.core.authority.SimpleGrantedAuthority;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.core.context.SecurityContextHolder;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.filter.OncePerRequestFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 16 | `import java.io.IOException;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 18 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 19 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 20 | `public class JwtRequestFilter extends OncePerRequestFilter {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 21 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 22 | `    @Autowired` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 23 | `    private JwtUtils jwtUtils;` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 24 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 25 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: every incoming protected request passes here before the controller. It extracts the Bearer JWT issued by Auth Service, validates it, puts the user/role into Spring Security, then continues the request chain.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 26 | `    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain chain)` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 27 | `            throws ServletException, IOException {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 28 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 29 | `        if ("OPTIONS".equalsIgnoreCase(request.getMethod())) {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 30 | `            chain.doFilter(request, response);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 31 | `            return;` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 32 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 33 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 34 | `        String requestTokenHeader = request.getHeader("Authorization");` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 35 | `        if (requestTokenHeader == null \\|\\| requestTokenHeader.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 36 | `            String tokenParam = request.getParameter("access_token");` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 37 | `            if (tokenParam != null && !tokenParam.isBlank()) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 38 | `                requestTokenHeader = "Bearer " + tokenParam;` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 39 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 41 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 42 | `        String username = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 43 | `        String jwtToken = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 44 | `        String role = null;` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 45 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 46 | `        if (requestTokenHeader != null && requestTokenHeader.startsWith("Bearer ")) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 47 | `            jwtToken = requestTokenHeader.substring(7);` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 48 | `            try {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 49 | `                username = jwtUtils.getUsernameFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 50 | `                role = jwtUtils.getRoleFromToken(jwtToken);` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 51 | `            } catch (Exception e) {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 52 | `                logger.error("JWT token verification failed: " + e.getMessage());` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 53 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 54 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 55 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 56 | `        if (username != null && SecurityContextHolder.getContext().getAuthentication() == null) {` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 57 | `            if (jwtUtils.validateToken(jwtToken, username)) {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 58 | `                SimpleGrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + (role != null ? role.toUpperCase().replace(" ", "_") : "USER"));` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 59 | `                UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 60 | `                        username, null, List.of(authority));` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 61 | `                usernamePasswordAuthenticationToken` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 62 | `                        .setDetails(new WebAuthenticationDetailsSource().buildDetails(request));` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 63 | `                SecurityContextHolder.getContext().setAuthentication(usernamePasswordAuthenticationToken);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 64 | `            }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 66 | `        chain.doFilter(request, response);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 67 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 68 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/config/SecurityConfig.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Security/infrastructure configuration. In this project, this file applies the common JWT security design: Auth Service issues tokens and this service accepts a valid Bearer token before protected requests reach controllers.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.config;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 3 | `import org.springframework.context.annotation.Bean;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 4 | `import org.springframework.context.annotation.Configuration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 5 | `import org.springframework.http.HttpMethod;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 6 | `import org.springframework.security.config.annotation.web.builders.HttpSecurity;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 7 | `import org.springframework.security.config.annotation.web.configurers.CsrfConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 8 | `import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 9 | `import org.springframework.security.config.http.SessionCreationPolicy;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 10 | `import org.springframework.security.web.SecurityFilterChain;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 11 | `import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 12 | `import org.springframework.web.cors.CorsConfiguration;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 13 | `import org.springframework.web.cors.CorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 14 | `import org.springframework.web.cors.UrlBasedCorsConfigurationSource;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 15 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 16 | `import java.util.List;` | brings in a framework/domain type required by this Security/infrastructure configuration; the imported API enables the behavior used below. |
| 17 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 18 | `@Configuration` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `public class SecurityConfig {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 21 | `    private final JwtRequestFilter jwtRequestFilter;` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 22 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 23 | `    public SecurityConfig(JwtRequestFilter jwtRequestFilter) {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 24 | `        this.jwtRequestFilter = jwtRequestFilter;` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 25 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 26 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 27 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 29 | `        return httpSecurity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 30 | `                .csrf(CsrfConfigurer::disable)` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 31 | `                .authorizeHttpRequests(requests ->` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 32 | `                        requests.requestMatchers(HttpMethod.OPTIONS, "/**").permitAll()` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 33 | `                                .requestMatchers("/api/auth/login", "/api/auth/register", "/api/auth/validate").permitAll()` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 34 | `                                .requestMatchers("/error").permitAll()` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 35 | `                                .anyRequest().authenticated()` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 36 | `                )` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 37 | `                .sessionManagement(session ->` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 38 | `                        session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 39 | `                )` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 40 | `                .cors(cors -> cors.configurationSource(corsConfigurationSource()))` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 41 | `                .formLogin(FormLoginConfigurer::disable)` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 42 | `                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class)` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 43 | `                .build();` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 46 | `    @Bean` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this configures who may call the API and from which browser origin. It is what makes the local frontend and JWT-protected backend work together.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 47 | `    public CorsConfigurationSource corsConfigurationSource() {` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 48 | `        CorsConfiguration config = new CorsConfiguration();` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 49 | `        // Allow all localhost variations for development` | source comment for maintainers; it documents ARFOMS intent but does not execute. |
| 50 | `        config.setAllowedOrigins(List.of(` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 51 | `                "http://localhost:5600",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 52 | `                "http://127.0.0.1:5600",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 53 | `                "http://localhost:5500",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 54 | `                "http://127.0.0.1:5500",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 55 | `                "http://localhost:8000",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 56 | `                "http://127.0.0.1:8000",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 57 | `                "http://localhost:8210",` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 58 | `                "http://localhost:63342",  // JetBrains IDE server` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 59 | `                "http://127.0.0.1:63342"` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 60 | `        ));` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 61 | `        config.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"));` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 62 | `        config.setAllowedHeaders(List.of("*"));` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 63 | `        config.setAllowCredentials(true);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 64 | `        config.setMaxAge(3600L);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 65 | `` | blank line only; it separates steps in this Security/infrastructure configuration file and changes no runtime behavior. |
| 66 | `        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();` | calculates or assigns data needed by this Security/infrastructure configuration in the Auth Service workflow. |
| 67 | `        source.registerCorsConfiguration("/**", config);` | this statement participates in the Auth Service Security/infrastructure configuration behavior described for this file. |
| 68 | `        return source;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 69 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 70 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/DataInitializer.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Supporting project code. This file supports the Auth Service role in the ARFOMS microservice system.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.auth.model.User;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 4 | `import com.genc.arfoms.auth.repository.UserRepository;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 5 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 6 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 7 | `import org.springframework.beans.factory.annotation.Value;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 8 | `import org.springframework.boot.CommandLineRunner;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 9 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 11 | `import java.util.Optional;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 12 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 13 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 14 | `public class DataInitializer implements CommandLineRunner {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 15 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    private final Logger logger = LoggerFactory.getLogger(DataInitializer.class);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 17 | `    private final UserRepository userRepository;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 18 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 19 | `    public DataInitializer(UserRepository userRepository) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 20 | `        this.userRepository = userRepository;` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 21 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 22 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 23 | `    @Override` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this startup seed logic ensures expected default users exist for development/demo login, without creating duplicate rows on each restart.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 24 | `    public void run(String... args) throws Exception {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 25 | `        logger.info("Initializing database with default users...");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 27 | `        upsertUser("admin", "Admin@123", "Administrator", "Admin");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 28 | `        upsertUser("scheduler", "Scheduler@123", "Flight Scheduler", "Flight Scheduler");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 29 | `        upsertUser("agent", "Agent@123", "Reservation Agent", "Reservation Agent");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 30 | `        upsertUser("crew", "Crew@123", "Crew Manager", "Crew Manager");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 31 | `        upsertUser("loyalty", "Loyalty@123", "Loyalty Manager", "Loyalty Manager");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 32 | `        upsertUser("groundstaff", "Ground@123", "Ground Staff", "Ground Staff");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 33 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 34 | `        logger.info("Database initialization completed.");` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 35 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 36 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this startup seed logic ensures expected default users exist for development/demo login, without creating duplicate rows on each restart.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 37 | `    private void upsertUser(String username, String password, String name, String role) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 38 | `        Optional<User> existingUser = userRepository.findByUsername(username);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 39 | `        if (existingUser.isPresent()) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 40 | `            User user = existingUser.get();` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 41 | `            user.setPassword(password);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 42 | `            user.setName(name);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 43 | `            user.setRole(role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 44 | `            userRepository.save(user);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 45 | `            logger.info("User '{}' updated successfully with role '{}'.", username, role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 46 | `            return;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 47 | `        }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 48 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 49 | `        User user = new User(username, password, name, role);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 50 | `        userRepository.save(user);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 51 | `        logger.info("User '{}' created successfully with role '{}'.", username, role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 52 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 53 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/dto/ResponseData.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Request/response data contract. In this project, this type defines data that crosses an API boundary. It keeps external request/response data separate from persistence entities where needed.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.dto;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |
| 3 | `public class ResponseData<T> {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 4 | `    private T data;` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 5 | `    private boolean success;` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 6 | `    private String message;` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 7 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 8 | `    public ResponseData() {}` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 9 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 10 | `    public ResponseData(T data, boolean success, String message) {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 11 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 12 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 13 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 14 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 15 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 16 | `    public T getData() {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 17 | `        return data;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 18 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 19 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public void setData(T data) {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 21 | `        this.data = data;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 22 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 24 | `    public boolean isSuccess() {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 25 | `        return success;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 26 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 27 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 28 | `    public void setSuccess(boolean success) {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 29 | `        this.success = success;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 30 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 31 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 32 | `    public String getMessage() {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 33 | `        return message;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 34 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 35 | `` | blank line only; it separates steps in this Request/response data contract file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 36 | `    public void setMessage(String message) {` | this statement participates in the Auth Service Request/response data contract behavior described for this file. |
| 37 | `        this.message = message;` | calculates or assigns data needed by this Request/response data contract in the Auth Service workflow. |
| 38 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/exception/GlobalExceptionHandler.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.exception;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.auth.dto.ResponseData;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 4 | `import org.slf4j.Logger;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 5 | `import org.slf4j.LoggerFactory;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 6 | `import org.springframework.http.HttpStatus;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 7 | `import org.springframework.http.ResponseEntity;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 8 | `import org.springframework.web.bind.annotation.ExceptionHandler;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 9 | `import org.springframework.web.bind.annotation.RestControllerAdvice;` | brings in a framework/domain type required by this Error-to-HTTP translation; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 11 | `@RestControllerAdvice` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class GlobalExceptionHandler {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 14 | `    private final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);` | calculates or assigns data needed by this Error-to-HTTP translation in the Auth Service workflow. |
| 15 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 16 | `    @ExceptionHandler(UserAlreadyExistsException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 17 | `    public ResponseEntity<ResponseData<Object>> handleUserAlreadyExistsException(UserAlreadyExistsException e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 18 | `        logger.warn("Username is Taken", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 19 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 20 | `                .status(HttpStatus.CONFLICT)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 21 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 22 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 23 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 24 | `    @ExceptionHandler(PasswordIncorrectException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    public ResponseEntity<ResponseData<Object>> handlePasswordIncorrectException(PasswordIncorrectException e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 26 | `        logger.warn("The Password Is Incorrect", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 27 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 28 | `                .status(HttpStatus.UNAUTHORIZED)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 29 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 30 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 31 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 32 | `    @ExceptionHandler(IllegalArgumentException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public ResponseEntity<ResponseData<Object>> handleIllegalArgumentException(IllegalArgumentException e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 34 | `        logger.warn("Invalid Argument", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 35 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 36 | `                .status(HttpStatus.BAD_REQUEST)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 37 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 38 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 39 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 40 | `    @ExceptionHandler(java.util.NoSuchElementException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 41 | `    public ResponseEntity<ResponseData<Object>> handleNoSuchElementException(java.util.NoSuchElementException e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 42 | `        logger.warn("Element not found", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 43 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `                .status(HttpStatus.NOT_FOUND)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 45 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 46 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 47 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 48 | `    @ExceptionHandler(IllegalStateException.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 49 | `    public ResponseEntity<ResponseData<Object>> handleIllegalStateException(IllegalStateException e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 50 | `        logger.warn("Invalid State", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 51 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 52 | `                .status(HttpStatus.CONFLICT)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 53 | `                .body(new ResponseData<>(null, false, e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 54 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 55 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 56 | `    @ExceptionHandler(Exception.class)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 57 | `    public ResponseEntity<ResponseData<Object>> handleGeneric(Exception e) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 58 | `        logger.error("Internal Server Error", e);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 59 | `        return ResponseEntity` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 60 | `                .status(HttpStatus.INTERNAL_SERVER_ERROR)` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 61 | `                .body(new ResponseData<>(null, false, "Internal Server Error : " + e.getMessage()));` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 62 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 63 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/exception/PasswordIncorrectException.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.exception;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `public class PasswordIncorrectException extends RuntimeException {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 4 | `    public PasswordIncorrectException(String message) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 5 | `        super(message);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 6 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/exception/UserAlreadyExistsException.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Error-to-HTTP translation. In this project, this file turns domain failures into consistent HTTP error responses so the frontend receives an understandable status/message instead of a raw stack trace.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.exception;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Error-to-HTTP translation file and changes no runtime behavior. |
| 3 | `public class UserAlreadyExistsException extends RuntimeException {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 4 | `    public UserAlreadyExistsException(String message) {` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 5 | `        super(message);` | this statement participates in the Auth Service Error-to-HTTP translation behavior described for this file. |
| 6 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 7 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/JwtUtils.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Supporting project code. This file supports the Auth Service role in the ARFOMS microservice system.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 3 | `import io.jsonwebtoken.Claims;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 4 | `import io.jsonwebtoken.Jwts;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 5 | `import io.jsonwebtoken.security.Keys;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 6 | `import org.springframework.beans.factory.annotation.Value;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 7 | `import org.springframework.stereotype.Component;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 9 | `import javax.crypto.SecretKey;` | brings in a framework/domain type required by this Supporting project code; the imported API enables the behavior used below. |
| 10 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 11 | `@Component` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 12 | `public class JwtUtils {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 13 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 14 | `    @Value("${jwt.secret:404E635266556A586E3272357538782F413F4428472B4B6250645367566B5970}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 15 | `    private String secret;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 16 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |
| 17 | `    @Value("${jwt.expiration:86400000}")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 18 | `    private long expiration;` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 19 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 20 | `    public String generateToken(String username, String role) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 21 | `        java.util.Map<String, Object> claims = new java.util.HashMap<>();` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 22 | `        claims.put("role", role);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 23 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 24 | `        return Jwts.builder()` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 25 | `                .setClaims(claims)` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 26 | `                .setSubject(username)` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 27 | `                .setIssuedAt(new java.util.Date(System.currentTimeMillis()))` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 28 | `                .setExpiration(new java.util.Date(System.currentTimeMillis() + expiration))` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 29 | `                .signWith(key, io.jsonwebtoken.SignatureAlgorithm.HS256)` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 30 | `                .compact();` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 31 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 32 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 33 | `    public String getUsernameFromToken(String token) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 34 | `        return getAllClaimsFromToken(token).getSubject();` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 35 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 36 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 37 | `    public String getRoleFromToken(String token) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 38 | `        return getAllClaimsFromToken(token).get("role", String.class);` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 39 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 40 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 41 | `    public boolean validateToken(String token, String username) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 42 | `        final String extractedUsername = getUsernameFromToken(token);` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 43 | `        return (extractedUsername.equals(username));` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    public void validateToken(final String token) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 47 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 48 | `        Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token);` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 49 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 50 | `` | blank line only; it separates steps in this Supporting project code file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is part of the JWT contract. Auth Service uses token creation at login; service-side copies read/validate the same claims so a logged-in user can call flight and booking endpoints.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 51 | `    private Claims getAllClaimsFromToken(String token) {` | this statement participates in the Auth Service Supporting project code behavior described for this file. |
| 52 | `        SecretKey key = Keys.hmacShaKeyFor(secret.getBytes());` | calculates or assigns data needed by this Supporting project code in the Auth Service workflow. |
| 53 | `        return Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 54 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 55 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/model/User.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Database/domain model. In this project, this type represents data owned by Auth Service. JPA annotations map it to MySQL tables, while the rest of the service uses it as the business object.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.model;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 3 | `import jakarta.persistence.*;` | brings in a framework/domain type required by this Database/domain model; the imported API enables the behavior used below. |
| 4 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 5 | `@Entity` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 6 | `@Table(name = "users")` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 7 | `public class User {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 8 | `    @Id` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 9 | `    @GeneratedValue(strategy = GenerationType.IDENTITY)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `    private Long id;` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 11 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 12 | `    @Column(unique = true, nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 13 | `    private String username;` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 14 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 15 | `    @Column(nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 16 | `    private String password;` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 17 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 18 | `    @Column(nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 19 | `    private String name;` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 20 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 21 | `    @Column(nullable = false)` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 22 | `    private String role;` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 23 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |
| 24 | `    // Default constructor for JPA` | source comment for maintainers; it documents ARFOMS intent but does not execute. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 25 | `    public User() {}` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 26 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 27 | `    public User(String username, String password, String name, String role) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 28 | `        this.username = username;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 29 | `        this.password = password;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 30 | `        this.name = name;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 31 | `        this.role = role;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 32 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 33 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 34 | `    public Long getId() {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 35 | `        return id;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 36 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 37 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 38 | `    public void setId(Long id) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 39 | `        this.id = id;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 40 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 41 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 42 | `    public String getUsername() {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 43 | `        return username;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 44 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 45 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 46 | `    public void setUsername(String username) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 47 | `        this.username = username;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 48 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 49 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 50 | `    public String getPassword() {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 51 | `        return password;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 52 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 53 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 54 | `    public void setPassword(String password) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 55 | `        this.password = password;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 56 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 57 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 58 | `    public String getName() {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 59 | `        return name;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 60 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 61 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 62 | `    public void setName(String name) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 63 | `        this.name = name;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 64 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 65 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 66 | `    public String getRole() {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 67 | `        return role;` | returns this result to the caller in the Auth Service workflow; a controller may serialize it to the frontend or another service method may use it next. |
| 68 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 69 | `` | blank line only; it separates steps in this Database/domain model file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this method is a focused part of the Auth Service implementation. Its caller uses it to complete the surrounding business workflow shown by the controller/service class.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 70 | `    public void setRole(String role) {` | this statement participates in the Auth Service Database/domain model behavior described for this file. |
| 71 | `        this.role = role;` | calculates or assigns data needed by this Database/domain model in the Auth Service workflow. |
| 72 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 73 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/java/com/genc/arfoms/auth/repository/UserRepository.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Persistence/repository layer. In this project, this interface is Spring Data JPA's database access point. The service layer uses it to load and persist ARFOMS records without writing SQL for normal queries.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.auth.repository;` | places this code in the ARFOMS Auth Service namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 3 | `import com.genc.arfoms.auth.model.User;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 4 | `import org.springframework.data.jpa.repository.JpaRepository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 5 | `import org.springframework.stereotype.Repository;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 6 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 7 | `import java.util.Optional;` | brings in a framework/domain type required by this Persistence/repository layer; the imported API enables the behavior used below. |
| 8 | `` | blank line only; it separates steps in this Persistence/repository layer file and changes no runtime behavior. |
| 9 | `@Repository` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 10 | `public interface UserRepository extends JpaRepository<User, Long> {` | this statement participates in the Auth Service Persistence/repository layer behavior described for this file. |
| 11 | `    Optional<User> findByUsername(String username);` | this statement participates in the Auth Service Persistence/repository layer behavior described for this file. |
| 12 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |

</details>

<details>
<summary><strong>auth-service/src/main/resources/application.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `spring.application.name=auth-service` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.config.import=optional:configserver:http://localhost:8888` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

<details>
<summary><strong>auth-service/src/main/resources/log4j2.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Runtime configuration. In this project, these settings control ports, database connectivity, Eureka registration, logging or Gateway routing at runtime.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `status = warn` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `name = ARFOMSLogConfig` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 4 | `property.logDir = logs` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 5 | `property.appName = auth-service` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 6 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 7 | `appenders = console, rolling` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 8 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 9 | `appender.console.type = Console` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 10 | `appender.console.name = Console` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 11 | `appender.console.layout.type = PatternLayout` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 12 | `appender.console.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 13 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 14 | `appender.rolling.type = RollingFile` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 15 | `appender.rolling.name = RollingFile` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 16 | `appender.rolling.fileName = ${logDir}/${appName}.log` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 17 | `appender.rolling.filePattern = ${logDir}/${appName}.%d{yyyy-MM-dd}.%i.log.gz` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 18 | `appender.rolling.layout.type = PatternLayout` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 19 | `appender.rolling.layout.pattern = %d{yyyy-MM-dd HH:mm:ss.SSS} %-5level [%t] %c{36} - %msg%n` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 20 | `appender.rolling.policies.type = Policies` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 21 | `appender.rolling.policies.time.type = TimeBasedTriggeringPolicy` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 22 | `appender.rolling.policies.size.type = SizeBasedTriggeringPolicy` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 23 | `appender.rolling.policies.size.size = 10MB` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 24 | `appender.rolling.strategy.type = DefaultRolloverStrategy` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 25 | `appender.rolling.strategy.max = 14` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 26 | `` | blank line only; it separates steps in this Runtime configuration file and changes no runtime behavior. |
| 27 | `rootLogger.level = info` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 28 | `rootLogger.appenderRefs = console, rolling` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 29 | `rootLogger.appenderRef.console.ref = Console` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 30 | `rootLogger.appenderRef.rolling.ref = RollingFile` | this setting controls how Auth Service participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

## API Service (API Gateway) - `api-gateway`


This is the frontend entry point. It forwards browser paths to the right registered service so the frontend normally talks only to port 8210.

<details>
<summary><strong>api-gateway/pom.xml</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Maven build and dependency configuration. In this project, Maven reads this file to assemble this service with Spring Boot, Spring Cloud and database/security libraries needed by its role.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 2 | `         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 3 | `    <modelVersion>4.0.0</modelVersion>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 4 | `    <parent>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 5 | `        <groupId>com.genc.arfoms</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 6 | `        <artifactId>arfoms-microservices</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 7 | `        <version>1.0.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 8 | `        <relativePath>../pom.xml</relativePath>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 9 | `    </parent>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 10 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 11 | `    <artifactId>api-gateway</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 12 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 13 | `    <!--` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 14 | `        Pin the security artifacts to the locally cached Spring Boot 4.1.0 /` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 15 | `        Spring Security 7.1.0 train so transitive resolution does not fall back` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 16 | `        to the uncached 4.0.x security POMs managed by the reactor BOM.` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 17 | `    -->` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 18 | `    <dependencyManagement>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 19 | `        <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 20 | `            <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 21 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 22 | `                <artifactId>spring-boot-security</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 23 | `                <version>4.1.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 24 | `            </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 25 | `            <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 26 | `                <groupId>org.springframework.security</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 27 | `                <artifactId>spring-security-web</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 28 | `                <version>7.1.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 29 | `            </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 30 | `            <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 31 | `                <groupId>org.springframework.security</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 32 | `                <artifactId>spring-security-config</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 33 | `                <version>7.1.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 34 | `            </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 35 | `            <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 36 | `                <groupId>org.springframework.security</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 37 | `                <artifactId>spring-security-core</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 38 | `                <version>7.1.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 39 | `            </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 40 | `            <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 41 | `                <groupId>org.springframework.security</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 42 | `                <artifactId>spring-security-crypto</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 43 | `                <version>7.1.0</version>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 44 | `            </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 45 | `        </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 46 | `    </dependencyManagement>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 47 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 48 | `    <dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 49 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 50 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 51 | `            <artifactId>spring-cloud-starter-gateway-server-webflux</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 52 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 53 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 54 | `        <!-- Eureka discovery client + Spring Cloud LoadBalancer (for lb:// routing). -->` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 55 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 56 | `            <groupId>org.springframework.cloud</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 57 | `            <artifactId>spring-cloud-starter-netflix-eureka-client</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 58 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 59 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 60 | `        <dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 61 | `            <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 62 | `            <artifactId>spring-boot-starter-test</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 63 | `            <scope>test</scope>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 64 | `        </dependency>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 65 | `    </dependencies>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 66 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |
| 67 | `    <build>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 68 | `        <plugins>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 69 | `            <plugin>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 70 | `                <groupId>org.springframework.boot</groupId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 71 | `                <artifactId>spring-boot-maven-plugin</artifactId>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 72 | `            </plugin>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 73 | `        </plugins>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 74 | `    </build>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 75 | `</project>` | Maven reads this build setting to provide the library/plugin/version needed by API Service (API Gateway). |
| 76 | `` | blank line only; it separates steps in this Maven build and dependency configuration file and changes no runtime behavior. |

</details>

<details>
<summary><strong>api-gateway/src/main/java/com/genc/arfoms/gateway/ApiGatewayApplication.java</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Service bootstrap. In this project, this is the executable entry point. Running it starts this independently deployable Spring Boot microservice.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `package com.genc.arfoms.gateway;` | places this code in the ARFOMS API Service (API Gateway) namespace, allowing Spring scanning and Java type organization to work consistently. |
| 2 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 3 | `import org.springframework.boot.SpringApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 4 | `import org.springframework.boot.autoconfigure.SpringBootApplication;` | brings in a framework/domain type required by this Service bootstrap; the imported API enables the behavior used below. |
| 5 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |
| 6 | `@SpringBootApplication` | this annotation gives Spring/JPA metadata. In ARFOMS it tells the framework how to expose, secure, inject, persist or discover the following code. |
| 7 | `public class ApiGatewayApplication {` | this statement participates in the API Service (API Gateway) Service bootstrap behavior described for this file. |
| 8 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

#### Why this method matters

Why/how in ARFOMS: this is the process entry point used when the API Service (API Gateway) application is launched. It hands control to Spring Boot, which creates beans, loads Config Server properties and starts the HTTP server.


| Line | Actual code | What it means in this project |
|---:|---|---|
| 9 | `    public static void main(String[] args) {` | this statement participates in the API Service (API Gateway) Service bootstrap behavior described for this file. |
| 10 | `        SpringApplication.run(ApiGatewayApplication.class, args);` | this statement participates in the API Service (API Gateway) Service bootstrap behavior described for this file. |
| 11 | `    }` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 12 | `}` | structural brace delimiting the current method/class; it keeps the preceding ARFOMS behavior inside its intended scope. |
| 13 | `` | blank line only; it separates steps in this Service bootstrap file and changes no runtime behavior. |

</details>

<details>
<summary><strong>api-gateway/src/main/resources/application.properties</strong> - open the complete line-by-line explanation</summary>


**At a glance:** Local Config Server bootstrap configuration. In this project, these minimal local settings give the service its identity and tell it where to obtain the rest of its configuration (Config Server on port 8888).


| Line | Actual code | What it means in this project |
|---:|---|---|
| 1 | `spring.application.name=api-gateway` | this setting controls how API Service (API Gateway) participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 2 | `spring.config.import=optional:configserver:http://localhost:8888` | this setting controls how API Service (API Gateway) participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |
| 3 | `spring.cloud.openfeign.okhttp.enabled=true` | this setting controls how API Service (API Gateway) participates in the ARFOMS deployment (identity, port, database, discovery, route or logging behavior). |

</details>

