https://spring.io/quickstart

- `@GetMapping("/hello")`:tells Spring to use our `hello()` method to answer requests that get sent to the `http://localhost:8080/hello` address
- `@RestController` annotation tells Spring that this code describes an endpoint that should be made available over the web
- `@RequestParam` is telling Spring to expect a `name` value in the request, but if it’s not there, it will use the word “World” by default.



#### MVC

- Fundamental pattern for web app development
- Model = data, View = the visual display that is populated, Controller = wires View + Model

#### Spring Controller

- Spring bean
- Annotated for the servlet mapping
- Responds to incoming web requests
- Outputs a view or raw data

#### Template Engines

- Spring supports several
- Thymeleaf - most popular
- Provides a DSL for HTML, leaving raw HTML documents
- Placeholders for dynamic data
- Rendering engine allows for final product



## Spring Material

### Beginner

https://www.lynda.com/Spring-tutorials/Learning-Spring-Spring-Boot/2824009-2.html?org=lapl.org

>Turbocharge your back-end Java RESTful API development with Spring Boot and Spring Data technologies. This course is intended for experienced Java developers who want to rapidly build microservices that connect with relational databases via the Java Persistence API (JPA). Here, Mary Ellen Bowman walks you through a step-by-step process for building a microservice with an exposed RESTful API featuring HATEOAS, paging, sorting, and CrudRepository interfaces. Learn about technologies such as Spring Boot, Spring Data JPA, Spring Data REST, and Spring Web MVC @RestController

### Intermediate

https://www.lynda.com/Spring-tutorials/Spring-Boot-2-Essential-Training/761958-2.html?org=lapl.org

Frank shows how to initialize, package, and run Spring Boot web apps and CLI apps, and use the library of common starter projects to fill business-critical needs: data, messaging, security, and more. Plus, find how to extend Spring Boot by creating your own starters and use the Actuator module's HTTP endpoints to monitor and manage your apps.

Topics include:

- Creating a Spring Boot application
- Configuring a Spring Boot app
- Leveraging profiles
- Packaging and running Spring Boot web apps
- Building a command-line application
- Using Spring Boot starters: Spring Data, Spring Security, and more
- Extending Spring Boot
- Using Spring Boot Actuator to monitor app health and other metrics

https://www.lynda.com/Spring-Framework-tutorials/Spring-Framework-Depth/2822410-2.html?org=lapl.org

- Configuring the ApplicationContext (the interface for accessing components, loading files, publishing events, and more)
- The beans (objects within the Spring IOC container)
- aspect-oriented programming

https://www.lynda.com/Spring-tutorials/Creating-Your-First-Spring-Boot-Microservice/2252224-2.html?org=lapl.org

> Here, Mary Ellen Bowman walks you through a step-by-step process for building a microservice with an exposed RESTful API featuring HATEOAS, paging, sorting, and CrudRepository interfaces. Learn about technologies such as Spring Boot, Spring Data JPA, Spring Data REST, and Spring Web MVC @RestController

https://www.lynda.com/Spring-tutorials/Spring-Spring-MVC/2804074-2.html?org=lapl.org

https://www.lynda.com/Spring-Framework-tutorials/Spring-Spring-Data/580662-2.html?org=lapl.org

https://www.lynda.com/Spring-tutorials/Spring-Messaging-JMS/697735-2.html?org=lapl.org

https://www.lynda.com/Spring-tutorials/Spring-Test-Driven-Development-JUnit/614314-2.html?org=lapl.org

https://www.lynda.com/Web-tutorials/Spring-Spring-Security/704153-2.html?org=lapl.org

### Build products:

https://www.lynda.com/Spring-tutorials/Building-Reactive-App-Angular-Spring-Boot-2/5025108-2.html?org=lapl.org

https://www.lynda.com/Spring-Framework-tutorials/Building-Full-Stack-App-Angular-2-Spring-Boot/573416-2.html?org=lapl.org



## Java EE

https://www.lynda.com/Java-tutorials/Learning-Java-Enterprise-Edition/516591-2.html

> Turbocharge your back-end Java RESTful API development with Spring Boot and Spring Data technologies. This course is intended for experienced Java developers who want to rapidly build microservices that connect with relational databases via the Java Persistence API (JPA). Here, Mary Ellen Bowman walks you through a step-by-step process for building a microservice with an exposed RESTful API featuring HATEOAS, paging, sorting, and CrudRepository interfaces. Learn about technologies such as Spring Boot, Spring Data JPA, Spring Data REST, and Spring Web MVC @RestController

